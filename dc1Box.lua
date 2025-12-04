art={"1890974789081513328/49E942A6C8171DCC435F4FAD773DAB9246EE53A7",
 "1890974789081460169/63DC298D955368F42E688F56CD722C5EECEC1B49"
}
setName="Double Crisis"
DeckID=7991
date="20150325"
setID="dc1"
noBox=true
dropSlots=[[{
--1 U
  {cards={{23,34}},size=12,num=2},
--2 ex
  {cards={6,15},num=0},
--3 RH
  {cards={2,5,8,11,14,21},num=0},
--4 rev
  {cards={{1,5},{7,14},{16,34}},size=32,num=1},
--5 C
  {cards={1,3,4,7,9,10,12,13,{16,20},22},size=14,num=3},
}]]
pullRates=[[{
--rare
 {rates={
  {slot=2,odds=1/6.5},--ex
  {slot=3}--RH
 },num=1},
}]]
cardData= {{
 name="Team Magma's Numel",
 num="1",
 rar="C",
 GMN="00322000",
 typ="22",
},{
 name="Team Magma's Camerupt",
 num="2",
 rar="RH",
 GMN="00323000",
 typ="22",
},{
 name="Team Aqua's Spheal",
 num="3",
 rar="C",
 GMN="00363000",
 typ="33",
},{
 name="Team Aqua's Sealeo",
 num="4",
 rar="C",
 GMN="00364000",
 typ="33",
},{
 name="Team Aqua's Walrein",
 num="5",
 rar="RH",
 GMN="00365000",
 typ="33",
},{
 name="Team Aqua's Kyogre-EX",
 num="6",
 rar="RU",
 GMN="00382003",
 typ="33",
},{
 name="Team Aqua's Grimer",
 num="7",
 rar="C",
 GMN="00088000",
 typ="55",
},{
 name="Team Aqua's Muk",
 num="8",
 rar="RH",
 GMN="00089000",
 typ="55",
},{
 name="Team Aqua's Seviper",
 num="9",
 rar="C",
 GMN="00336000",
 typ="55",
},{
 name="Team Magma's Baltoy",
 num="10",
 rar="C",
 GMN="00343000",
 typ="55",
},{
 name="Team Magma's Claydol",
 num="11",
 rar="RH",
 GMN="00344000",
 typ="55",
},{
 name="Team Magma's Aron",
 num="12",
 rar="C",
 GMN="00304000",
 typ="66",
},{
 name="Team Magma's Lairon",
 num="13",
 rar="C",
 GMN="00305000",
 typ="66",
},{
 name="Team Magma's Aggron",
 num="14",
 rar="RH",
 GMN="00306000",
 typ="66",
},{
 name="Team Magma's Groudon-EX",
 num="15",
 rar="RU",
 GMN="00383003",
 typ="66",
},{
 name="Team Aqua's Poochyena",
 num="16",
 rar="C",
 GMN="00261000",
 typ="77",
},{
 name="Team Magma's Poochyena",
 num="17",
 rar="C",
 GMN="00261000",
 typ="77",
},{
 name="Team Aqua's Mightyena",
 num="18",
 rar="C",
 GMN="00262000",
 typ="77",
},{
 name="Team Magma's Mightyena",
 num="19",
 rar="C",
 GMN="00262000",
 typ="77",
},{
 name="Team Aqua's Carvanha",
 num="20",
 rar="C",
 GMN="00318000",
 typ="77",
},{
 name="Team Aqua's Sharpedo",
 num="21",
 rar="RH",
 GMN="00319000",
 typ="77",
},{
 name="Team Magma's Zangoose",
 num="22",
 rar="C",
 GMN="00335000",
 typ="121",
},{
 name="Aqua Diffuser",
 num="23",
 rar="U",
 GMN="60000000",
 typ="500",
},{
 name="Magma Pointer",
 num="24",
 rar="U",
 GMN="60000000",
 typ="500",
},{
 name="Team Aqua Admin",
 num="25",
 rar="U",
 GMN="40000000",
 typ="500",
},{
 name="Team Aqua Grunt",
 num="26",
 rar="U",
 GMN="40000000",
 typ="500",
},{
 name="Team Aqua's Great Ball",
 num="27",
 rar="U",
 GMN="30000000",
 typ="500",
},{
 name="Team Aqua's Secret Base",
 num="28",
 rar="U",
 GMN="50000000",
 typ="500",
},{
 name="Team Magma Admin",
 num="29",
 rar="U",
 GMN="40000000",
 typ="500",
},{
 name="Team Magma Grunt",
 num="30",
 rar="U",
 GMN="40000000",
 typ="500",
},{
 name="Team Magma's Great Ball",
 num="31",
 rar="U",
 GMN="30000000",
 typ="500",
},{
 name="Team Magma's Secret Base",
 num="32",
 rar="U",
 GMN="50000000",
 typ="500",
},{
 name="Double Aqua Energy",
 num="33",
 rar="U",
 GMN="80000000",
 typ="500",
},{
 name="Double Magma Energy",
 num="34",
 rar="U",
 GMN="80000000",
 typ="500"}}

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

