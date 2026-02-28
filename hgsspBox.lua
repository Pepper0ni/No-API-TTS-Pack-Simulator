setName="HGSS Black Star Promos"
DeckID=5072
date="20100210"
setID="hsp"
cardString=[[
cardData={["HGSS01"]={
 name="Ho-Oh",
 GMN="00250000",
 typ="22",
 rar="P",
 ID=5073
},
["HGSS02"]={
 name="Lugia",
 GMN="00249000",
 typ="33",
 rar="P",
 ID=5074
},
["HGSS03"]={
 name="Pikachu",
 GMN="00025000",
 typ="44",
 rar="P",
 ID=5075
},
["HGSS04"]={
 name="Wobbuffet",
 GMN="00202000",
 typ="55",
 rar="P",
 ID=5076
},
["HGSS05"]={
 name="Hoothoot",
 GMN="00163000",
 typ="121",
 rar="P",
 ID=5077
},
["HGSS06"]={
 name="Noctowl",
 GMN="00164000",
 typ="121",
 rar="P",
 ID=5078
},
["HGSS07"]={
 name="Feraligatr",
 GMN="00160000",
 typ="33",
 rar="P",
 ID=5079
},
["HGSS08"]={
 name="Meganium",
 GMN="00154000",
 typ="11",
 rar="P",
 ID=5080
},
["HGSS09"]={
 name="Typhlosion",
 GMN="00157000",
 typ="22",
 rar="P",
 ID=5081
},
["HGSS10"]={
 name="Latias",
 GMN="00380000",
 typ="121",
 rar="P",
 ID=5082
},
["HGSS11"]={
 name="Latios",
 GMN="00381000",
 typ="121",
 rar="P",
 ID=5083
},
["HGSS12"]={
 name="Cleffa",
 GMN="00034500",
 typ="121",
 rar="P",
 ID=5084
},
["HGSS13"]={
 name="Smoochum",
 GMN="00123700",
 typ="55",
 rar="P",
 ID=5085
},
["HGSS14"]={
 name="Lapras",
 GMN="00131000",
 typ="33",
 rar="P",
 ID=5086
},
["HGSS15"]={
 name="Shuckle",
 GMN="00213000",
 typ="66",
 rar="P",
 ID=5087
},
["HGSS16"]={
 name="Plusle",
 GMN="00311000",
 typ="44",
 rar="P",
 ID=5088
},
["HGSS17"]={
 name="Minun",
 GMN="00312000",
 typ="44",
 rar="P",
 ID=5089
},
["HGSS18"]={
 name="Tropical Tidal Wave",
 GMN="30000000",
 typ="500",
 rar="P",
 ID=5090
},
["HGSS19"]={
 name="Raikou",
 GMN="00243000",
 typ="44",
 rar="P",
 ID=5091
},
["HGSS20"]={
 name="Entei",
 GMN="00244000",
 typ="22",
 rar="P",
 ID=5092
},
["HGSS21"]={
 name="Suicune",
 GMN="00245000",
 typ="33",
 rar="P",
 ID=5093
},
["HGSS22"]={
 name="Porygon",
 GMN="00137000",
 typ="121",
 rar="P",
 ID=5094
},
["HGSS23"]={
 name="Porygon2",
 GMN="00137300",
 typ="121",
 rar="P",
 ID=5095
},
["HGSS24"]={
 name="Hitmonchan",
 GMN="00107000",
 typ="66",
 rar="P",
 ID=5096
},
["HGSS25"]={
 name="Hitmonlee",
 GMN="00106000",
 typ="66",
 rar="P",
 ID=5097
}}
]]


packData={}

function onObjectLeaveContainer(cont,leaving)
 if cont~=self then return end
end

function onLoad()
 setUpButtons()
 if not cardData then
  self.setLuaScript(self.getLuaScript()..cardString)
  self.Reload()
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

function getDeckData(spawnPos,cardRot,hands)
 return {Name="Deck",
  Transform={posX=spawnPos[1],posY=spawnPos[2],posZ=spawnPos[3],rotX=cardRot[1],rotY=cardRot[2],rotZ=cardRot[3],scaleX=1,scaleY=1,scaleZ=1},
  Hands=hands,
  DeckIDs={},
  CustomDeck={},
  ContainedObjects={}
 }
end

function startsWith(input,prefix)
 if not prefix then return false end
 return string.sub(input,1,#prefix)==prefix
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
