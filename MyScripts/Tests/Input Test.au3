#include <GUIConstants.au3>

$main_GUI = GUICreate ("Main GUI", 200 , 100,-1,-1,$WS_POPUPWINDOW + $WS_THICKFRAME)
$b_1 = GUICtrlCreateButton("Show Child GUI", 10, 20,120, 30)
$x = GUICtrlCreateButton("Exit", 10, 60,120, 30)
GUISetState(@SW_SHOW, $main_GUI)
$a = WinGetPos ($main_GUI)
$child_GUI = GUICreate("Child GUI",200,100,$a[0] + 210 , $a[1],$WS_POPUPWINDOW + $WS_THICKFRAME)
GUICtrlCreateLabel("This is the Child GUI", 50, 30,120, 30)
$b_2 = GUICtrlCreateButton("Close Child GUI", 40, 60,120, 30)
GUISetState(@SW_HIDE, $child_GUI)

While 1
    $msg = GUIGetMsg()
    Select
        Case $msg = $x
            Exit
        Case $msg = $b_1
            GUISetState (@SW_SHOW, $child_GUI)
            GUICtrlSetState ($b_1 , $gui_disable)
        Case $msg = $b_2
            GUISetState (@SW_HIDE, $child_GUI)
            GUICtrlSetState ($b_1 , $gui_enable)
    EndSelect
WEnd