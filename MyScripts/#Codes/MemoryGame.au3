#include <GUIConstantsEx.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>

HotKeySet("{ESC}" , "TerminateApp")

Opt("GUIOnEventMode", 1)

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

	Global $KPoP_Idols_Array[32] = ['Rosé','Yuna','Momo','Lisa','Sana','Irene','Seulgi','ChungHa','Gahyeon','Yoohyeon','Yeji','Heejin','UI','Somi','Sunmi','Hyuna','Moonbyul','Karina','Winter','Seolhyun','Sorn','Aisha','Soyeon','Miyeon','Eunha','Hyeri','Wonyoung','Doyeon','Sieun','Taeyeon','BoA','Solar']
	_ArrayShuffle($KPoP_Idols_Array)

	Global $Extracted_Idols = _ArrayExtract($KPoP_Idols_Array, 0, ( ( $Buttons_Quantity / 2 ) - 1 ) )
	_ArrayAdd($Extracted_Idols,$Extracted_Idols)
	_ArrayShuffle($Extracted_Idols)
	_ArrayDisplay($Extracted_Idols)

	;Variables

	Global $Window_X_Step , $Window_Y_Step

	Global $Button_X_Pos = 25 , $Button_Y_Pos = 25

	Global $Buttons_on_Row = 0 , $Buttons_on_Column = 1

	Global $Button_X_Size = 100 , $Button_Y_Size = 100

	Global $New_Button
	Global $Button_Index_List[0] ; All Buttons List
	Global $Button_Pressed_Duo[2] ;Two Clicked Buttons at the Same Time
	Global $New_Button_Pressed
	Global $Button_Pressed_Counter = 0

	Global $Allow_Input = 1 ;Allow Click Button

	Global $Timer_Seconds = 0

	Switch $Player_Columns

		Case 2
			$Window_X_Step = 70

		Case 3
			$Window_X_Step = 90

		Case 4
			$Window_X_Step = 110

		Case 5
			$Window_X_Step = 130

		Case 6
			$Window_X_Step = 150

		Case 7
			$Window_X_Step = 170

		Case 8
			$Window_X_Step = 190

	EndSwitch

	Switch $Player_Rows

		Case 2
			$Window_Y_Step = 70

		Case 3
			$Window_Y_Step = 90

		Case 4
			$Window_Y_Step = 110

		Case 5
			$Window_Y_Step = 130

		Case 6
			$Window_Y_Step = 150

		Case 7
			$Window_Y_Step = 170

		Case 8
			$Window_Y_Step = 190

	EndSwitch

	Local $Program_X_Size = $Button_X_Size * $Player_Columns + $Window_X_Step
	Local $Program_Y_Size = $Button_Y_Size * $Player_Rows + $Window_Y_Step

	;Create Windowed Program
	Local Static $Window_GUI = GUICreate("Memory Game",$Program_X_Size,$Program_Y_Size,-1,-1) ;Dynamic Resizeable Window
	;Set Program State
	GUISetState(@SW_SHOW, $Window_GUI)

	;Create Buttons
	While  $Buttons_on_Row <= $Player_Columns And $Buttons_on_Column <= $Player_Rows

		$New_Button = GUICtrlCreateButton("",$Button_X_Pos,$Button_Y_Pos,100,100)
		_ArrayAdd($Button_Index_List, $New_Button)

		;GUIOnEventMode
		;GUICtrlSetOnEvent($New_Button - 1, "ButtonCall")
		GUICtrlSetOnEvent($New_Button, "ButtonCall")

		$Buttons_on_Row += 1
		$Button_X_Pos += 120

		If($Buttons_on_Row = $Player_Columns And $Buttons_on_Column < $Player_Rows) Then ; >  ; =

			$Button_Y_Pos += 120
			$Button_X_Pos = 25
			$Buttons_on_Row = 0
			$Buttons_on_Column += 1

		ElseIf($Buttons_on_Row = $Player_Columns And $Buttons_on_Column = $Player_Rows) Then

			ExitLoop

		EndIf

	WEnd

	;GUIOnEventMode
	;GUICtrlSetOnEvent($New_Button, ButtonCall())
	;GUICtrlSetOnEvent($New_Button, "ButtonCall")
	;GUICtrlSetOnEvent($New_Button, "ButtonCall")
	_ArrayDisplay($Button_Index_List)

   ;Button Click Initialize Cycle
   While $Allow_Input

		Global $idMsg = GUIGetMsg() ; trace for events

		Select
			#cs
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

			Case  $idMsg = $Button_Index_List[4]
				$New_Button_Pressed = $Button_Index_List[4]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[5]
				$New_Button_Pressed = $Button_Index_List[5]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[6]
				$New_Button_Pressed = $Button_Index_List[6]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[7]
				$New_Button_Pressed = $Button_Index_List[7]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[8]
				$New_Button_Pressed = $Button_Index_List[8]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[9]
				$New_Button_Pressed = $Button_Index_List[9]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[10]
				$New_Button_Pressed = $Button_Index_List[10]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[11]
				$New_Button_Pressed = $Button_Index_List[11]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[12]
				$New_Button_Pressed = $Button_Index_List[12]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[13]
				$New_Button_Pressed = $Button_Index_List[13]
				ButtonPressed()

