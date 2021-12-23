#include <GUIConstantsEx.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <math.au3>

HotKeySet("{ESC}" , "TerminateApp")

Prompt()

Func Prompt()

	Local $Rows
	Local $Columns

	Global $Player_Rows = InputBox("Game Setup", "How many Rows?", "" , $Rows)
	Global $Player_Columns = InputBox("Game Setup", "How many Columns?", $Columns)

	Global $Buttons_Quantity = $Player_Columns * $Player_Rows

	;Check for Even Button Quantity
	If($Player_Columns <= 1 Or $Player_Rows <= 1) Then
		MsgBox($MB_SYSTEMMODAL,"Invalid Numbers","Choose Larger Numbers")
		Prompt()

	ElseIf($Player_Columns > 8 Or $Player_Rows > 8) Then
		MsgBox($MB_SYSTEMMODAL,"Invalid Numbers","Choose Lesser Numbers")
		Prompt()

	ElseIf( Mod($Buttons_Quantity,2) <> 0) Then
		MsgBox($MB_SYSTEMMODAL,"Invalid Numbers","Choose Another Numbers")
		Prompt()

	ElseIf( Mod($Buttons_Quantity,2) = 0) Then
		MemoryGame()

	EndIf

EndFunc

Func MemoryGame()

	;KPoP Idols Array
	Global $KPoP_Idols_Array[32] = ['Rosé','Yuna','Momo','Lisa','Sana','Irene','Seulgi','ChungHa','Gahyeon','Yoohyeon','Yeji','Heejin','UI','Somi','Sunmi','Hyuna','Moonbyul','Karina','Winter','Seolhyun','Sorn','Aisha','Soyeon','Miyeon','Eunha','Hyeri','Wonyoung','Doyeon','Sieun','Taeyeon','BoA','Solar']
	_ArrayShuffle($KPoP_Idols_Array)

	;_ArrayDisplay($KPoP_Idols_Array)

	Global $Extracted_Idols = _ArrayExtract($KPoP_Idols_Array, 0, ( ( $Buttons_Quantity / 2 ) - 1 ) ) ;Extract Dublicated Idols = $Buttons_Quantity
	;_ArrayDisplay($Extracted_Idols)

	_ArrayAdd($Extracted_Idols,$Extracted_Idols)
	;_ArrayDisplay($Extracted_Idols)

	_ArrayShuffle($Extracted_Idols)
	_ArrayDisplay($Extracted_Idols, "From 0 to $Buttons_Quantity")

	Global $Button_Index_List[0]
	Global $Current_Button

	Global $Button_X_Pos = 25 ;For Edit
	Global $Button_Y_Pos = 25 ; For Edit

	Global $Buttons_on_Row = 0
	Global $Buttons_on_Column = 1

	Global $Button_X_Size = 100
	Global $Button_Y_Size = 100

	Global $Window_X_Step
	Global $Window_Y_Step

	Global $Allow_Input = 1

	Global $Button_Pressed_Duo[2] ;Two Clicked Buttons at the Same Time
	Global $New_Button_Pressed
	Global $Button_Pressed_Counter = 0

	Switch $Player_Columns

		Case 2
			$Window_X_Step = 70
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 3
			$Window_X_Step = 90
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 4
			$Window_X_Step = 110
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 5
			$Window_X_Step = 130
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 6
			$Window_X_Step = 150
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 7
			$Window_X_Step = 170
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 8
			$Window_X_Step = 190
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

	EndSwitch

	Switch $Player_Rows

		Case 2
			$Window_Y_Step = 70
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 3
			$Window_Y_Step = 90
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 4
			$Window_Y_Step = 110
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 5
			$Window_Y_Step = 130
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 6
			$Window_Y_Step = 150
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 7
			$Window_Y_Step = 170
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

		Case 8
			$Window_Y_Step = 190
			Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
			Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

	EndSwitch

	;Create Windowed Program
	Local Static $Window_GUI = GUICreate("Memory Game",$Program_X_Size,$Program_Y_Size,-1,-1)
	;Set Program State
	GUISetState(@SW_SHOW, $Window_GUI)

	;Create Buttons
	While  $Buttons_on_Row <= $Player_Columns And $Buttons_on_Column <= $Player_Rows

		$Current_Button = GUICtrlCreateButton("",$Button_X_Pos,$Button_Y_Pos,$Button_X_Size,$Button_Y_Size)
		_ArrayAdd($Button_Index_List, $Current_Button)
		$Buttons_on_Row += 1
		$Button_X_Pos += 120

		If($Buttons_on_Row = $Player_Columns And $Buttons_on_Column < $Player_Rows) Then

			$Button_Y_Pos += 120
			$Button_X_Pos = 25
			$Buttons_on_Column += 1
			$Buttons_on_Row = 0

		ElseIf($Buttons_on_Row = $Player_Columns And $Buttons_on_Column = $Player_Rows) Then

			ExitLoop

		EndIf

	WEnd

	;_ArrayDisplay($Button_Index_List)

	   ;Button Click Initialize Cycle
   While $Allow_Input

		Global $idMsg = GUIGetMsg() ; trace for events

		Select

			Case  $idMsg = $Button_Index_List[0]
				$New_Button_Pressed = $Button_Index_List[0]
				ButtonPressed()
				;ConsoleWrite($idMsg)

			Case  $idMsg = $Button_Index_List[1]
				$New_Button_Pressed = $Button_Index_List[1]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[2]
				$New_Button_Pressed = $Button_Index_List[2]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[3]
				$New_Button_Pressed = $Button_Index_List[3]
				ButtonPressed()

			;Program Close Button
			Case $idMsg = $GUI_EVENT_CLOSE
				Exit

		EndSelect

   WEnd

EndFunc

Func ButtonPressed()

	Switch $Button_Pressed_Counter

		Case 0
			$Button_Pressed_Duo[0] = $New_Button_Pressed ; Duo_ButtonPress
			;ConsoleWrite($New_Button_Pressed)
		Case 1
			$Button_Pressed_Duo[1] = $New_Button_Pressed
			;ConsoleWrite($New_Button_Pressed)

	EndSwitch

	ButtonsVis()

EndFunc

Func ButtonsVis ()

	Global $Current_Button_Index
	Global $New_Button_Text
	Global $Clicked_Button1_Text
	Global $Clicked_Button2_Text

	Switch $Button_Pressed_Counter

		Case 0
			$Current_Button_Index = _ArraySearch($Button_Index_List , $Button_Pressed_Duo[0] ,0,0,0,0,1)
			$New_Button_Text = $KPoP_Idols_Array[$Current_Button_Index]
			GUICtrlSetData($Button_Pressed_Duo[0], $New_Button_Text)
			$Clicked_Button1_Text = $New_Button_Text
			;ConsoleWrite($Clicked_Button1_Text)
			$Button_Pressed_Counter = 1

		Case 1
			$Current_Button_Index = _ArraySearch($Button_Index_List , $Button_Pressed_Duo[1] ,0,0,0,0,1)
			$New_Button_Text = $KPoP_Idols_Array[$Current_Button_Index]
			GUICtrlSetData($Button_Pressed_Duo[1], $New_Button_Text)
			$Clicked_Button2_Text = $New_Button_Text
			;ConsoleWrite($Clicked_Button2_Text)7
			$Button_Pressed_Counter = 0
			;Sleep(500)

	EndSwitch

EndFunc

;Stay Idle
While 1
   Sleep(100)
WEnd

;Terminate Program
Func TerminateApp()

   GUIDelete()
   Exit

EndFunc