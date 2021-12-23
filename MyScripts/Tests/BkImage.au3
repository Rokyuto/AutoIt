#include <GUIConstantsEx.au3>
Global $hGuiWin = GUICreate ( "Contacts DB", 920, 660)
GUISetBkColor (0x000000, $hGuiWin )
GUICtrlCreatePic('C:\Program Files (x86)\AutoIt3\Examples\GUI\msoobe.jpg', 0, 0, 920, 660)
GUICtrlSetState(-1, $GUI_DISABLE)
GUISetState(@SW_SHOW)

    Do
        $msg = GUIGetMsg()

    Until $msg = $GUI_EVENT_CLOSE
Exit