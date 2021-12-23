#cs
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>

Opt('MustDeclareVars', 0)

Example()

Func Example()

Local $file1, $file2, $file3, $btn, $msg
$sIni = @DesktopDir & "\Notes Setup.ini"

GUICreate("Notes Setup.ini", 300, 185)
GUICtrlCreateLabel("Employee ID", 10, 20)
$file1 = GUICtrlCreateInput("", 10, 35, 150, 20)
;GUICtrlRead($file1, 1) some tests
;IniWrite("C:\users\*******\desktop\Notes Setup.ini", "Notes Variables", "EmployeeID") some tests
GUICtrlCreateLabel("Domino Server", 10, 60)
$file2 = GUICtrlCreateInput("", 10, 75, 150, 20)
GUICtrlCreateLabel("Password", 10, 100)
$file3 = GUICtrlCreateInput("", 10, 115, 150, 20, $ES_PASSWORD, 0x0020)
$btn = GUICtrlCreateButton("OK", 125, 150, 60)

GUISetState()
$msg = 0
While $msg <> $GUI_EVENT_CLOSE
$msg = GUIGetMsg()
Select
Case $msg = $btn
IniWrite($sIni,"Notes Variable","Employee ID",GUICtrlRead($file1))
IniWrite($sIni,"Notes Variable","Domino Server",GUICtrlRead($file2))
IniWrite($sIni,"Notes Variable","Password",GUICtrlRead($file3))
ExitLoop
EndSelect
WEnd

MsgBox(4096, "Notes Setup", "Starting Notes Setup")
EndFunc

#ce
