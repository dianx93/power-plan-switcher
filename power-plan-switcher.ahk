#NoEnv
#SingleInstance Force

; Set power plan GUIDs
highGUID    := "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
balancedGUID:= "381b4222-f694-41f0-9685-ff5bb260df2e"
saverGUID   := "a1841308-3541-4fab-bc81-f71556f20b4a"

; Icon paths – update these paths as needed
iconHigh    := "C:\Icons\icons8-rocket-16-outlined.ico"
iconBalanced:= "C:\Icons\icons8-scales-16-outlined.ico"
iconSaver   := "C:\Icons\icons8-turtle-16-outlined.ico"

; Build the tray menu
Menu, Tray, NoStandard
Menu, Tray, Add, High Performance, SwitchHigh
Menu, Tray, Add, Balanced, SwitchBalanced
Menu, Tray, Add, Power Saver, SwitchSaver
Menu, Tray, Add   ; Separator
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Tip, Power Plan Switcher

; Wait a brief moment for tray initialization
Sleep, 100

; Determine current power plan and update tray icon
tempFile := A_Temp "\plan.txt"

RunWait, %ComSpec% /c powercfg /getactivescheme > "%tempFile%",, Hide

FileRead, result, %tempFile%

; Extract the GUID using regex
RegExMatch(result, "GUID:\s*([a-fA-F0-9\-]+)", planID)

currentPlan := planID1

; Compare with known GUIDs (assumed to be defined elsewhere in your script)
if (currentPlan = highGUID) {
    Menu, Tray, Icon, %iconHigh%
} else if (currentPlan = balancedGUID) {
    Menu, Tray, Icon, %iconBalanced%
} else if (currentPlan = saverGUID) {
    Menu, Tray, Icon, %iconSaver%
}

; Hotkeys for switching power plans

^!i::  ; Ctrl+Alt+I: High Performance
    Run, powercfg /setactive %highGUID%,, Hide
    Menu, Tray, Icon, %iconHigh%
return

^!o::  ; Ctrl+Alt+O: Balanced
    Run, powercfg /setactive %balancedGUID%,, Hide
    Menu, Tray, Icon, %iconBalanced%
return

^!p::  ; Ctrl+Alt+P: Power Saver
    Run, powercfg /setactive %saverGUID%,, Hide
    Menu, Tray, Icon, %iconSaver%
return

; Menu labels (in case you use the tray menu)
SwitchHigh:
    Run, powercfg /setactive %highGUID%,, Hide
    Menu, Tray, Icon, %iconHigh%
return

SwitchBalanced:
    Run, powercfg /setactive %balancedGUID%,, Hide
    Menu, Tray, Icon, %iconBalanced%
return

SwitchSaver:
    Run, powercfg /setactive %saverGUID%,, Hide
    Menu, Tray, Icon, %iconSaver%
return

ExitScript:
    ExitApp
return
