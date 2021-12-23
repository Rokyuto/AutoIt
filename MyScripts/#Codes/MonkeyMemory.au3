#include <GUIConstantsEx.au3>
#include <Array.au3>
#include <ColorConstants.au3>
#include <FontConstants.au3>
#include <StaticConstants.au3>
#include <MsgBoxConstants.au3>

HotKeySet("{ESC}", "TerminateApp")

Global $Label_Font = "BankGothic Md BT"
Global $Button_Text_Font = "Fixedsys"

Global $Player_Score = 0

Start()

Func Start()

	Local $Start_Window = GUICreate("Start", 300,300,-1,-1)
	GUISetBkColor($COLOR_BLACK, $Start_Window)
	GUISetState(@SW_SHOW)

	Local $Game_Name_Label = GUICtrlCreateLabel("MONKEY MEMORY GAME",0,100,300,100,$SS_CENTER)
	GUICtrlSetColor(-1, $COLOR_WHITE)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC , $Label_Font)

	Local $Start_Button = GUICtrlCreateButton("START",75,200,150,50,$SS_CENTER)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC , $Button_Text_Font)
	GUICtrlSetBkColor($Start_Button,0x3cd070)

	While 1
		$stMsg = GUIGetMsg()

		Select

			Case $stMsg = $Start_Button
				GUIDelete($Start_Window)
				MainFunc()

			Case $stMsg = $GUI_EVENT_CLOSE
				Exit

		EndSelect
	WEnd

EndFunc

Func MainFunc()

	Global $Window_GUI = GUICreate("Monkey Memory Game",900,900,-1,-1)
	GUISetBkColor($COLOR_BLACK, $Window_GUI)
	GUISetState(@SW_SHOW)

	;Variables
	Global $ButtonsQuantity = 0

	Local $Button_X_Coord = 250 , $Button_Y_Coord = 250

	Local $Buttons_On_Row = 0 , $Buttons_On_Column = 1

	Global $New_Button
	Global $Button_Index_List[0]
	Global $New_Button_Pressed

	Global $Level_1_Score = 5 , $Level_2_Score = 10 , $Level_3_Score = 15 , $Level_4_Score = 20 , $Level_5_Score = 25

	Global $Score_Label = GUICtrlCreateLabel("Score: " & $Player_Score,600,100,300,50)
	GUICtrlSetColor(-1, $COLOR_WHITE)
	GUICtrlSetFont(-1,30,$FW_NORMAL, $GUI_FONTITALIC , $Label_Font)

	;Create Buttons
	While $Buttons_On_Row <= 3 And $Buttons_On_Column <= 3

		$New_Button = GUICtrlCreateButton("",$Button_X_Coord,$Button_Y_Coord,125,125)
		_ArrayAdd($Button_Index_List, $New_Button)
		GUICtrlSetBkColor(-1,$COLOR_RED)

		$Buttons_On_Row += 1
		$Button_X_Coord += 120
		$ButtonsQuantity += 1

		If($Buttons_On_Row = 3 And $Buttons_On_Column < 3) Then

			$Button_Y_Coord += 120
			$Button_X_Coord = 250
			$Buttons_On_Row = 0
			$Buttons_On_Column += 1

		ElseIf($Buttons_On_Row = 3 And $Buttons_On_Column = 3) Then

			ExitLoop
		EndIf
	WEnd

	ChooseButtons()
	;ChooseButtons_Advanced()

	While 1
		$idMsg = GUIGetMsg()

		Select

			Case $idMsg = $Button_Index_List[0]
				$New_Button_Pressed = $Button_Index_List[0]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[1]
				$New_Button_Pressed = $Button_Index_List[1]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[2]
				$New_Button_Pressed = $Button_Index_List[2]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[3]
				$New_Button_Pressed = $Button_Index_List[3]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[4]
				$New_Button_Pressed = $Button_Index_List[4]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[5]
				$New_Button_Pressed = $Button_Index_List[5]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[6]
				$New_Button_Pressed = $Button_Index_List[6]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[7]
				$New_Button_Pressed = $Button_Index_List[7]
				ButtonPressed()

			Case $idMsg = $Button_Index_List[8]
				$New_Button_Pressed = $Button_Index_List[8]
				ButtonPressed()

			Case $idMsg = $GUI_EVENT_CLOSE
				Exit

		EndSelect

	WEnd

EndFunc

Func ChooseButtons_Advanced()

	Local $Choosen_Buttons_Quantity = 1
	Local $Button_Text = 0

	While $Choosen_Buttons_Quantity < 5

		Local $Choose_Button = Random($Button_Index_List[0],$Button_Index_List[8],1)
		$Button_Text += 1
		GUICtrlSetBkColor($Choose_Button,$COLOR_WHITE)
		GUICtrlSetData($Choose_Button,$Button_Text)
		;ConsoleWrite($Choose_Button & @CRLF)
		_ArrayExtract($Button_Index_List,$Choose_Button)
		$Choosen_Buttons_Quantity += 1

	WEnd

