#include <GUIConstantsEx.au3>
#include <ColorConstants.au3>
#include <FontConstants.au3>
#include <Array.au3>

HotKeySet("{ESC}", "TerminateApp")

Global $Player_Score = 0

RandomNumberGen()

Func RandomNumberGen()

	Global $sFont = "Comic Sans Ms"

	Local $RandNumber_GUI = GUICreate("Number",250,250,-1,-1)
	GUISetState(@SW_SHOW)

	Local $NextButton = GUICtrlCreateButton("PLAY",135,200,100,50)
	GUICtrlSetFont($NextButton,10,$FW_NORMAL, $GUI_FONTITALIC, $sFont)
	GUICtrlSetState($NextButton,$GUI_DISABLE)

	Local $GenButton = GUICtrlCreateButton("GENERATE",20,200,100,50)
	GUICtrlSetFont($GenButton,10,$FW_NORMAL, $GUI_FONTITALIC, $sFont)


	Global $Random_Num_1 = Random(1,9,1)
	Global $Random_Num_2 = Random(0,9,1)
	Global $Random_Num_3 = Random(0,9,1)
	Global $Random_Num_4 = Random(0,9,1)
	Global $Random_Num_5 = Random(0,9,1)

	Global $Random_Number = $Random_Num_1 & $Random_Num_2 & $Random_Num_3 & $Random_Num_4 & $Random_Num_5

	While 1
		$rngMsg = GUIGetMsg()

		Select

			Case $rngMsg = $GenButton

				GUICtrlSetState ($GenButton,$GUI_DISABLE)
				GUICtrlSetState($NextButton,$GUI_ENABLE)

				Local $Number_Label = GUICtrlCreateLabel($Random_Number,85,85,100,100)
				GUICtrlSetFont($Number_Label,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)
				Sleep(2000)
				GUICtrlSetData($Number_Label, "")

			Case $rngMsg = $NextButton
				GUIDelete($RandNumber_GUI)
				MainFunc()

			Case $rngMsg = $GUI_EVENT_CLOSE
				Exit

		EndSelect
	WEnd

EndFunc

Func MainFunc()

	Global $Window_GUI = GUICreate("Sequence Game",800,400,-1,-1)
	GUISetState(@SW_SHOW)

	Global $Number_Label = GUICtrlCreateInput("", 275, 20 , 250, 50)

	GUICtrlCreateLabel("Score: " & $Player_Score,650,25,200,70)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)

	;Variables
	Local $ButtonsQuantity = 0
	Local $Buttons_On_Row = 0

	Local $Button_X_Coord = 80
	Local $Button_Y_Coord = 100

	Global $New_Button
	Global $Button_Index_List[0] ; All Buttons List
	Global $New_Button_Pressed

	Global $Player_Num_1 = Null
	Global $Player_Num_2 = Null
	Global $Player_Num_3 = Null
	Global $Player_Num_4 = Null
	Global $Player_Num_5 = Null
	Global $Player_Number

	;Create Buttons
	While $ButtonsQuantity < 10

		If($Buttons_On_Row <= 4) Then

			$New_Button = GUICtrlCreateButton("",$Button_X_Coord,$Button_Y_Coord,125,125)
			_ArrayAdd($Button_Index_List, $New_Button)
			ButtonsText()
			GUICtrlSetBkColor(-1,0xE60000)

			$ButtonsQuantity += 1
			$Button_X_Coord += 125
			$Buttons_On_Row += 1

		ElseIf($Buttons_On_Row > 4) Then

			$Button_Y_Coord += 125
			$Button_X_Coord = 80
			$Buttons_On_Row = 0

		EndIf

	WEnd

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

			Case $idMsg = $Button_Index_List[9]
				$New_Button_Pressed = $Button_Index_List[9]
				ButtonPressed()

			Case $idMsg = $GUI_EVENT_CLOSE
				Exit

		EndSelect
	WEnd

EndFunc

Func ButtonsText ()

	Local $New_Button_Index

		$New_Button_Index = _ArraySearch($Button_Index_List , $New_Button ,0,0,0,0,1)
		GUICtrlSetData($New_Button, $New_Button_Index)

EndFunc

