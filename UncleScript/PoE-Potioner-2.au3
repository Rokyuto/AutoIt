#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <excel.au3>


HotKeySet("{PAUSE}", "TerminateAPP")
HotKeySet("{`}", "FastPots")
HotKeySet("+{`}", "FastBuffs")

Call ("NewPots")

;==========================================> Define GUI Menu

Func NewPots ()
	;Global $nPots = InputBox("Activation Sequence", "Type in all buttons to press:", "",)

	;Opt("GUICoordMode", 2)
    ;Opt("GUIResizeMode", 1)
    Opt("GUIOnEventMode", 1)

	GUICreate("Activation Sequence", 500, 320, -1, -1)

	GUICtrlCreateLabel("Button:",270,20,200,20)
	GUICtrlCreateLabel("Delay:",400,20,200,20)

	GUICtrlCreateLabel("Action 1:",30,50,200,20) ;Button 01
	Global $nSkillButton01 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillButton01", ""), 270, 50, 70, 20,-1)
	Global $nSkillTime01 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillTime01", ""), 400, 50, 70, 20,$ES_NUMBER)

	GUICtrlCreateLabel("Action 2:",30,80,200,20) ;Button 02
	Global $nSkillButton02 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillButton02", ""), 270, 80, 70, 20,-1)
	Global $nSkillTime02 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillTime01", ""), 400, 80, 70, 20,$ES_NUMBER)

	GUICtrlCreateLabel("Action 3:",30,110,200,20) ;Button 03
	Global $nSkillButton03 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillButton03", ""), 270, 110, 70, 20,-1)
	Global $nSkillTime03 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillTime01", ""), 400, 110, 70, 20,$ES_NUMBER)

	GUICtrlCreateLabel("Action 4:",30,140,200,20) ;Button 04
	Global $nSkillButton04 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillButton04", ""), 270, 140, 70, 20,-1)
	Global $nSkillTime04 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillTime01", ""), 400, 140, 70, 20,$ES_NUMBER)

	GUICtrlCreateLabel("Action 5:",30,170,200,20) ;Button 05
	Global $nSkillButton05 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillButton05", ""), 270, 170, 70, 20,-1)
	Global $nSkillTime05 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillTime01", ""), 400, 170, 70, 20,$ES_NUMBER)

	GUICtrlCreateLabel("Buffs 1:",30,220,200,20) ;Button 06
	Global $nSkillButton06 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillButton06", ""), 270, 220, 70, 20,-1)
	Global $nSkillTime06 = GUICtrlCreateInput (IniRead("config.ini", "Config", "SkillTime01", ""), 400, 220, 70, 20,$ES_NUMBER)

	GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
    GUISetOnEvent($GUI_EVENT_MINIMIZE, "SpecialEvents")
    GUISetOnEvent($GUI_EVENT_RESTORE, "SpecialEvents")

    GUICtrlCreateButton("OK", 130, 270, 100, 30)
    GUICtrlSetOnEvent(-1, "OKPressed")

    GUICtrlCreateButton("Cancel", 270, 270, 100, 30)
    GUICtrlSetOnEvent(-1, "CancelPressed")

    GUISetState(@SW_SHOW)

EndFunc

While 1 ;==>Iddle
	Sleep(100)
WEnd

;==========================================> Execute Potion Buttons

Func FastPots ()
	;Send ($npots,1)
	Send (GUICtrlRead($nSkillButton01),1)
	Sleep (GUICtrlRead($nSkillTime01))
	Send (GUICtrlRead($nSkillButton02),1)
	Sleep (GUICtrlRead($nSkillTime02))
	Send (GUICtrlRead($nSkillButton03),1)
	Sleep (GUICtrlRead($nSkillTime03))
	Send (GUICtrlRead($nSkillButton04),1)
	Sleep (GUICtrlRead($nSkillTime04))
	Send (GUICtrlRead($nSkillButton05),1)
	Sleep (GUICtrlRead($nSkillTime05))
EndFunc

;==========================================> Execute Buff Buttons

Func FastBuffs ()
	;Send ($npots,1)
	Send (GUICtrlRead($nSkillButton06),1)
	Sleep (GUICtrlRead($nSkillTime06))
EndFunc

;==========================================> Manage GUI Menu

Func OKPressed()
    ;MsgBox($MB_SYSTEMMODAL, "OK Pressed", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle & " CtrlHandle=" & @GUI_CtrlHandle)
	;IniWrite("config.ini", "Config", "Input1", $sInput1_Value)
	IniWrite("config.ini", "Config", "SkillButton01", GUICtrlRead($nSkillButton01))
	IniWrite("config.ini", "Config", "SkillTime01", GUICtrlRead($nSkillTime01))
	IniWrite("config.ini", "Config", "SkillButton02", GUICtrlRead($nSkillButton02))
	IniWrite("config.ini", "Config", "SkillTime02", GUICtrlRead($nSkillTime02))
	IniWrite("config.ini", "Config", "SkillButton03", GUICtrlRead($nSkillButton03))
	IniWrite("config.ini", "Config", "SkillTime03", GUICtrlRead($nSkillTime03))
	IniWrite("config.ini", "Config", "SkillButton04", GUICtrlRead($nSkillButton04))
	IniWrite("config.ini", "Config", "SkillTime04", GUICtrlRead($nSkillTime04))
	IniWrite("config.ini", "Config", "SkillButton05", GUICtrlRead($nSkillButton05))
	IniWrite("config.ini", "Config", "SkillTime05", GUICtrlRead($nSkillTime05))
	IniWrite("config.ini", "Config", "SkillButton06", GUICtrlRead($nSkillButton06))
	IniWrite("config.ini", "Config", "SkillTime06", GUICtrlRead($nSkillTime06))

	GUISetState(@SW_HIDE)
EndFunc   ;==>OKPressed

Func CancelPressed()
    ;MsgBox($MB_SYSTEMMODAL, "Cancel Pressed", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle & " CtrlHandle=" & @GUI_CtrlHandle)
	Call ("TerminateAPP")
EndFunc   ;==>CancelPressed

Func SpecialEvents()
    Select
        Case @GUI_CtrlId = $GUI_EVENT_CLOSE
            ;MsgBox($MB_SYSTEMMODAL, "Close Pressed", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)

            GUIDelete()
            Exit

        Case @GUI_CtrlId = $GUI_EVENT_MINIMIZE
            ;MsgBox($MB_SYSTEMMODAL, "Window Minimized", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)

        Case @GUI_CtrlId = $GUI_EVENT_RESTORE
            ;MsgBox($MB_SYSTEMMODAL, "Window Restored", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)

    EndSelect
EndFunc   ;==>SpecialEvents

;==========================================> Kill Application

Func TerminateAPP() ;==>Terminate
	;MsgBox($MB_SYSTEMMODAL, "Close Pressed", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)

	GUIDelete()
	Exit
EndFunc