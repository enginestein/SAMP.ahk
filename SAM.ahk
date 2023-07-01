;  /$$$$$$   /$$$$$$  /$$      /$$ /$$$$$$$   /$$$$$$  /$$   /$$ /$$   /$$
; /$$__  $$ /$$__  $$| $$$    /$$$| $$__  $$ /$$__  $$| $$  | $$| $$  /$$/
;| $$  \__/| $$  \ $$| $$$$  /$$$$| $$  \ $$| $$  \ $$| $$  | $$| $$ /$$/
;|  $$$$$$ | $$$$$$$$| $$ $$/$$ $$| $$$$$$$/| $$$$$$$$| $$$$$$$$| $$$$$/
; \____  $$| $$__  $$| $$  $$$| $$| $$____/ | $$__  $$| $$__  $$| $$  $$
; /$$  \ $$| $$  | $$| $$\  $ | $$| $$      | $$  | $$| $$  | $$| $$\  $$
;|  $$$$$$/| $$  | $$| $$ \/  | $$| $$      | $$  | $$| $$  | $$| $$ \  $$
; \______/ |__/  |__/|__/     |__/|__/      |__/  |__/|__/  |__/|__/  \__/
;
; ################################
; https://github.com/kessec/SAMPAHK
; ################################

; UPDATE THIS OR YOUR MERGE WILL BE CLOSED.
Version := "SAM CORE VERSION: 1.1.0"

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#IfWinActive GTA:SA:MP
#Persistent

PIDS := Array()
Names := Array()
logLoc = %A_ScriptDir%\log.txt

; Logging basic information.
FormatTime, tsVar, T12, Time
FileDelete, %logLoc%
FileAppend,/$$$$$$   /$$$$$$  /$$      /$$ /$$$$$$$   /$$$$$$  /$$   /$$ /$$   /$$`n/$$__  $$ /$$__  $$| $$$    /$$$| $$__  $$ /$$__  $$| $$  | $$| $$  /$$/`n| $$  \__/| $$  \ $$| $$$$  /$$$$| $$  \ $$| $$  \ $$| $$  | $$| $$ /$$/`n|  $$$$$$ | $$$$$$$$| $$ $$/$$ $$| $$$$$$$/| $$$$$$$$| $$$$$$$$| $$$$$/`n\____  $$| $$__  $$| $$  $$$| $$| $$____/ | $$__  $$| $$__  $$| $$  $$`n/$$  \ $$| $$  | $$| $$\  $ | $$| $$      | $$  | $$| $$  | $$| $$\  $$`n|  $$$$$$/| $$  | $$| $$ \/  | $$| $$      | $$  | $$| $$  | $$| $$ \  $$`n\______/ |__/  |__/|__/     |__/|__/      |__/  |__/|__/  |__/|__/  \__/ `n, %logLoc%
FileAppend, %Version%`n, %logLoc%
FileReadLine, cVersion, %A_ScriptDir%\sam_mods\SAMP.ahk, 17
FileAppend, %cVersion%`n`n, %logLoc%
FileAppend, %tsVar%: SAM Core successfully loaded.`n, %logLoc%

; Waits for the game to start up. No better solution currently.
Sleep, 20000
;Launches all the .ahk and .exe files in the mod folder, storing their PID and name for later reference.
Loop, %A_ScriptDir%\sam_mods\*.ahk{
    Run, %A_LoopFileFullPath% ,,, vPID
    SplitPath % A_LoopFileFullPath,,,, name
    Names.push(name)
    FormatTime, tsVar, T12, Time
    FileAppend, %tsVar%: %name% successfully loaded.`n, %logLoc%
    PIDS.push(vPID)
  }

Loop, %A_ScriptDir%\sam_mods\*.exe{
  Run, %A_LoopFileFullPath%
  SplitPath % A_LoopFileFullPath, name
  Names.push(name)
  FormatTime, tsVar, T12, Time
  FileAppend, %tsVar%: %name% successfully loaded.`n, %logLoc%
  PIDS.push(vPID)
}

; Checks when GTA:SA:MP is closed and then proceeds to close all the mods that were launched.
while(true)
{
 if(!WinExist("GTA:SA:MP")){
    Loop % PIDS.Length()
    {
      FormatTime, tsVar, T12, Time
      vTemp := PIDS[A_Index]
      vName := Names[A_Index]
      FileAppend, %tsVar%: %vName% sucessfully closed.`n, %logLoc%
      Process, Close, %vTemp%
    }
    FormatTime, tsVar, T12, Time
    FileAppend, %tsVar%: SAM Core sucessfully closed.`n, %logLoc%
    ExitApp
}
}
