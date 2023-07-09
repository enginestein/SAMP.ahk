# SAMP.ahk

SAMP.ahk is a library specifically designed to be used with [AutoHotKey](https://www.ahkscript.org). The ultimate goal of SAMP.ahk is to provide a more comprehensive platform for SA-MP memory modding in AutoHotKey. If you encounter any issues with the program, please open an issue ticket.

### Supported SA-MP Versions
Currently, only [SA-MP Version 0.3.7 R1](https://dracoblue.net/downloads/samp-client/) and Version 1 of the GTA SA Executable are supported.

### Prerequisites
In order for SAMP.ahk to work properly, you must be using [AutoHotKey](https://autohotkey.com) (32-bit). Please note that the library will not function in a 64-bit environment. 

### Usage (When Writing)
1. Make sure the mod you are writing is in the "SAM_MODS" folder alongside SAMP.ahk.

2. Include the following code snippet at the beginning of your script to reference the SAMP.ahk API:

```autohotkey
SendMode Input
SetWorkingDir %A_ScriptDir%
#Warn
#UseHook
#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMP.ahk
```

3. Start using SAMP.ahk

```autohotkey
Hotkey, Enter, Off
Hotkey, Escape, Off

bchat:=0
return

+T:: 
~t::
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Hotkey, t, Off
return

~NumpadEnter::
~Enter::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return

~Escape::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return

Numpad1::
SendInput tName:{Space}
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Input varName, V I M,{enter}
SendInput {end}+{home}{Del}{esc}
varID := getPlayerIdByName(varName)
showGameText(getPlayerNameById(varID) "~n~Score: " getPlayerScoreById(varID) "~n~Ping: " getPlayerPingById(varID), 2000, 5)
return

Numpad2::
SendInput tID:{Space}
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Input varID, V I M,{enter}
SendInput {end}+{home}{Del}{esc}
showGameText(getPlayerNameById(varID) "~n~Score: " getPlayerScoreById(varID) "~n~Ping: " getPlayerPingById(varID) "~n~IsNPC: " isNPCById(varID), 2000, 5)
return

Numpad3::
playAudioStream("an/audio/stream/file/path/or/url/link")
return

Numpad4::
stopAudioStream()
return

Numpad5::
if ( isInChat() )
	return
addMessageToChatWindow("{FFFFFF}IP: {FF0000}" getIP() "{FFFFFF}, Hostname: {FF0000}" getHostname())
addMessageToChatWindow("{FFFFFF}Players: {FF0000}" countOnlinePlayers())
addMessageToChatWindow("{FFFFFF}Name: {FF0000}" getUsername())
addMessageToChatWindow("{FFFFFF}HP: {FF0000}" getPlayerHealth() "{FFFFFF}, ARMOR: {FF0000}" getPlayerArmor())
addMessageToChatWindow("{FFFFFF}Money: {FF0000}" getPlayerMoney())
addMessageToChatWindow("{FFFFFF}Interior id: {FF0000}" getPlayerInteriorId())
pos := getCoordinates()
addMessageToChatWindow("{FFFFFF}Zone: {FF0000}" calculateZone(pos[1],pos[2],pos[3]) "{FFFFFF}, Stadt: {FF0000}" calculateCity(pos[1],pos[2],pos[3]))
sendChatMessage("blub")
sendChatMessage("/asd")
showGameText("test", 2000, 5)
return

Numpad6::
showDialog(5, "Titel", "Weapon`tPrice`tAmmo`nDeagle`t$5000`t100`nSawnoff`t$5000`t100`nPistol`t$1000`t50", "OK" )
return

Numpad7::
addMessageToChatWindow("{FFFFFF}Vehicle Type:" getVehicleType())
addMessageToChatWindow("{FFFFFF}Model:" getVehicleModelId())
addMessageToChatWindow("{FFFFFF}Model Name:" getVehicleModelName())
addMessageToChatWindow("{FFFFFF}Is Driver:" isPlayerDriver())
addMessageToChatWindow("{FFFFFF}Light State:" getVehicleLightState())
addMessageToChatWindow("{FFFFFF}Engine State:" getVehicleEngineState())
addMessageToChatWindow("{FFFFFF}Door State:" getVehicleLockState())
return

Numpad8::
addMessageToChatWindow("{FFFFFF}block chat " (bchat ? "{FF0000}off" : "{00FF00}on"))
if(bchat)
	unBlockChatInput()
else
	blockChatInput()
bchat:=!bchat
return

```

# Documentation

## Functions

### SAMP Functions:                                                                                                             
                                                                                                                            
     - IsSAMPAvailable()                         Check if SA:MP is loaded.                                                  
     - IsInChat()                                Check if the player's chatbox or dialog is open.                            
     - GetPlayerName()                           Get the player's name.                                                     
     - GetPlayerId()                             Get the player's ID.                                                       
     - SendChat(wText)                           Send a message or command to the server.                                    
     - AddChatMessage(wText)                     Add a line to the chat (only visible to the player).                        
     - ShowGameText(wText, dwTime, dwTextstyle)  Display text in the middle of the screen.                                   
     - PlayAudioStream(wUrl)                     Play music from a URL (not currently functioning).                          
     - StopAudioStream()                         Stop the music stream (not currently functioning).                          
     - GetChatLine(Line, ByRef Output)           Read a string from the line (integer).                                      
                                                 Optional parameters (timestamp=0, color=0).                                 
     - BlockChatInput()                          Block messages from being sent to the server.                               
     - UnBlockChatInput()                        Unblock messages from being sent to the server.                             
                                                                                                                             
  
                                                                                                                             
     - GetServerName()                           Read the server's name.                                                    
     - GetServerIp()                             Read the server's IP.                                                      
     - GetServerPort()                           Read the server's port.                                                    
     - CountOnlinePlayers()                      Read the number of players currently online.                               
                                                                                                                             
  
                                                                                                                             
     - GetWeatherId()                            Return the weather ID.                                                     
     - GetWeatherName()                          Return the name of the current weather.                                    
                                                                                                                             
  
                                                                                                                             
     - PatchRadio()                              (internal function)                                                        
     - UnPatchRadio()                            (internal function)                                                        
                                                                                                                             

 ### SAMP Dialog Functions (v0.3.7 R4-2):                                                                                        
  
                                                                                                                             
     - IsDialogOpen()                            Check if a dialog is currently displayed (returns true or false).           
     - GetDialogStyle()                          Read the type of the (last) displayed dialog (0-5).                         
     - GetDialogId()                             Read the ID of the (last) displayed dialog (also from the server).          
     - SetDialogId(id)                           Set the ID of the (last) displayed dialog.                                  
     - GetDialogIndex()                          Read the (last) selected line of the dialog.                                
     - GetDialogCaption()                        Read the title of the (last) displayed dialog.                              
     - GetDialogText()                           Read the text of the (last) displayed dialog (also for lists).              
     - GetDialogLineCount()                      Read the number of lines/items of the (last) displayed dialog.              
     - GetDialogLine(index)                      Read the line at the position [index] using GetDialogText.                  
     - GetDialogLines__()                        Read the lines using GetDialogText (returns an array).                      
     - IsDialogButton1Selected()                 Check if Button1 of the dialog is selected.                                 
     - GetDialogStructPtr()                      Read the base pointer to the dialog structure (used internally).            
                                                                                                                             
     - ShowDialog(style, caption, text, button1, button2, id)          Display a dialog (local only).                                              
                                                                                      
                                                                                                                             

 ### Extra Player Functions:                                                                                                     
  
                                                                                                                             
     - GetTargetPed(dwPED)                       Return the ped ID of the player you are targeting.                          
     - GetPedById(dwId)                          Return the ped ID of the SA:MP player ID provided.                          
     - GetIdByPed(dwId)                          Return the SA:MP player ID of the ped ID provided.                          
     - GetStreamedInPlayersInfo()                Display information about streamed players.                                 
     - CallFuncForAllStreamedInPlayers()         Perform certain functions for all streamed players.                         
     - GetDist(pos1,pos2)                        Calculate the distance between two positions.                               
     - GetClosestPlayerPed()                     Return the ped ID of the player closest to you.                             
     - GetClosestPlayerId()                      Return the SA:MP player ID of the player closest to you.                    
     - GetPedCoordinates(dwPED)                  Return the coordinates of the provided PED ID.                              
     - GetTargetPosById(dwId)                    Return the coordinates of the provided SA:MP player ID.                     
     - GetTargetPlayerSkinIdByPed(dwPED)         Return the skin ID for the provided ped ID.                                 
     - GetTargetPlayerSkinIdById(dwId)           Return the skin ID for the provided SA:MP player ID.                        
     - CalcScreenCoords(fX, fY, fZ)              WorldToScreen Function.                                                    
                                                                                                                             

 ### Extra Player Vehicle functions (ensure the player is in a vehicle first before calling, can lead to crashes):               
  
                                                                                                                             
     - GetVehiclePointerByPed(dwPED)             Return the vehicle pointer of the provided ped ID.                          
     - GetVehiclePointerById(dwId)               Return the vehicle pointer of the provided SA:MP player ID.                 
     - IsTargetInAnyVehicleByPed(dwPED)          Check if the provided ped ID is in any vehicle.                             
     - IsTargetInAnyVehicleById(dwId)            Check if the provided SA:MP player ID is in any vehicle.                    
     - GetTargetVehicleHealthByPed(dwPED)        Return the vehicle health value of the provided ped ID.                     
     - GetTargetVehicleHealthById(dwId)          Return the vehicle health value of the provided SA:MP player ID.            
     - GetTargetVehicleTypeByPed(dwPED)          Return the vehicle type (car, truck, etc.) of the provided ped ID.          
     - GetTargetVehicleTypeById(dwId)            Return the vehicle type (car, truck, etc.) of the provided SA:MP player ID. 
     - GetTargetVehicleModelIdByPed(dwPED)       Return the vehicle model ID of the provided ped ID.                         
     - GetTargetVehicleModelIdById(dwId)         Return the vehicle model ID of the provided SA:MP player ID.               

     - GetTargetVehicleModelNameByPed(dwPED)     Return the vehicle name of the provided ped ID.                             
     - GetTargetVehicleModelNameById(dwId)       Return the vehicle name of the provided SA:MP player ID.                    
     - GetTargetVehicleLightStateByPed(dwPED)    Return the light status of the vehicle (ped ID).                            
     - GetTargetVehicleLightStateById(dwId)      Return the light status of the vehicle (SA:MP player ID).                   
     - GetTargetVehicleLockStateByPed(dwPED)     Return the lock status of the vehicle (ped ID).                             
     - GetTargetVehicleLockStateById(dwId)       Return the lock status of the vehicle (SA:MP player ID).                    
     - GetTargetVehicleColor1ByPed(dwPED)        Return the 1st color ID (ped ID).                                           
     - GetTargetVehicleColor1ById(dwId)          Return the 1st color ID (SA:MP player ID).                                  
     - GetTargetVehicleColor2ByPed(dwPED)        Return the 2nd color ID (ped ID).                                           
     - GetTargetVehicleColor2ById(dwId)          Return the 2nd color ID (SA:MP player ID).                                  
     - GetTargetVehicleSpeedByPed(dwPED)         Return the vehicle speed of the vehicle (ped ID).                           
     - GetTargetVehicleSpeedById(dwId)           Return the vehicle speed of the vehicle (SA:MP player ID).                  
                                                                                                                             

 ### Scoreboard Functions :                                                                                                      
  
                                                                                                                             
     - GetPlayerScoreById(dwId)                  Get the score of the provided SA:MP player ID.                              
     - GetPlayerPingById(dwId)                   Get the ping of the provided SA:MP player ID.                               
     - GetPlayerNameById(dwId)                   Get the name of the provided SA:MP player ID.                               
     - GetPlayerIdByName(wName)                  Get the SA:MP player ID of the provided name.                               
     - UpdateScoreboardDataEx()                  Update scoreboard content (called implicitly).                              
     - UpdateOScoreboardData()                   Update scoreboard content (called implicitly).                              
     - IsNPCById(dwId)                           Check if the provided ID is an NPC.                                         
                                                                                                                             

 ### Player Functions:                                                                                                           
  
                                                                                                                             
     - GetPlayerHealth()                         Return the player's health value.                                          
     - GetPlayerArmor()                          Return the player's armor value.                                           
     - GetPlayerInteriorId()                     Return the player's interior ID.                                           
     - GetPlayerSkinId()                         Return the player's skin ID.                                               
     - GetPlayerMoney()                          Return the player's money value.                                           
     - GetPlayerWanteds()                        Return the wanted level of the player (up to 6).                             
     - GetPlayerWeaponId()                       Return the weapon ID of the currently held weapon.                           
     - GetPlayerWeaponName()                     Return the name of the currently held weapon.                                
     - GetPlayerState()                          Return the player's state (in a vehicle, walking, dead).                     
     - GetPlayerMapPosX()                        Return the X position on the map in the menu.                               
     - GetPlayerMapPosY()                        Return the Y position on the map in the menu.                               
     - GetPlayerMapZoom()                        Return the zoom value on the map in the menu.                               
     - IsPlayerFreezed()                         Return true or false if the player is frozen.                               
                                                                                                                             

 ### Vehicle functions:                                                                                                          
  
                                                                                                                             
     - IsPlayerInAnyVehicle()                    Check if the player is in any vehicle.                                      
     - GetVehicleHealth()                        Return the vehicle's health value.                                          
     - IsPlayerDriver()                          Check if the player is the driver.                                          
     - GetVehicleType()                          Return the vehicle type (car, truck, etc.).                                 
     - GetVehicleModelId()                       Return the vehicle model ID.                                                
     - GetVehicleModelName()                     Return the vehicle name.                                                    
     - GetVehicleLightState()                    Return the vehicle's light state.                                           
     - GetVehicleEngineState()                   Return the vehicle's engine state.                                          
     - GetVehicleLockState()                     Return the vehicle's lock state.                                            
     - GetVehicleColor1()                        Return the vehicle's 1st color ID.                                          
     - GetVehicleColor2()                        Return the vehicle's 2nd color ID.                                          
     - GetVehicleSpeed()                         Return the vehicle's current speed.                                         
     - GetPlayerRadiostationId()                 Return the player's radio state ID.                                         
     - GetPlayerRadiostationName()               Return the player's radio state name.                                       
     - GetVehicleNumberPlate()                   Return the vehicle's license plate.                                         
                                                                                                                             

 ### Location related functions:                                                                                                 
  
                                                                                                                             
     - GetPlayerCoordinates()                    Return the current player's position (coordinates).                         
     - GetPlayerPos(X, Y, Z)                     Same as above.                                                             
                                                                                                                             
  
                                                                                                                             
     - InitZonesAndCities()                      Initialize a list of all default areas.                                     
                                                 (Prerequisite for the following functions in this category).                
     - CalculateZone(X, Y, Z)                    Return the zone (or district) from the provided coordinates.                
     - CalculateCity(X, Y, Z)                    Return the city from the provided coordinates.                              
     - GetCurrentZonecode()                      Get the current zone in short form (not currently functioning).             
     - AddZone(Name, X1, Y1, Z1, X2, Y2, Z2)     Add a zone to the index.                                                    
     - AddCity(Name, X1, Y1, Z1, X2, Y2, Z2)     Add a city to the index.                                                    
     - IsPlayerInRangeOfPoint(X, Y, Z, Radius)   Check if the player is in the area and radius provided.                      
     - IsPlayerInRangeOfPoint2D(X, Y, Radius)    Check if the player is in the area and radius provided (without height).     
     - GetPlayerZone()                           Return the player's current zone.                                           
     - GetPlayerCity()                           Return the player's current city.                                           



 ### Special functions:                                                                                                           
  
                                                                                                                             
     - getServerStatus(INADDR, PORT)             Display the status of the server.                                           
     - getAttacker(bReset := false)              Return the last attacker.                                                  
     - UnlockFPS()                               Unlock FPS.                                                                
     - FormatNumber(number)                      Format a number.                                                           
     - PlayerInput(text)                         Open a player input in chat.                                               
     - DownloadToString(url, encoding = "utf-8") Download a text file as a string.                                           
     - stringMath(string)                        Calculate a math problem from a string.                                     
     - getPageSize()                             Return the current page size (from /pagesize).                             
     - SetPercentageHealthAndArmor(toggle)       Show player health and armor percentage.                                   
     - SetChatLine(line, string)                 Change the content of a specific line.                                     
     - UrlDownloadToVar(URL, ByRef Result, UserAgent = "", Proxy = "", ProxyBypass = "") URL as a variable.                 
                                                                                                                             

### Miscellaneous:                                                                                                              
  
                                                                                                                             
     - AntiCrash()                               Help against crashing with warning codes (potentially not functioning).      
                                                                                                                             

### Memory functions (used internally):                                                                                         
                                                                                                                             
     - checkHandles()                                                                                                        
     - refreshGTA()                                                                                                          
     - refreshSAMP()                                                                                                         
     - refreshMemory()                                                                                                       
     - getPID(szWindow)                                                                                                      
     - openProcess(dwPID, dwRights)                                                                                          
     - closeProcess(hProcess)                                                                                                
     - getModuleBaseAddress(sModule, dwPID)                                                                                  
     - readString(hProcess, dwAddress, dwLen)                                                                                
     - readFloat(hProcess, dwAddress)                                                                                        
     - readDWORD(hProcess, dwAddress)                                                                                        
     - readMem(hProcess, dwAddress, dwLen=4, type="UInt")                                                                    
     - writeString(hProcess, dwAddress, wString)                                                                             
     - writeRaw(hProcess, dwAddress, data, dwLen)                                                                            
     - Memory_ReadByte(process_handle, address)                                                                              
     - callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true)                                                       
     - virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect)                                                         
     - virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType)                                                                
     - createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId)        
                                                                    
     - __ansiToUnicode(sString, nLen = 0)                                                                                    
     - __unicodeToAnsi(wString, nLen = 0) 

## Variables

### Error Codes

     - global ERROR_OK                     := 0
     - global ERROR_PROCESS_NOT_FOUND      := 1
     - global ERROR_OPEN_PROCESS           := 2
     - global ERROR_INVALID_HANDLE         := 3
     - global ERROR_MODULE_NOT_FOUND       := 4
     - global ERROR_ENUM_PROCESS_MODULES   := 5
     - global ERROR_ZONE_NOT_FOUND         := 6
     - global ERROR_CITY_NOT_FOUND         := 7
     - global ERROR_READ_MEMORY            := 8
     - global ERROR_WRITE_MEMORY           := 9
     - global ERROR_ALLOC_MEMORY           := 10
     - global ERROR_FREE_MEMORY            := 11
     - global ERROR_WAIT_FOR_OBJECT        := 12
     - global ERROR_CREATE_THREAD          := 13

### GTA SA Addresses

     - global ADDR_ZONECODE                := 0xA49AD4      ;Player Zone
     - global ADDR_POSITION_X              := 0xB6F2E4      ;Player X Position
     - global ADDR_POSITION_Y              := 0xB6F2E8      ;Player Y Position
     - global ADDR_POSITION_Z              := 0xB6F2EC      ;Player Z Position
     - global ADDR_CPED_PTR                := 0xB6F5F0      ;Player CPED Pointer
     - global ADDR_CPED_HPOFF              := 0x540         ;Player Health
     - global ADDR_CPED_ARMOROFF           := 0x548         ;Player Armour
     - global ADDR_CPED_MONEY              := 0x0B7CE54     ;Player Money
     - global ADDR_CPED_INTID              := 0xA4ACE8      ;Player Interior-ID
     - global ADDR_CPED_SKINIDOFF          := 0x22          ;Player Skin-ID
     - global ADDR_VEHICLE_PTR             := 0xBA18FC      ;Vehicle CPED Pointer
     - global ADDR_VEHICLE_HPOFF           := 0x4C0         ;Vehicle Health
     - global ADDR_VEHICLE_DOORSTATE       := 0x4F8         ;Vehicle Door Status
     - global ADDR_VEHICLE_ENGINESTATE     := 0x428         ;Vehicle Engine Status
     - global ADDR_VEHICLE_LIGHTSTATE      := 0x584         ;Vehicle Light Status
     - global ADDR_VEHICLE_MODEL           := 0x22          ;Vehicle Car-ID & Car-Name
     - global ADDR_VEHICLE_TYPE            := 0x590         ;Vehicle Typ-ID (1 = Car)
     - global ADDR_VEHICLE_DRIVER          := 0x460         ;Vehicle Driver
     - global ADDR_VEHICLE_X               := 0x44          ;Vehicle Speed X
     - global ADDR_VEHICLE_Y               := 0x48          ;Vehicle Speed Y
     - global ADDR_VEHICLE_Z               := 0x4C          ;Vehicle Speed Z
     - global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
     - global oBikeModels := [481,509,510]
     - global ovehicleNames := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
     - global oweaponNames := ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana","Chainsaw","Purple Dildo","Dildo","Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "9mm","Silenced 9mm","Desert Eagle","Shotgun","Sawnoff Shotgun","Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge","Detonator","Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]
     - global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
     - global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]

### GTA SAMP Addresses

     - global ADDR_SAMP_INCHAT_PTR                 := 0x26EA24
     - global ADDR_SAMP_INCHAT_PTR_OFF             := 0x60
     - global ADDR_SAMP_USERNAME                   := 0x26E16F
     - global FUNC_SAMP_SENDCMD                    := 0x69900
     - global FUNC_SAMP_SENDSAY                    := 0x05A10
     - global FUNC_SAMP_ADDTOCHATWND               := 0x68070
     - global ADDR_SAMP_CHATMSG_PTR                := 0x26E9F8
     - global FUNC_SAMP_SHOWGAMETEXT               := 0xA70C0
     - global FUNC_SAMP_PLAYAUDIOSTR               := 0x62da0
     - global FUNC_SAMP_STOPAUDIOSTR               := 0x629a0

### Dialog Styles

     - global DIALOG_STYLE_MSGBOX                  := 0
     - global DIALOG_STYLE_INPUT                   := 1
     - global DIALOG_STYLE_LIST                    := 2
     - global DIALOG_STYLE_PASSWORD                := 3
     - global DIALOG_STYLE_TABLIST                 := 4
     - global DIALOG_STYLE_TABLIST_HEADERS         := 5

### Dialog Structures

     - global SAMP_DIALOG_STRUCT_PTR               := 0x26E9C8
     - global SAMP_DIALOG_PTR1_OFFSET              := 0x1C
     - global SAMP_DIALOG_LINES_OFFSET             := 0x44C
     - global SAMP_DIALOG_INDEX_OFFSET             := 0x443
     - global SAMP_DIALOG_BUTTON_HOVERING_OFFSET   := 0x465
     - global SAMP_DIALOG_BUTTON_CLICKED_OFFSET    := 0x466
     - global SAMP_DIALOG_PTR2_OFFSET              := 0x20
     - global SAMP_DIALOG_LINECOUNT_OFFSET         := 0x150
     - global SAMP_DIALOG_OPEN_OFFSET              := 0x28
     - global SAMP_DIALOG_STYLE_OFFSET             := 0x2C
     - global SAMP_DIALOG_ID_OFFSET                := 0x30
     - global SAMP_DIALOG_TEXT_PTR_OFFSET          := 0x34
     - global SAMP_DIALOG_CAPTION_OFFSET           := 0x40
     - global FUNC_SAMP_SHOWDIALOG                 := 0x6FFE0
     - global FUNC_SAMP_CLOSEDIALOG                := 0x70660

### Scoreboard

     - global FUNC_UPDATESCOREBOARD                := 0x8F10
     - global SAMP_INFO_OFFSET                     := 0x26EA0C
     - global ADDR_SAMP_CRASHREPORT                := 0x5CF2C
     - global SAMP_PPOOLS_OFFSET                   := 0x3CD
     - global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
     - global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
     - global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
     - global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
     - global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
     - global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
     - global SAMP_ISTRLENNAME___OFFSET            := 0x1C
     - global SAMP_SZPLAYERNAME_OFFSET             := 0xC
     - global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
     - global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
     - global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
     - global SAMP_IPING_OFFSET                    := 0x28
     - global SAMP_ISCORE_OFFSET                   := 0x24
     - global SAMP_ISNPC_OFFSET                    := 0x4
     - global SAMP_PLAYER_MAX                      := 1004

### Checkpoints
     
     - global ADDR_CP_CHECK                        := 0xC7DEEA
     - global ADDR_REDMARKER                       := [0xC7DEC8, 0xC7DECC, 0xC7DED0]

### Backend

     - global hGTA                                 := 0x0
     - global dwGTAPID                             := 0x0
     - global dwSAMP                               := 0x0
     - global pMemory                              := 0x0
     - global pParam1                              := 0x0
     - global pParam2                              := 0x0
     - global pParam3                              := 0x0
     - global pParam4                              := 0x0
     - global pParam5                              := 0x0
     - global pInjectFunc                          := 0x0
     - global nZone                                := 1
     - global nCity                                := 1
     - global bInitZaC                             := 0
     - global iRefreshScoreboard                   := 0
     - global oScoreboardData                      := ""
     - global iRefreshHandles                      := 0
     - global iUpdateTick                          := 2500 
