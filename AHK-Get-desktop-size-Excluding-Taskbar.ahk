;Get Work area-----------------------------------------------------------
SysGet, DeskTop_Width, 78
SysGet, DeskTop_Height, 79
;------------------------------------------------------------------------
;Get TaskBar area--------------------------------------------------------
WinGetPos, TaskbarX, TaskbarY, TaskbarW, TaskbarH, ahk_class Shell_TrayWnd
;------------------------------------------------------------------------

;Calculate were the taskbar is, Use this script snippet for stuff like Gui's that need to know were the taskbar is so you don't over lap with it.
If (TaskbarY >= 225 && TaskbarX = 0) {
;TaskBar is on bottom of screen
Msgbox, TaskBar is on the Bottom of the Desktop.
GUI_X := 0
GUI_Y := 0
GUI_W := DeskTop_Width
GUI_H := DeskTop_Height
GUI_H -= TaskbarH
Goto, CPE
}
;------------------------------------------------------------------------
If (TaskbarY = 0 && TaskbarX = 0 && TaskbarH >= 419) {
;TaskBar is on left side of screen
Msgbox, TaskBar is on the Left side of the Desktop.
GUI_X := TaskbarW
GUI_Y := 0
GUI_W := DeskTop_Width
GUI_W -= TaskbarW
GUI_H := DeskTop_Height
Goto, CPE
}
;------------------------------------------------------------------------
If (TaskbarY = 0 && TaskbarX > 400) {
;TaskBar is on right side of screen
Msgbox, TaskBar is on the Right side of the Desktop.
GUI_X := 0
GUI_Y := 0
GUI_W := DeskTop_Width
GUI_W -= TaskbarW
GUI_H := DeskTop_Height
Goto, CPE
}
;------------------------------------------------------------------------
If (TaskbarY = 0 && TaskbarX = 0 && TaskbarW >= 800) {
;TaskBar is on top of screen
Msgbox, TaskBar is on the Top of the Desktop.
GUI_X := 0
GUI_Y := TaskbarH
GUI_W := DeskTop_Width
GUI_H := DeskTop_Height
GUI_H -= TaskbarH
Goto, CPE
}
;------------------------------------------------------------------------
Return
;----------------------------

CPE:
Gui, +LastFound -Caption -Border +ToolWindow +AlwaysOnTop
Gui, Color, 92001A 
Gui, Show, x%GUI_X% y%GUI_Y% w%GUI_W% h%GUI_H% , TestGui
sleep, 5000
Exitapp

Esc::exitapp