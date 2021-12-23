#include <StaticConstants.au3>

Const $iGUIWidth = 800
Const $iGUIHeight = 200

$hGui = GUICreate("Testing", 800, 200)
GUISetFont(20)
GUISetState()
$hLabelMessage = GUICtrlCreateLabel("Vertically centered", 0, 0, 800, 200, $SS_CENTERIMAGE)
Sleep(900)
GUICtrlDelete($hLabelMessage)
$hLabelMessage = GUICtrlCreateLabel("Horizontally centered", 0, 0, 800, 200, $SS_CENTER)
Sleep(900)
GUICtrlDelete($hLabelMessage)
$hLabelMessage = GUICtrlCreateLabel("Both vertically and horizontally centered", 0, 0, 800, 200, BitOR($SS_CENTER, $SS_CENTERIMAGE))
Sleep(900)