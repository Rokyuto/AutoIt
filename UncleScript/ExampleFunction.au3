HotKeySet("{ESC}", "CallTerminate") ;????? ?? ??????? ?? ????????????

Example()




Func Example() ;?????? ???????? ???????

;======== ????? ?? ???


Run("notepad.exe")

WinWaitActive("Untitled - Notepad")

Send("The Program WORKS.")

;Sleep (1000)

WinClose("[CLASS:Notepad]", "")

WinWaitActive("Notepad", "Save")

Send("{ENTER}")

WinWaitActive("Save As", "Save")

Send("MyNotepad")

Send("{ENTER}")

Send("{TAB},{ENTER}")


;======== ????? ?? ???

EndFunc





Func CallTerminate() ;??????? ?? ??????? ?? ????????????
    Exit
EndFunc