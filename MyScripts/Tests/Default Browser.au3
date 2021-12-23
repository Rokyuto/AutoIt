;ShellExecute("https://ext.agarbot.ovh")
#cs
#include <APIRegConstants.au3>
#include <WinAPIReg.au3>

ConsoleWrite(_getDefaultBrowser() & @crlf)

Func _getDefaultBrowser()
    Return _WinAPI_AssocQueryString(".html", $ASSOCSTR_EXECUTABLE)
EndFunc   ;==>_getDefaultBrowser

#ce

$Browser = ObjCreate("Shell.Application")
$Browser.Open("https://ext.agarbot.ovh")