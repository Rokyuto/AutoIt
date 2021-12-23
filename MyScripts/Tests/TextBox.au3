#include <GUIConstants.au3>

; GUI
GUICreate("Auto Loader", 200, 150)

; LABEL
$Label_1 = GUICtrlCreateLabel("Name", 30, 20, 100, 20)

; Input
$Input_1 = GUICtrlCreateInput("Admin", 70, 20, 90, 20)

; BUTTON
$RUN_1 = GUICtrlCreateButton("OK", 50, 50, 100, 50)

; GUI MESSAGE LOOP
GUISetState()





While 1
    $MSG = GUIGetMsg()
    Select
        Case $MSG = $GUI_EVENT_CLOSE
            Exit
        Case $MSG = $RUN_1
           $user = GUICtrlRead($Input_1)
           MsgBox(0,"User", $user )
    EndSelect

WEnd