Func ButtonPressed()

	Local $Pressed_Button_Number

	$Pressed_Button_Number = _ArraySearch($Button_Index_List,$New_Button_Pressed)

	If($Player_Num_1 = Null) Then
		If($Pressed_Button_Number <> 0) Then
			$Player_Num_1 = $Pressed_Button_Number
			GUICtrlCreateInput($Player_Num_1 & $Player_Num_2 & $Player_Num_3 & $Player_Num_4 & $Player_Num_5, 275, 20 , 250, 50)
			GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)
			$Button_Pressed = False
		EndIf

	ElseIf($Player_Num_2 = Null) Then
		$Player_Num_2 = $Pressed_Button_Number
		GUICtrlCreateInput($Player_Num_1 & $Player_Num_2 & $Player_Num_3 & $Player_Num_4 & $Player_Num_5, 275, 20 , 250, 50)
		GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)
		$Button_Pressed = False

	ElseIf($Player_Num_3 = Null) Then
		$Player_Num_3 = $Pressed_Button_Number
		GUICtrlCreateInput($Player_Num_1 & $Player_Num_2 & $Player_Num_3 & $Player_Num_4 & $Player_Num_5, 275, 20 , 250, 50)
		GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)
		$Button_Pressed = False

	ElseIf($Player_Num_4 = Null) Then
		$Player_Num_4 = $Pressed_Button_Number
		GUICtrlCreateInput($Player_Num_1 & $Player_Num_2 & $Player_Num_3 & $Player_Num_4 & $Player_Num_5, 275, 20 , 250, 50)
		GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)
		$Button_Pressed = False

	ElseIf($Player_Num_5 = Null) Then
		$Player_Num_5 = $Pressed_Button_Number
		GUICtrlCreateInput($Player_Num_1 & $Player_Num_2 & $Player_Num_3 & $Player_Num_4 & $Player_Num_5, 275, 20 , 250, 50)
		GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)
		$Button_Pressed = False

	EndIf

	$Player_Number = $Player_Num_1 & $Player_Num_2 & $Player_Num_3 & $Player_Num_4 & $Player_Num_5
	ConsoleWrite($Player_Number & @CRLF)

	If($Player_Num_5 <> Null) Then
		NumbersMatch()
	EndIf

EndFunc

Func NumbersMatch()

	If($Player_Num_1 = $Random_Num_1 ) Then
		$Player_Score += 1
	EndIf

	If($Player_Num_2 = $Random_Num_2) Then
		$Player_Score += 1
	EndIf

	If($Player_Num_3 = $Random_Num_3) Then
		$Player_Score += 1
	EndIf

	If($Player_Num_4 = $Random_Num_4) Then
		$Player_Score += 1
	EndIf

	If($Player_Num_5 = $Random_Num_5) Then
		$Player_Score += 1

	ElseIf($Player_Number = $Random_Number) Then
		$Player_Score += 5

	EndIf

	GUICtrlCreateLabel("Score: " & $Player_Score,650,25,200,70)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)

	NumbersCompare()

EndFunc

Func NumbersCompare()

	Local $CompareGUI = GUICreate("Compare",500,300,-1,-1)
	GUISetState(@SW_SHOW,$CompareGUI)

	Local $Random_Number_Label = GUICtrlCreateLabel("Computer Number: " & $Random_Number,50,50,400,100)
	GUICtrlSetFont($Random_Number_Label,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)

	Local $Player_Number_Label = GUICtrlCreateLabel("Your Number: " & $Player_Number,50,150,400,100)
	GUICtrlSetFont($Player_Number_Label,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)

	Local $Next_Round_Button = GUICtrlCreateButton("Next Round",275,250,160,40)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)

	Local $Close_Button = GUICtrlCreateButton("Close",75,250,120,40)
	GUICtrlSetFont(-1,20,$FW_NORMAL, $GUI_FONTITALIC, $sFont)

	While 1

		$ncMsg = GUIGetMsg()

		Select

			Case $ncMsg = $Next_Round_Button

				Global $Player_Num_1 = Null
				Global $Player_Num_2 = Null
				Global $Player_Num_3 = Null
				Global $Player_Num_4 = Null
				Global $Player_Num_5 = Null

				GUIDelete($CompareGUI)
				GUIDelete($Window_GUI)
				RandomNumberGen()

			Case $ncMsg = $Close_Button
				Exit

		EndSelect
	WEnd

EndFunc

;Idle
While 1
	Sleep(100)
WEnd

Func TerminateApp()
	GUIDelete()
	Exit
EndFunc