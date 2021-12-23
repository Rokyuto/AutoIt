#include <GUIConstants.au3>
#include <MsgBoxConstants.au3>

#cs
Global $selected
GUICreate("TEST1", 400, 400)
GUISetState(@SW_SHOW)
Opt('GUIOnEventMode', 1)

hotkeyset("{ESC}", "terminate")
HotKeySet("{f7}",  "GO")
hotkeyset("{f8}",  "selectiontest")

$combo1  =  GUICtrlCreateCombo("box1", 50, 50, 200, 100, 3)  ; create combo box
GUICtrlSetData($combo1,"item1||item2|item3|item4|item5" )       ; Set data in Combo Box1
$selected = GuiCtrlRead($combo1)

GO()

func GO()

    if $selected = "box1" Then
        MsgBox(1, " Selection", "box1")
    EndIf
        if $selected = "item1" Then
        msgbox(1, "Selection", "item1")
    EndIf
        if $selected = "item2" Then
        msgbox(1, "Selection", "item2")
    EndIf
        if $selected = "item33" then
        msgbox(1,"selection","item3")
    EndIf
        if $selected = "item4" then
        msgbox(1,"selection","item4")
    EndIf
        if $selected = "item5" Then
        msgbox(1,"selection", "item5")
    EndIf

EndFunc

func selectiontest()                                                         ;; $selected = ??
    MsgBox(1,"What is selected???", $selected )
EndFunc

while 1                                                                            ;idle
    sleep(250)
    WEnd

func terminate()                                                                      ;exit
    Exit 0
EndFunc

#include <GUIConstants.au3>
hotkeyset("{ESC}", "terminate")
GUICreate("TEST1", 400, 400)
GUISetState(@SW_SHOW)

$combo1  =  GUICtrlCreateCombo("box1", 50, 50, 200, 100, 3); create combo box
$button = GUICtrlCreateButton("ok" , 50, 250, 50, 20)
GUICtrlSetData($combo1,"item1||item2|item3|item4|item5" )      ; Set data in Combo Box1

While 1
    $msg = GUIGetMsg()
    Select
        Case $msg = $GUI_EVENT_CLOSE
            ExitLoop
        Case $msg = $button
            Local $a = GuiCtrlRead($combo1)
            Select
                case $a = "item1"
                    MsgBox(0,"","hello")
                case $a = "item2"
                    MsgBox(0,"","hello2")
            EndSelect
    EndSelect
Wend

func terminate()                                                                     ;exit
    Exit 0
EndFunc

#ce

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiComboBoxEx.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 197, 66, 192, 124)
$Label1 = GUICtrlCreateLabel("Choose color:", 10, 12, 93, 17)
$Combo1 = GUICtrlCreateCombo("Choose here...", 106, 10, 81, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Black|White|Red|Green|Blue|Orange")
$Button1 = GUICtrlCreateButton("Start", 50, 32, 97, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
    $color_chosen = GUICtrlRead($Combo1)
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
        Case $Button1
            $color_chosen = GUICtrlRead($Combo1)
            Switch $color_chosen
                Case "Black"
                    ConsoleWrite("Black")
                    $_Start = 1
                Case "White"
                    ConsoleWrite("White")
                    $_Start = 1
                Case "Red", "Blue"
                    MsgBox(16, "Error", "Sorry, you chose an unavailable color") ;the problem is that the msgbox is infinite
                    $_Start =0
                    ;here i want a code that resets the combobox
                Case "Green"
                    ;do something
                    $_Start = 1
                Case "Orange"
                    ;do something Else
                    $_Start = 1
            EndSwitch
            ;If $_Start Then Start()

			;here i want a code that resets the combobox
            _GUICtrlComboBox_SetEditText ($Combo1, "Choose here..." )

    EndSwitch
WEnd



Func Start()
    ;do this
EndFunc