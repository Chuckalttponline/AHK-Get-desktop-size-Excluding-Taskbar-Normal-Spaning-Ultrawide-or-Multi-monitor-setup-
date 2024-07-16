#Requires AutoHotkey v2.0 ;Tells the AHK interpreter that we're using v2.
;Get Work area-----------------------------------------------------------
DeskTop_Width := SysGet(78)
DeskTop_Height := SysGet(79)
;------------------------------------------------------------------------
;Get TaskBar area--------------------------------------------------------
WinGetPos(&TaskbarX, &TaskbarY, &TaskbarW, &TaskbarH, "ahk_class Shell_TrayWnd")
;------------------------------------------------------------------------

;Calculate were the taskbar is, Use this script snippet for stuff like Gui's that need to know were the taskbar is so you don't over lap with it.
If (TaskbarY >= 225 && TaskbarX = 0) {
;TaskBar is on bottom of screen
MsgBox("TaskBar is on the Bottom of the Desktop.")
GUI_X := 0
GUI_Y := 0
GUI_W := DeskTop_Width
GUI_H := DeskTop_Height
GUI_H -= TaskbarH
Goto CPE
}
;------------------------------------------------------------------------
If (TaskbarY = 0 && TaskbarX = 0 && TaskbarH >= 419) {
;TaskBar is on left side of screen
MsgBox("TaskBar is on the Left side of the Desktop.")
GUI_X := TaskbarW
GUI_Y := 0
GUI_W := DeskTop_Width
GUI_W -= TaskbarW
GUI_H := DeskTop_Height
Goto CPE
}
;------------------------------------------------------------------------
If (TaskbarY = 0 && TaskbarX > 400) {
;TaskBar is on right side of screen
MsgBox("TaskBar is on the Right side of the Desktop.")
GUI_X := 0
GUI_Y := 0
GUI_W := DeskTop_Width
GUI_W -= TaskbarW
GUI_H := DeskTop_Height
Goto CPE
}
;------------------------------------------------------------------------
If (TaskbarY = 0 && TaskbarX = 0 && TaskbarW >= 800) {
;TaskBar is on top of screen
MsgBox("TaskBar is on the Top of the Desktop.")
GUI_X := 0
GUI_Y := TaskbarH
GUI_W := DeskTop_Width
GUI_H := DeskTop_Height
GUI_H -= TaskbarH
Goto CPE
}
;------------------------------------------------------------------------
Return
;----------------------------

CPE:
myGui := Gui()
myGui.Opt("+LastFound -Caption -Border +ToolWindow +AlwaysOnTop")
myGui.BackColor := "92001A"
myGui.Title := "TestGui"
myGui.Show("x" . GUI_X . " y" . GUI_Y . " w" . GUI_W . " h" . GUI_H)
Sleep(5000)
ExitApp()

Esc::ExitApp()