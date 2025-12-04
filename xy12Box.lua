art={"1890974789081468089/88901EBACAED6D9C76140FA8D2088493161436F9",
 "1890974789081478463/5EF9FB5F730C47F4246618A293F9B0A1126F32B3",
 "1890974789081488880/AE234747BA398E6CCB0DF7C0CCA3434030026DED",
 "1890974789081495709/4D0303C21C603DFA944153A5377A033AD4795CD5"
}
setName="Evolutions"
DeckID=8903
date="20161102"
setID="xy12"
dropSlots=[[{
--1 RS
  {cards={{'109','113'}},size=5,num=0},
--2 U
  {cards={'4','6','10','20','24','44','48','50','58','71',{'73','90'}},size=28,num=0},
--3 RU
  {cards={{'100','108'}},size=9,num=0},
--4 ex
  {cards={'1','2','12','13','21','22','26','27','52','64','65','72'},num=0},
--5 RH
  {cards={'11','15','25','34','36','38','42','45','53','59','62','63','70'},num=0},
--6 R
  {cards={'7','18','29','31','40','51','56','67','68'},num=0},
--7 BREAK
  {cards={'16','32','46','60'},num=0},
--8 rev (energy is placed twice to simulate higher pull rate)
  {cards={{'3','11'},'14','15',{'17','20'},{'23','25'},{'28','31'},{'33','45'},{'47','51'},{'53','59'},{'61','63'},{'66','71'},{'73','99'},{'91','99'}},size=92,num=0},
--9 C
  {cards={'3','5','8','9','14','17','19','23','28','30','33','35','37','39','41','43','47','49','54','55','57','61','66','69'},num=4},
--10 energy
  {cards={'91','92','93','94','95','96','97','98','99'},num=0,energy=true},
}]]
pullRates=[[{
--U
 {rates={
  {slot=1,odds=1/23.2},
  {slot=2}--unc
 },num=3},
--R
 {rates={
  {slot=3,odds=1/15,flag=true},--RU
  {slot=4,odds=1/8.3,flag=true},--EX
  {slot=5,odds=1/10.1,flag=true},--RH
  {slot=6}--R
 },num=1},
--rev
 {rates={
  {slot=7,odds=1/15.75,flagExclude=true},--break
  {slot=8}--rev
 },num=1},
--C
 {rates={
  {slot=9,odds=2/3},--C
  {slot=10}--energy
 },num=1},
}]]
cardString=[[
cardData={["1"]={
 name="Venusaur-EX",
 GMN="00003003",
 typ="11",
 rar="RHEX"
},
["2"]={
 name="M Venusaur-EX",
 GMN="00003004",
 typ="11",
 rar="RHEX"
},
["3"]={
 name="Caterpie",
 GMN="00010000",
 typ="11",
 rar="C"
},
["4"]={
 name="Metapod",
 GMN="00011000",
 typ="11",
 rar="U"
},
["5"]={
 name="Weedle",
 GMN="00013000",
 typ="11",
 rar="C"
},
["6"]={
 name="Kakuna",
 GMN="00014000",
 typ="11",
 rar="U"
},
["7"]={
 name="Beedrill",
 GMN="00015000",
 typ="11",
 rar="R"
},
["8"]={
 name="Tangela",
 GMN="00114000",
 typ="11",
 rar="C"
},
["9"]={
 name="Charmander",
 GMN="00004000",
 typ="22",
 rar="C"
},
["10"]={
 name="Charmeleon",
 GMN="00005000",
 typ="22",
 rar="U"
},
["11"]={
 name="Charizard",
 GMN="00006000",
 typ="22",
 rar="RH"
},
["12"]={
 name="Charizard-EX",
 GMN="00006003",
 typ="22",
 rar="RHEX"
},
["13"]={
 name="M Charizard-EX",
 GMN="00006004",
 typ="22",
 rar="RHEX"
},
["14"]={
 name="Vulpix",
 GMN="00037000",
 typ="22",
 rar="C"
},
["15"]={
 name="Ninetales",
 GMN="00038000",
 typ="22",
 rar="RH"
},
["16"]={
 name="Ninetales BREAK",
 GMN="00038002",
 typ="22",
 rar="RBREAK"
},
["17"]={
 name="Growlithe",
 GMN="00058000",
 typ="22",
 rar="C"
},
["18"]={
 name="Arcanine",
 GMN="00059000",
 typ="22",
 rar="R"
},
["19"]={
 name="Ponyta",
 GMN="00077000",
 typ="22",
 rar="C"
},
["20"]={
 name="Magmar",
 GMN="00126000",
 typ="22",
 rar="U"
},
["21"]={
 name="Blastoise-EX",
 GMN="00009003",
 typ="33",
 rar="RHEX"
},
["22"]={
 name="M Blastoise-EX",
 GMN="00009004",
 typ="33",
 rar="RHEX"
},
["23"]={
 name="Poliwag",
 GMN="00060000",
 typ="33",
 rar="C"
},
["24"]={
 name="Poliwhirl",
 GMN="00061000",
 typ="33",
 rar="U"
},
["25"]={
 name="Poliwrath",
 GMN="00062000",
 typ="33",
 rar="RH"
},
["26"]={
 name="Slowbro-EX",
 GMN="00080003",
 typ="33",
 rar="RHEX"
},
["27"]={
 name="M Slowbro-EX",
 GMN="00080004",
 typ="33",
 rar="RHEX"
},
["28"]={
 name="Seel",
 GMN="00086000",
 typ="33",
 rar="C"
},
["29"]={
 name="Dewgong",
 GMN="00087000",
 typ="33",
 rar="R"
},
["30"]={
 name="Staryu",
 GMN="00120000",
 typ="33",
 rar="C"
},
["31"]={
 name="Starmie",
 GMN="00121000",
 typ="33",
 rar="R"
},
["32"]={
 name="Starmie BREAK",
 GMN="00121002",
 typ="33",
 rar="RBREAK"
},
["33"]={
 name="Magikarp",
 GMN="00129000",
 typ="33",
 rar="C"
},
["34"]={
 name="Gyarados",
 GMN="00130000",
 typ="33",
 rar="RH"
},
["35"]={
 name="Pikachu",
 GMN="00025000",
 typ="44",
 rar="C"
},
["36"]={
 name="Raichu",
 GMN="00026000",
 typ="44",
 rar="RH"
},
["37"]={
 name="Magnemite",
 GMN="00081000",
 typ="44",
 rar="C"
},
["38"]={
 name="Magneton",
 GMN="00082000",
 typ="44",
 rar="RH"
},
["39"]={
 name="Voltorb",
 GMN="00100000",
 typ="44",
 rar="C"
},
["40"]={
 name="Electrode",
 GMN="00101000",
 typ="44",
 rar="R"
},
["41"]={
 name="Electabuzz",
 GMN="00125000",
 typ="44",
 rar="C"
},
["42"]={
 name="Zapdos",
 GMN="00145000",
 typ="44",
 rar="RH"
},
["43"]={
 name="Nidoran ♂",
 GMN="00032000",
 typ="55",
 rar="C"
},
["44"]={
 name="Nidorino",
 GMN="00033000",
 typ="55",
 rar="U"
},
["45"]={
 name="Nidoking",
 GMN="00034000",
 typ="55",
 rar="RH"
},
["46"]={
 name="Nidoking BREAK",
 GMN="00034002",
 typ="55",
 rar="RBREAK"
},
["47"]={
 name="Gastly",
 GMN="00092000",
 typ="55",
 rar="C"
},
["48"]={
 name="Haunter",
 GMN="00093000",
 typ="55",
 rar="U"
},
["49"]={
 name="Drowzee",
 GMN="00096000",
 typ="55",
 rar="C"
},
["50"]={
 name="Koffing",
 GMN="00109000",
 typ="55",
 rar="U"
},
["51"]={
 name="Mewtwo",
 GMN="00150000",
 typ="55",
 rar="R"
},
["52"]={
 name="Mewtwo-EX",
 GMN="00150003",
 typ="55",
 rar="RHEX"
},
["53"]={
 name="Mew",
 GMN="00151000",
 typ="55",
 rar="RH"
},
["54"]={
 name="Sandshrew",
 GMN="00027000",
 typ="66",
 rar="C"
},
["55"]={
 name="Diglett",
 GMN="00050000",
 typ="66",
 rar="C"
},
["56"]={
 name="Dugtrio",
 GMN="00051000",
 typ="66",
 rar="R"
},
["57"]={
 name="Machop",
 GMN="00066000",
 typ="66",
 rar="C"
},
["58"]={
 name="Machoke",
 GMN="00067000",
 typ="66",
 rar="U"
},
["59"]={
 name="Machamp",
 GMN="00068000",
 typ="66",
 rar="RH"
},
["60"]={
 name="Machamp BREAK",
 GMN="00068002",
 typ="66",
 rar="RBREAK"
},
["61"]={
 name="Onix",
 GMN="00095000",
 typ="66",
 rar="C"
},
["62"]={
 name="Hitmonchan",
 GMN="00107000",
 typ="66",
 rar="RH"
},
["63"]={
 name="Clefairy",
 GMN="00035000",
 typ="99",
 rar="RH"
},
["64"]={
 name="Pidgeot-EX",
 GMN="00018003",
 typ="121",
 rar="RHEX"
},
["65"]={
 name="M Pidgeot-EX",
 GMN="00018004",
 typ="121",
 rar="RHEX"
},
["66"]={
 name="Rattata",
 GMN="00019000",
 typ="121",
 rar="C"
},
["67"]={
 name="Raticate",
 GMN="00020000",
 typ="121",
 rar="R"
},
["68"]={
 name="Farfetch'd",
 GMN="00083000",
 typ="121",
 rar="R"
},
["69"]={
 name="Doduo",
 GMN="00084000",
 typ="121",
 rar="C"
},
["70"]={
 name="Chansey",
 GMN="00113000",
 typ="121",
 rar="RH"
},
["71"]={
 name="Porygon",
 GMN="00137000",
 typ="121",
 rar="U"
},
["72"]={
 name="Dragonite-EX",
 GMN="00149003",
 typ="121",
 rar="RHEX"
},
["73"]={
 name="Blastoise Spirit Link",
 GMN="60000000",
 typ="500",
 rar="U"
},
["74"]={
 name="Brock's Grit",
 GMN="40000000",
 typ="500",
 rar="U"
},
["75"]={
 name="Charizard Spirit Link",
 GMN="60000000",
 typ="500",
 rar="U"
},
["76"]={
 name="Devolution Spray",
 GMN="30000000",
 typ="500",
 rar="U"
},
["77"]={
 name="Energy Retrieval",
 GMN="30000000",
 typ="500",
 rar="U"
},
["78"]={
 name="Full Heal",
 GMN="30000000",
 typ="500",
 rar="U"
},
["79"]={
 name="Maintenance",
 GMN="30000000",
 typ="500",
 rar="U"
},
["80"]={
 name="Misty's Determination",
 GMN="40000000",
 typ="500",
 rar="U"
},
["81"]={
 name="Pidgeot Spirit Link",
 GMN="60000000",
 typ="500",
 rar="U"
},
["82"]={
 name="Pokédex",
 GMN="30000000",
 typ="500",
 rar="U"
},
["83"]={
 name="Potion",
 GMN="30000000",
 typ="500",
 rar="U"
},
["84"]={
 name="Professor Oak's Hint",
 GMN="40000000",
 typ="500",
 rar="U"
},
["85"]={
 name="Revive",
 GMN="30000000",
 typ="500",
 rar="U"
},
["86"]={
 name="Slowbro Spirit Link",
 GMN="60000000",
 typ="500",
 rar="U"
},
["87"]={
 name="Super Potion",
 GMN="30000000",
 typ="500",
 rar="U"
},
["88"]={
 name="Switch",
 GMN="30000000",
 typ="500",
 rar="U"
},
["89"]={
 name="Venusaur Spirit Link",
 GMN="60000000",
 typ="500",
 rar="U"
},
["90"]={
 name="Double Colorless Energy",
 GMN="80000000",
 typ="500",
 rar="U"
},
["91"]={
 name="Grass Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["92"]={
 name="Fire Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["93"]={
 name="Water Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["94"]={
 name="Lightning Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["95"]={
 name="Psychic Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["96"]={
 name="Fighting Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["97"]={
 name="Darkness Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["98"]={
 name="Metal Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["99"]={
 name="Fairy Energy",
 GMN="90000000",
 typ="500",
 rar="C"
},
["100"]={
 name="M Venusaur-EX",
 GMN="00003004",
 typ="11",
 rar="RU"
},
["101"]={
 name="M Charizard-EX",
 GMN="00006004",
 typ="22",
 rar="RU"
},
["102"]={
 name="M Blastoise-EX",
 GMN="00009004",
 typ="33",
 rar="RU"
},
["103"]={
 name="Mewtwo-EX",
 GMN="00150003",
 typ="55",
 rar="RU"
},
["104"]={
 name="Pidgeot-EX",
 GMN="00018003",
 typ="121",
 rar="RU"
},
["105"]={
 name="M Pidgeot-EX",
 GMN="00018004",
 typ="121",
 rar="RU"
},
["106"]={
 name="Dragonite-EX",
 GMN="00149003",
 typ="121",
 rar="RU"
},
["107"]={
 name="Brock's Grit",
 GMN="40000000",
 typ="500",
 rar="RU"
},
["108"]={
 name="Misty's Determination",
 GMN="40000000",
 typ="500",
 rar="RU"
},
["109"]={
 name="ナッシー[​​​​​​​​​​​​​​Exeggutor]",
 GMN="00103000",
 typ="11",
 rar="RS"
},
["110"]={
 name="Flying Pikachu",
 GMN="00025000",
 typ="44",
 rar="RS"
},
["111"]={
 name="Surfing Pikachu",
 GMN="00025000",
 typ="44",
 rar="RS"
},
["112"]={
 name="Imakuni?'s Doduo",
 GMN="00084000",
 typ="121",
 rar="RS"
},
["113"]={
 name="Here Comes Team Rocket!",
 GMN="40000000",
 typ="500",
 rar="RS"
}}]]

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
 packScript=dataString..self.getData().ContainedObjects[1].LuaScript
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
