art={
}
setName=
DeckID=
date=
setID=
subSetID=
subSetPre=
subSetName=
cardData=
dropSlots=[[{
}]]
pullRates=[[{
}]]
cardString="cardData={}"
energyString="energy={}"

boxScript=[[
 function onLoad(state)
 curColumn=tonumber(state)or 9
 local params={
  function_owner=self,
  font_size=180,
  width=1500,
  height=220,
  position={0,1,3.5},
  tooltip="The number of packs per column",
  value=tostring(curColumn),
  alignment=3,
  input_function="SetColumn",
  font_color={0,0,0},
 }
 self.createInput(params)
 butWrapper(params,{0,1,2.5},"Spread Compact","Spreads the contained objects close together","SpreadCompact")
 butWrapper(params,{0,1,3},"Spread Wide","Spreads the packs wide enough to not collide when opening.","SpreadWide")
end

function butWrapper(params,pos,label,tool,func)
 params.position=pos
 params.label=label
 params.tooltip=tool
 params.click_function=func
 self.createButton(params)
end

function SetColumn(obj,color,value,selected)
 if not selected then
  curColumn=checkIfNum(value,1000,curColumn,color)
  self.script_state=tostring(curColumn)
  return tostring(curColumn)
 end
end

function checkIfNum(value,max,current,color)
 local numValue=tonumber(value)
 if numValue!=nil then
  numValue=math.floor(numValue)
  if numValue>0 then
   if numValue<=max then return numValue else broadcastToColor("Enter a lower number.",color,{1,0,0})end
  else broadcastToColor("Enter a number above 0.",color,{1,0,0})end
 else broadcastToColor("Enter a number.",color,{1,0,0})end
 return current
end

function SpreadCompact()
 Spread(-4)
end

function SpreadWide()
 Spread(-50)
end

function Spread(width)
 for c,pack in pairs(self.getObjects())do
  self.takeObject({position=self.positionToWorld({width*math.floor((c-1)/curColumn),1,7+6*((c-1)%curColumn)}),smooth=true})
 end
end
]]

packData={}

function onObjectLeaveContainer(cont,leaving)
 if cont~=self then return end
 leaving.setCustomObject({diffuse=getRandomArt()})
 leaving.setLuaScript(cardString.."\n"..leaving.getLuaScript())
 leaving.setLuaScript(energyString.."\n"..leaving.getLuaScript())
 leaving.setLuaScript(dataString.."\n"..leaving.getLuaScript())
end

function onNumberTyped(color,num)--credit Eldin
 for x=1,num do Wait.frames(function()self.deal(1,color)end,x)end
 return true
end

function makeDataString()
 local str='\ndataString=[[\ndropSlots='..dropSlots..'\npullRates='..pullRates..'\nsetName="'..setName..'"\nsetID="'..setID..'"\nDeckID="'..DeckID..'"\ndate="'..date..'"\n'
 if subSetID then
  str=str..'\nsubSetName="'..subSetName..'"\nsubSetID="'..subSetID..'"\nsubSetPre="'..subSetPre..'"\n'
 end if godChance then
  str=str..'\ngodChance='..tostring(godChance)..'\ngodSlot='..tostring(godSlot)..'\ngodPacks='..godPacks..'\n'
 end
 str=str.."]]"
 self.setLuaScript(self.getLuaScript()..str)
 self.Reload()
end

function onLoad(state)
 settings=Global.GetTable("PPacks")
 if state and state~="" then
  state=json.parse(state)
  curSet=state.set or 1
 else
  curSet=1
 end
 if not settings then
  if state.settings then settings=state.settings else settings={energy=1,on=true,spread=false,hundred=false,debug=false,slotTest=false,allGods=false}end
  Global.SetTable("PPacks",settings)
 end
 self.max_typed_number=99
 saveData()
 setUpButtons()
 if not cardData then
  self.setLuaScript(self.getLuaScript()..cardString)
  makeDataString()
 end
end

function setUpButtons()
 local params={
 function_owner=self,
 width=3500,
 height=500,
 font_size=450,
 }
 butWrapper(params,{0,0.1,3},'Get Whole Set',"","getSet")
 if pullRates and not noBox then
  butWrapper(params,{0,0.1,4},'Get a Box',"","getBox")
 end
end

function butWrapper(params,pos,label,tool,func)
 params.position=pos
 params.label=label
 params.tooltip=tool
 params.click_function=func
 self.createButton(params)
end

function getSet(obj,color,alt)
 local spawnPos=self.positionToWorld({0,1,7})
 packData=getDeckData(spawnPos,self.getRotation(),false)
 for num,card in pairs(cardData) do
  addCard(num,card)
 end
 local deck=spawnObjectData({data=packData})
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
 while #cardNum<minDigit do cardNum="0"..cardNum end
 return cardNum
end

function getBox(obj,color,alt)
 local spawnPos=self.positionToWorld({0,1,7})
 local boxRot=self.GetRotation()
 local boxTrans={posX=spawnPos[1],posY=spawnPos[2],posZ=spawnPos[3],rotX=boxRot.x,rotY=boxRot.y,rotZ=boxRot.z,scaleX=0.5,scaleY=0.5,scaleZ=0.5}
 boxData={Name="Custom_Model_Bag",
  Transform=boxTrans,
  CustomMesh=self.getData().CustomMesh,
  ContainedObjects={},
  LuaScript=boxScript
 }
 boxData.CustomMesh.TypeIndex=6
 selfRot=self.GetRotation()
 packScript=cardString..energyString..dataString..self.getData().ContainedObjects[1].LuaScript
 if boxPulls then
  boxID=math.random(-2147483648,2147483646)
  packScript='boxPulls='..boxPulls..'\nboxID='..tostring(boxID)..'\n'..packScript
 end
 for c=1,36 do
  local packInBox=self.getData().ContainedObjects[1]
  packInBox.Transform=boxTrans
  packInBox.LuaScript='packNum='..tostring(c)..'\n'..packScript
  packInBox.CustomMesh.DiffuseURL=getRandomArt()
  boxData.ContainedObjects[c]=packInBox
 end
 spawnObjectData({data=boxData,position=spawnPos,rotation=self.GetRotation()})
end

function getSteamUrl(url)
 if url then return"https://steamusercontent-a.akamaihd.net/ugc/"..url.."/"end
end

function saveData()
 self.script_state=json.serialize({set=curSet,settings=settings})
end

function getRandomArt()
 return getSteamUrl(art[math.random(1,#art)])
end

function startsWith(input,prefix)
 if not prefix then return false end
 return string.sub(input,1,#prefix)==prefix
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
