# SAMP.ahk
SAMP.ahk is an library specifically made to be used inside of [AutoHotKey](https://www.ahkscript.org). A part of the library comes from [SAMPUDF](https://github.com/paul-phoenix/SAMP-UDF-for-AutoHotKey) made by paul-phoenix, linked above. The end goal for SAMPAHK is to be able to provide a more complete platform for SA-MP memory modding in AutoHotKey. If you have any issues with the program, please leave an issue ticket.


### SUPPORTED SAMP VERSIONS
_Currently. only [SA-MP Version 0.3.7 R1.](https://dracoblue.net/downloads/samp-client/) and Version 1 of the GTA SA Executable._

### IN ORDER FOR THIS TO WORK, YOU MUST MUST MUST BE USING [AutoHotKey](https://autohotkey.com) (32 BIT)
Do not make issues or talk about errors in 64 bit. The library will not work in 64 bit.


### USAGE (WHEN WRITING)
#### (MAKE SURE THE MOD YOU ARE WRITING IS IN THE SAM_MODS WITH SAMP.AHK)

#### Referencing the API in your script:
```autohotkey
SendMode Input
SetWorkingDir %A_ScriptDir%
#Warn
#UseHook
#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMP.ahk
```
#### Example of script usage:
```autohotkey
SendMode Input
SetWorkingDir %A_ScriptDir%
#Warn
#UseHook
#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMP.ahk
```
