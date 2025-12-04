art={"1890974789082762267/C3333D89A9BD7724A59049F3377A773F38E0B22C"
}
setName="POP Series 6"
DeckID=3881
date="20070901"
setID="pop6"
noBox=true
dropSlots=[[{
--1 R
  {cards={{1,5}},num=1,size=5},
--2 U
  {cards={{6,10}},num=0,size=5},
--3 C
  {cards={{11,17}},num=0,size=7},
}]]
pullRates=[[{
--unc
 {rates={
  {slot=2,odds=0.1355},--U
  {slot=3}--C
 },num=1}
}]]
cardData={{
 name="Bastiodon",
 num="1",
 rar="R",
 GMN="00411000",
 typ="88",
},{
 name="Lucario",
 num="2",
 rar="R",
 GMN="00448000",
 typ="66",
},{
 name="Manaphy",
 num="3",
 rar="R",
 GMN="00490000",
 typ="33",
},{
 name="Pachirisu",
 num="4",
 rar="R",
 GMN="00417000",
 typ="44",
},{
 name="Rampardos",
 num="5",
 rar="R",
 GMN="00409000",
 typ="66",
},{
 name="Drifloon",
 num="6",
 rar="U",
 GMN="00425000",
 typ="55",
},{
 name="Gible",
 num="7",
 rar="U",
 GMN="00443000",
 typ="121",
},{
 name="Riolu",
 num="8",
 rar="U",
 GMN="00447000",
 typ="66",
},{
 name="Pikachu",
 num="9",
 rar="U",
 GMN="00025000",
 typ="44",
},{
 name="Staravia",
 num="10",
 rar="U",
 GMN="00397000",
 typ="121",
},{
 name="Bidoof",
 num="11",
 rar="C",
 GMN="00399000",
 typ="121",
},{
 name="Buneary",
 num="12",
 rar="C",
 GMN="00427000",
 typ="121",
},{
 name="Cherubi",
 num="13",
 rar="C",
 GMN="00420000",
 typ="11",
},{
 name="Chimchar",
 num="14",
 rar="C",
 GMN="00390000",
 typ="22",
},{
 name="Piplup",
 num="15",
 rar="C",
 GMN="00393000",
 typ="33",
},{
 name="Starly",
 num="16",
 rar="C",
 GMN="00396000",
 typ="121",
},{
 name="Turtwig",
 num="17",
 rar="C",
 GMN="00387000",
 typ="11"}}


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
 packScript=cardString..energyString..dataString..self.getData().ContainedObjects[1].LuaScript
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
