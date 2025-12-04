packData={}

function tryObjectEnter(enter_object)
 if Global.GetTable("PPacks").on==false then return true end
 return false
end

function onObjectLeaveContainer(cont,leaving)
 settings=Global.GetTable("PPacks")or{energy=1,on=true,spread=false,APICalls=3,hundred=false,debug=false}
 if cont~=self or settings.on==false then return end

 if not settings then
  Global.SetTable("PPacks",settings)
 end

 if not settings.rand then
  local globalMath=Global.getVar("math")
  Global.setVar("PPacks.rand",globalMath.random)
 end

 packPos=self.getPosition()
 cardRot=self.getRotation()
 cardRot[3]=cardRot[3]+180
 ProcessPack()
 leaving.destruct()
 self.destruct()
end

function ProcessPack()
 local packs=1
 if settings.hundred then packs=100 end
 openPack(packs)
end

function getSlotFromRatio(slot,ratio)
 local slotpos=1
 local rand=math.random()
 for f=1,#ratio do
  rand=rand-ratio[f]
  if rand<=0 then
   return slot[slotpos]
  end
  slotpos=slotpos+1
 end
 return slot[slotpos]
end

function setBoxData()
 math.randomseed(boxID)
 local box={}
 for c=1,#boxPulls do
  local nums={}
  local total=0
  box[c]={}
  if boxPulls[c].rates then
   for d=1,#boxPulls[c].rates do
    local rate=boxPulls[c].rates[d]
    numToAdd=getBoxPullNum(rate.chances)
    total=total+numToAdd
    if rate.ratio then
     for e=1,numToAdd do
      local slotNum=getSlotFromRatio(rate.slot,rate.ratio)
      if not nums[slotNum]then nums[slotNum]=0 end
      nums[slotNum]=nums[slotNum]+1
     end
    else
     nums[rate.slot]=numToAdd
    end
   end
   if total>36 then total=36 end
   local packs={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36}
   local targets=randomFromTable(packs,total,#packs,false)
   count=1
   for k,v in pairs(nums)do
    for d=1,nums[k] do
     box[c][targets[count]]=k
     count=count+1
    end
   end
  end
  for d=1,36 do
   if not box[c][d]then
    if boxPulls[c].otherRat then
     box[c][d]=getSlotFromRatio(boxPulls[c].other,boxPulls[c].otherRat)
    else
     box[c][d]=boxPulls[c].other
    end
   end
  end
 end
 Global.SetTable("PPBoxChances["..tostring(boxID).."]",box)
 return box
end

function openPack(packs)
 packData=getDeckData(packPos,cardRot,true)
 packFlag=false
 local slotsAdded={}
 local godPack=false
 if godChance and(settings.allGods or Global.call("PPacks.rand")<godChance)then
  godPack=true
 end
 if boxID and boxPulls then
  local box=Global.GetTable("PPBoxChances["..tostring(boxID).."]")
  if not box then
   box=setBoxData()
  end
  for rate=1,#box do
   AddToSlotsAdded(slotsAdded,box[rate][packNum])
  end
 else
  for b=1,#pullRates do
   if not(pullRates[b].noGod and godPack)then
    for c=1,pullRates[b].num do
     slotsAdded=doPullRates(pullRates[b].rates,slotsAdded)
    end
   end
  end
 end
 if godPack and not godSlot then
  addGodPack(packs)
 end
 for b=1,#dropSlots do
  local choices=chooseCards(dropSlots[b],slotsAdded[b]or 0)
  for c=1,#choices do
   addCard(choices[c],getCardData(choices[c]))
  end
  if godPack and godSlot and godSlot==b then
   addGodPack(packs)
  end
 end
 Wait.frames(function()createPack(packs)end,1)
end

function getCardData(num)
 if startsWith(num,"E")then
  return energy[num:sub(2)]
 elseif num=="VStar"then
  return energy["VStar"]
 end
 return cardData[num]
end

function getTrueNumber(num,card)
 if card.num then return card.num end
 if startsWith(num,"E")then return num:sub(2)else return num end
end

function removeLeadingZeros(num)
 if tonumber(num)then return string.format("%u", num)else return num end
end

function getDeckID(num,card)
 return card.ID or DeckID+tonumber(getTrueNumber(num,card))
end

function addCard(num,card)
 packData.DeckIDs[#packData.DeckIDs+1]=getDeckID(num,card)*100
 packData.CustomDeck[getDeckID(num,card)]=getCustomData(getTrueNumber(num,card),card)
 packData.ContainedObjects[#packData.ContainedObjects+1]=getCardTable(packData.Transform,num,card)
end

function getCardTable(trans,num,card)
 local des=card.setName
 if not des then
  if subSetID and startsWith(num,subSetPre)then
   des=subSetName
  else
   des=setName
  end
 end
 if card.num!=""then
  des=des.." #"..getTrueNumber(num,card)
 end
 if card.rar then
  des=des.." "..card.rar
 end
 return{Name="CardCustom",
 Transform=trans,
 Nickname=card.name,
 Description=des,
 GMNotes=card.GMN,
 Memo=(card.date or date)..buildCardNumber(num,3),
 CardID=getDeckID(num,card)*100,
 CustomDeck={[getDeckID(num,card)]=getCustomData(num,card)},
 LuaScriptState=card.typ
}
end

function getCustomData(num,card)
 local image=card.image
 if not image then
  if card.steamUrl then
   image=getSteamUrl(card.steamUrl)
  else
   local ID=setID
   if subSetID and startsWith(num,subSetPre) then
    ID=subSetID
   end
   image="https://images.pokemontcg.io/"..ID.."/"..removeLeadingZeros(getTrueNumber(num,card)).."_hires.png?count="..buildCardNumber(num,1)
  end
 end
 return{FaceURL=image,
  BackURL=card.back or"https://steamusercontent-a.akamaihd.net/ugc/809997459557414686/9ABD9158841F1167D295FD1295D7A597E03A7487/",
  NumWidth=1,
  NumHeight=1,
  BackIsHidden=true
 }
end

function buildCardNumber(cardNum,minDigit)
 if cardNum then
  local numOnly=string.gsub(cardNum,"[^%d]","")
  if numOnly~=cardNum then
   local finalNum=(tonumber(numOnly)or 0)+500
   for c in cardNum:gmatch"[^%d]" do
    if c=="?"then c="}"end
    if c=="!"then c="{"end
    finalNum=string.byte(c)-65+finalNum
   end
   cardNum=tostring(finalNum)
  end
 else
  cardNum="0"
 end
 addDigits(cardNum,minDigit)
 return cardNum
end

function addDigits(str,minDigit)
 while #str<minDigit do str="0"..str end
 return str
end

function addGodPack(packs)
 local packChoice=godPacks[randomFromRange(1,#godPacks)]
 for c=1,#packChoice do
  addCard(packChoice[c],getCardData(packChoice[c]))
 end
end

function createPack(packs)
 local deck=spawnObjectData({data=packData})
 if settings.spread then Wait.frames(function()deck.spread(2.25)end,1)end
 if packs>1 then
  packPos[2]=packPos[2]+2
  Wait.frames(function()openPack(packs-1)end,1)
 end
end

function getDeckData(spawnPos,cardRot,hands)
 return {Name="Deck",
  Transform={posX=spawnPos[1],posY=spawnPos[2],posZ=spawnPos[3],rotX=cardRot[1],rotY=cardRot[2],rotZ=cardRot[3],scaleX=1,scaleY=1,scaleZ=1},
  Hands=hands,
  DeckIDs={},
  CustomDeck={},
  ContainedObjects={}
 }
end

function getBoxPullNum(chances)
 local rand=math.random()
 for e=1,#chances do
  rand=rand-(chances[e].odds or 1)
  if rand<=0 then
   return chances[e].num
  end
 end
 return 0
end

function AddToSlotsAdded(slotsAdded,slot)
 if not slotsAdded[slot]then slotsAdded[slot]=0 end
 slotsAdded[slot]=slotsAdded[slot]+1
 return slotsAdded
end

function doPullRates(rates,slotsAdded)
 local rand=Global.call("PPacks.rand")
 local initrand=rand
 for c=1,#rates do
  if not(packFlag and rates[c].flagExclude)then
   if rates[c].remaining then rand=initrand-(rates[c].odds or 1)else rand=rand-(rates[c].odds or 1)end
   if rand<=0 and(settings.energy!=2 or not dropSlots[rates[c].slot].energy)then
    AddToSlotsAdded(slotsAdded,rates[c].slot)
    if rates[c].flag then packFlag=true end
    return slotsAdded
   end
  end
 end
 return slotsAdded
end

function chooseCards(slot,added)
 local choices={}
 if not slot.energy or settings.energy==1 then
  if settings.slotTest then
   choices=randomFromTable(slot.cards,1,slot.size,true,slot.prefix,slot.digits)
  elseif slot.fixed then
   local deckPos=randomFromRange(1,#slot.cards,true)
   for c=1,slot.num+added do
    choices[c]=slot.cards[deckPos]
    if deckPos==#slot.cards then deckPos=1 else deckPos=deckPos+1 end
   end
  else
  choices=randomFromTable(slot.cards,slot.num+added,slot.size,true,slot.prefix,slot.digits)
  end
 end
 return choices
end

function randomFromTable(options,num,size,useGlobal,prefix,digits)
 local choices={}
 local chosen={}
 while #choices<num do
  local choice=nil
  if size then
   choice=chooseRandCard(options,size,useGlobal)
  else
   if useGlobal then
    choice=options[randomFromRange(1,#options)]
   else
    choice=options[math.random(1,#options)]
   end
  end
  if digits then choice=addDigits(choice,digits) end
  if prefix then choice=prefix..choice end
  if not chosen[choice]then
   chosen[choice]=true
   choices[#choices+1]=choice
  end
 end
 return choices
end

function chooseRandCard(cards,size,useGlobal)
 local rand=nil
 if useGlobal then
  rand=randomFromRange(0,size-1)
 else
  rand=math.random(0,size-1)
 end
 for c=1,#cards do
  if type(cards[c])=="table"then
   local size=tonumber(cards[c][2])-tonumber(cards[c][1])+1
   if rand>=size then rand=rand-size else return tostring(tonumber(cards[c][1])+rand) end
  else
   if rand==0 then return cards[c]else rand=rand-1 end
  end
 end
end

function randomFromRange(low,high)--Credit dzikakulka
 local rand=Global.call("PPacks.rand")
 local scale=high-low+1
 return math.floor(low+rand*scale)
end

function startsWith(input,prefix)
 if not prefix then return false end
 return string.sub(input,1,#prefix)==prefix
end

function getSteamUrl(url)
 if url then return"https://steamusercontent-a.akamaihd.net/ugc/"..url.."/"end
end
