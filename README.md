# SAMP.ahk

SAMP.ahk is a library specifically designed to be used with [AutoHotKey](https://www.ahkscript.org). It incorporates a portion of the [SAMPUDF](https://github.com/paul-phoenix/SAMP-UDF-for-AutoHotKey) library created by paul-phoenix, which is linked above. The ultimate goal of SAMP.ahk is to provide a more comprehensive platform for SA-MP memory modding in AutoHotKey. If you encounter any issues with the program, please open an issue ticket.

## Supported SA-MP Versions
Currently, only [SA-MP Version 0.3.7 R1](https://dracoblue.net/downloads/samp-client/) and Version 1 of the GTA SA Executable are supported.

## Prerequisites
In order for SAMP.ahk to work properly, you must be using [AutoHotKey](https://autohotkey.com) (32-bit). Please note that the library will not function in a 64-bit environment. 

## Usage (When Writing)
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

3. Here is an example of script usage:

```autohotkey
SendMode Input
SetWorkingDir %A_ScriptDir%
#Warn
#UseHook
#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMP.ahk
```

Feel free to modify and enhance this readme as needed.