function makeDataString()
 local string=logString(cardData)
 string=string.gsub(string,"  +\""," ")
 string=string.gsub(string," 1: ","{{")
 string=string.gsub(string," +%d+: ","},{")
 string=string.gsub(string,"\": ","=\"")
 string=string.gsub(string,"([^%{%}])\n","%1\",\n")
 return 'dropSlots='..dropSlots..'\npullRates='..pullRates..'\nsetName="'..setName..'"\nsetID="'..setID..'"\nDeckID="'..DeckID..'"\ndate="'..date..'"\ncardData='..string..'"}}\n'
end

dataString=makeDataString()

packData={}

function onObjectLeaveContainer(cont,leaving)
 if cont~=self then return end
 leaving.setCustomObject({diffuse=getRandomArt()})
 leaving.setLuaScript(dataString..leaving.getLuaScript())
end

function onNumberTyped(color,num)--credit Eldin
 for x=1,num do Wait.frames(function()self.deal(1,color)end,x)end
 return true
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
 setUpContextMenu()
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

function setUpContextMenu()
 if settings.debug then
  addContextToggle("hundred","100 Packs")
  addContextToggle("slotTest","Slot Test")
  addContextToggle("on","Packs")
  addContextToggle("allGods","All God Packs")
  addSetting("Close Debug Menu","debug",false)
 end
 if settings.energy~=1 then addSetting("Enable Energy","energy",1)end
 if settings.energy~=0 then addSetting("Disable Energy","energy",0)end
 if settings.energy~=2 then addSetting("Replace Energy","energy",2)end
 addContextToggle("spread","Spread")
 if not settings.debug then addSetting("Open Debug Menu","debug",true)end
end

function addContextToggle(setting,desc)
 if settings[setting]then
  addSetting("Disable "..desc,setting,false)
 else
  addSetting("Enable "..desc,setting,true)
 end
end

function addSetting(text,setName,setting)
 self.addContextMenuItem(text,function()changeSettings(setName,setting)end)
end

function changeSettings(setting,value)
 settings[setting]=value
 self.clearContextMenu()
 setUpContextMenu(settings)
 Global.SetTable("PPacks",settings)
 saveData()
end

function getSet(obj,color,alt)
 local spawnPos=self.positionToWorld({0,1,7})
 packData=getDeckData(spawnPos,self.getRotation(),false)
 for a=1,#cardData do
  addCard(packs,a)
 end
 local deck=spawnObjectData({data=packData})
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

function addCard(packs,num)
 packData.DeckIDs[#packData.DeckIDs+1]=(DeckID+num)*100
 packData.CustomDeck[DeckID+num]=getCustomData(num)
 packData.ContainedObjects[#packData.ContainedObjects+1]=getCardTable(packData.Transform,num)
end

function getCardTable(trans,num)
 return{Name="CardCustom",
 Transform=trans,
 Nickname=cardData[num].name,
 Description=setName.." #"..cardData[num].num.." "..(cardData[num].rar or ""),
 GMNotes=cardData[num].GMN,
 Memo=date..buildCardNumber(cardData[num].num,3),
 CardID=(DeckID+num)*100,
 CustomDeck={[DeckID+num]=getCustomData(num)},
 LuaScriptState=cardData[num].typ
}
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
 if subSetID then
  packScript='size='..tostring(size)..'\nsubSetID='..subSetID..'\n'..packScript
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

function getCustomData(num)
 local image=cardData[num].image
 if not image then
  local ID=setID
  if subSetID and num>size then
   ID=subSetID
  end
   image="https://images.pokemontcg.io/"..ID.."/"..cardData[num].num.."_hires.png?count="..buildCardNumber(cardData[num].num,1)
 end
 return{FaceURL=image,
  BackURL="https://steamusercontent-a.akamaihd.net/ugc/809997459557414686/9ABD9158841F1167D295FD1295D7A597E03A7487/",
  NumWidth=1,
  NumHeight=1,
  BackIsHidden=true
 }
end

function buildCardNumber(cardNum,minDigit)
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
 while #cardNum<minDigit do cardNum="0"..cardNum end
 return cardNum
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