#cs			Case  $idMsg = $Button_Index_List[14]
				$New_Button_Pressed = $Button_Index_List[14]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[15]
				$New_Button_Pressed = $Button_Index_List[15]
				ButtonPressed()
			Case  $idMsg = $Button_Index_List[16]
				$New_Button_Pressed = $Button_Index_List[16]
				ButtonPressed()

			Case  $idMsg = $Button_Index_List[17]
				$New_Button_Pressed = $Button_Index_List[17]
 				ButtonPressed()

			Case  $idMsg = $Button_Index_List[18]
				$New_Button_Pressed = $Button_Index_List[18]
 				ButtonPressed()

			Case  $idMsg = $Button_Index_List[19]
				$New_Button_Pressed = $Button_Index_List[19]
 				ButtonPressed()

			Case  $idMsg = $Button_Index_List[20]
				$New_Button_Pressed = $Button_Index_List[20]
 				ButtonPressed()

			Case  $idMsg = $Button_Index_List[21]
				$New_Button_Pressed = $Button_Index_List[21]
 				ButtonPressed()

			Case  $idMsg = $Button_Index_List[22]
				$New_Button_Pressed = $Button_Index_List[22]
 				ButtonPressed()

			Case  $idMsg = $Button_Index_List[23]
				$New_Button_Pressed = $Button_Index_List[23]
 				ButtonPressed()
#ce

#ce

			;Program Close Button
			Case $idMsg = $GUI_EVENT_CLOSE
				Exit

	EndSelect

 WEnd


EndFunc

Func ButtonCall()
	;$New_Button_Pressed = 1
	;ConsoleWrite("ok")
	;ConsoleWrite($idMsg)
	ConsoleWrite($New_Button)

	;$New_Button_Pressed = _ArraySearch($Button_Index_List, $New_Button)

	;GUICtrlSetData($New_Button_Pressed, "OK")

	;ButtonPressed()

	;ConsoleWrite($New_Button_Pressed)

EndFunc

Func ButtonPressed()

	Switch $Button_Pressed_Counter

		Case 0
			$Button_Pressed_Duo[0] = $New_Button_Pressed
			;ConsoleWrite("ok")

		Case 1
			$Button_Pressed_Duo[1] = $New_Button_Pressed
			;ConsoleWrite("yes")

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
			ButtonsTimer()
			;Sleep(500)

	EndSwitch

	ButtonsMatch()

EndFunc

Func ButtonsMatch ()

	Local $Matched_Button1
	Local $Matched_Button2

	If($Clicked_Button1_Text = $Clicked_Button2_Text) Then
		GUICtrlSetData($Button_Pressed_Duo[0], $New_Button_Text)
		GUICtrlSetData($Button_Pressed_Duo[1], $New_Button_Text)

#cs		$Matched_Button1 = $Button_Pressed_Duo[0]
		$Matched_Button2 = $Button_Pressed_Duo[1]

		ConsoleWrite($Matched_Button1)
		ConsoleWrite($Matched_Button2)

		_ArrayDelete($Button_Index_List, $Current_Button_Index)
		_ArrayDelete($Button_Index_List, $Current_Button_Index)

		GUICtrlSetState ($Matched_Button1 , $gui_disable)

#ce

		;_ArrayDisplay($KPoP_Idols_Array)

	EndIf

EndFunc

Func ButtonsTimer()

	$Allow_Input = 0

	For $Timer_Seconds = 0 To 40 Step 1

		Sleep(50)

	Next

		ButtonHide()
		$Timer_Seconds = 0
		$Allow_Input = 1

EndFunc

Func ButtonHide()

	GUICtrlSetData($Button_Pressed_Duo[0], "")
	GUICtrlSetData($Button_Pressed_Duo[1], "")

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