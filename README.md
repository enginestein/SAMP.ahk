# SAMP.dev-Wrappers

These are the wrappers from [SAMP.dev](https://github.com/enginestein/SAMP.dev). 

# Docs

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
