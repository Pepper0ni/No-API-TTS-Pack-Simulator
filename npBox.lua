setName="Nintendo Black Star Promos"
DeckID=1789
date="20030512"
setID="np"
cardData={{
 name="Kyogre ex",
 num="1",
 rar="P",
 GMN="00382003",
 typ="33",
},{
 name="Groudon ex",
 num="2",
 rar="P",
 GMN="00383003",
 typ="66",
},{
 name="Treecko",
 num="3",
 rar="P",
 GMN="00252000",
 typ="11",
},{
 name="Grovyle",
 num="4",
 rar="P",
 GMN="00253000",
 typ="11",
},{
 name="Mudkip",
 num="5",
 rar="P",
 GMN="00258000",
 typ="33",
},{
 name="Torchic",
 num="6",
 rar="P",
 GMN="00255000",
 typ="22",
},{
 name="Treecko",
 num="7",
 rar="P",
 GMN="00252000",
 typ="11",
},{
 name="Torchic",
 num="8",
 rar="P",
 GMN="00255000",
 typ="22",
},{
 name="Combusken",
 num="9",
 rar="P",
 GMN="00256000",
 typ="22",
},{
 name="Mudkip",
 num="10",
 rar="P",
 GMN="00258000",
 typ="33",
},{
 name="Marshtomp",
 num="11",
 rar="P",
 GMN="00259000",
 typ="33",
},{
 name="Pikachu",
 num="12",
 rar="P",
 GMN="00025000",
 typ="44",
},{
 name="Meowth",
 num="13",
 rar="P",
 GMN="00052000",
 typ="121",
},{
 name="Latias",
 num="14",
 rar="P",
 GMN="00380000",
 typ="121",
},{
 name="Latios",
 num="15",
 rar="P",
 GMN="00381000",
 typ="121",
},{
 name="Treecko",
 num="16",
 rar="P",
 GMN="00252000",
 typ="11",
},{
 name="Torchic",
 num="17",
 rar="P",
 GMN="00255000",
 typ="22",
},{
 name="Mudkip",
 num="18",
 rar="P",
 GMN="00258000",
 typ="33",
},{
 name="Whismur",
 num="19",
 rar="P",
 GMN="00293000",
 typ="121",
},{
 name="Ludicolo",
 num="20",
 rar="P",
 GMN="00272000",
 typ="33",
},{
 name="Jirachi",
 num="21",
 rar="P",
 GMN="00385000",
 typ="55",
},{
 name="Beldum",
 num="22",
 rar="P",
 GMN="00374000",
 typ="88",
},{
 name="Metang",
 num="23",
 rar="P",
 GMN="00375000",
 typ="88",
},{
 name="Chimecho",
 num="24",
 rar="P",
 GMN="00358000",
 typ="55",
},{
 name="Flygon",
 num="25",
 rar="P",
 GMN="00330000",
 typ="121",
},{
 name="Tropical Wind",
 num="26",
 rar="P",
 GMN="30000000",
 typ="500",
},{
 name="Tropical Tidal Wave",
 num="27",
 rar="P",
 GMN="30000000",
 typ="500",
},{
 name="Championship Arena",
 num="28",
 rar="P",
 GMN="50000000",
 typ="500",
},{
 name="Celebi",
 num="29",
 rar="P",
 GMN="00251000",
 typ="11",
},{
 name="Suicune",
 num="30",
 rar="P",
 GMN="00245000",
 typ="33",
},{
 name="Moltres ex",
 num="31",
 rar="P",
 GMN="00146003",
 typ="22",
},{
 name="Articuno ex",
 num="32",
 rar="P",
 GMN="00144003",
 typ="33",
},{
 name="Zapdos ex",
 num="33",
 rar="P",
 GMN="00145003",
 typ="44",
},{
 name="Typhlosion",
 num="34",
 rar="P",
 GMN="00157000",
 typ="22",
},{
 name="Pikachu δ",
 num="35",
 rar="P",
 GMN="00025000",
 typ="88",
},{
 name="Tropical Tidal Wave",
 num="36",
 rar="P",
 GMN="30000000",
 typ="500",
},{
 name="Kyogre ex",
 num="37",
 rar="P",
 GMN="00382003",
 typ="33",
},{
 name="Groudon ex",
 num="38",
 rar="P",
 GMN="00383003",
 typ="66",
},{
 name="Rayquaza ex",
 num="39",
 rar="P",
 GMN="00384003",
 typ="121",
},{
 name="Mew",
 num="40",
 rar="P",
 GMN="00151000",
 typ="55"}}


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
 return 'dropSlots='..(dropSlots or"false")..'\npullRates='..(pullRates or"false")..'\nsetName="'..setName..'"\nsetID="'..setID..'"\nDeckID="'..DeckID..'"\ndate="'..date..'"\ncardData='..string..'"}}\n'
end

dataString=makeDataString()

packData={}

function onObjectLeaveContainer(cont,leaving)
 if cont~=self then return end
 if pullRates then
  leaving.setCustomObject({diffuse=getRandomArt()})
  leaving.setLuaScript(dataString..leaving.getLuaScript())
 end
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
 if hasBox and pullRates then
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
 return{FaceURL=(cardData[num].image or"https://images.pokemontcg.io/"..setID.."/"..cardData[num].num.."_hires.png?count="..buildCardNumber(cardData[num].num,1)),
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