EndFunc

Func ChooseButtons()

	Global $Current_Button

	GUICtrlSetBkColor($Button_Index_List[0],$COLOR_WHITE)
	GUICtrlSetData($Button_Index_List[0], "1")
	$Current_Button = $Button_Index_List[0]

	GUICtrlSetBkColor($Button_Index_List[1],$COLOR_WHITE)
	GUICtrlSetData($Button_Index_List[1], "2")

	GUICtrlSetBkColor($Button_Index_List[2],$COLOR_WHITE)
	GUICtrlSetData($Button_Index_List[2], "3")

	GUICtrlSetBkColor($Button_Index_List[3],$COLOR_WHITE)
	GUICtrlSetData($Button_Index_List[3], "4")

	GUICtrlSetBkColor($Button_Index_List[4],$COLOR_WHITE)
	GUICtrlSetData($Button_Index_List[4], "5")

EndFunc

Func ButtonPressed ()

	Global $Player_Button = $New_Button_Pressed

	CheckButtons()

	GUICtrlSetBkColor($Button_Index_List[0],$COLOR_RED)
	GUICtrlSetData($Button_Index_List[0], "")

	GUICtrlSetBkColor($Button_Index_List[1],$COLOR_RED)
	GUICtrlSetData($Button_Index_List[1], "")

	GUICtrlSetBkColor($Button_Index_List[2],$COLOR_RED)
	GUICtrlSetData($Button_Index_List[2], "")

	GUICtrlSetBkColor($Button_Index_List[3],$COLOR_RED)
	GUICtrlSetData($Button_Index_List[3], "")

	GUICtrlSetBkColor($Button_Index_List[4],$COLOR_RED)
	GUICtrlSetData($Button_Index_List[4], "")

	UpdateScore()

EndFunc

Func CheckButtons()

	If($Current_Button = $Player_Button) Then
		GUICtrlDelete ( $New_Button_Pressed )
		$Current_Button = $Player_Button + 1

	ElseIf($Current_Button <> $Player_Button) Then
		GUIDelete($Window_GUI)
		WrongButton()
	EndIf

EndFunc

Func UpdateScore()

	$Player_Score += 1
	GUICtrlDelete($Score_Label)
	GUICtrlCreateLabel("Score: " & $Player_Score,600,100,300,50)
	GUICtrlSetColor(-1, $COLOR_WHITE)
	GUICtrlSetFont(-1,30,$FW_NORMAL, $GUI_FONTITALIC , $Label_Font)

	NextLevel()

EndFunc

Func WrongButton()

	$Player_Score = 0

	Local $Game_Over_Window = GUICreate("Game Over", 300,300,-1,-1)
	GUISetBkColor($COLOR_BLACK, $Game_Over_Window)
	GUISetState(@SW_SHOW)

	Local $Game_Over_Text = GUICtrlCreateLabel("GAME OVER",0,35,300,50,$SS_CENTER)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlSetFont(-1,30,$FW_NORMAL, $GUI_FONTITALIC , $Label_Font)

	Local $Wrong_Button_Text = GUICtrlCreateLabel("You mistake the button",0,100,300,50,$SS_CENTER)
	GUICtrlSetColor(-1, 0xffff00)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC , $Label_Font)

	Local $Try_Again_Button = GUICtrlCreateButton("TRY AGAIN",75,175,150,50,$SS_CENTER)
	GUICtrlSetBkColor($Try_Again_Button,0x3cd070)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC , $Button_Text_Font)

	Local $Close_Button = GUICtrlCreateButton("CLOSE",75,240,150,50,$SS_CENTER)
	GUICtrlSetBkColor($Close_Button,0xff0800)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC , $Button_Text_Font)

	While 1
		$wb_Msg = GUIGetMsg()

		Select

			Case $wb_Msg = $Try_Again_Button
				GUIDelete($Game_Over_Window)
				MainFunc()

			Case $wb_Msg = $Close_Button
				Exit

		EndSelect
	WEnd

EndFunc

Func NextLevel()

	If($Player_Score = $Level_1_Score Or $Player_Score = $Level_2_Score Or $Player_Score = $Level_3_Score Or $Player_Score = $Level_4_Score Or $Player_Score = $Level_5_Score) Then
		GUIDelete($Window_GUI)
		MainFunc()
	EndIf

EndFunc

;Idle
While 1
	Sleep(100)
WEnd

Func TerminateApp()
	GUIDelete()
	Exit
EndFunc