#include <GUIConstantsEx.au3>
#include <FontConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Misc.au3>

HotKeySet("{ESC}", "TerminateApp")

Main()

Func Main()

	Local $Program_Window = GUICreate("Currency Converter",900,900,-1,-1)
	GUISetState(@SW_SHOW)

	;Variables Place
	Global $Currency_I_Have , $Currency_I_Want
	Global $Read_My_Currency_Amount

	Global $Last_Introduced_Amount = 0
	Local $Last_Currency

	;Currency I Have
	Local $Currency_I_Have_Label = GUICtrlCreateLabel("Currency I Have: ",100,300,300,40)
	GUICtrlSetFont(-1,22,$FW_NORMAL, $GUI_FONTITALIC)

	Local $Currency_I_Have_ComboBox = GUICtrlCreateCombo("US Dolar - USD",100,350,300,40,$CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, "Euro - EUR|British Pound - GBP|Bulgarian Lev - BGN","US Dolar - USD")
	GUICtrlSetFont(-1,15,$FW_NORMAL, $GUI_FONTITALIC)

	Local $Currency_1_Amount = GUICtrlCreateLabel("Amount:",100,410,300,40)
	GUICtrlSetFont(-1,15,$FW_NORMAL, $GUI_FONTITALIC)

	Global $Currency_I_Have_Input = GUICtrlCreateInput("1",100,450,300,40)
	GUICtrlSetFont(-1,22,$FW_NORMAL, $GUI_FONTITALIC)

	;Currency I Want
	Local $Currency_I_Want_Label = GUICtrlCreateLabel("Currency I Want: ",500,300,300,40)
	GUICtrlSetFont(-1,22,$FW_NORMAL, $GUI_FONTITALIC)

	Local $Currency_I_Want_ComboBox = GUICtrlCreateCombo("Euro - EUR",500,350,300,40,$CBS_DROPDOWNLIST)
	GUICtrlSetData($Currency_I_Want_ComboBox,"US Dolar - USD|British Pound - GBP|Bulgarian Lev - BGN","Euro - EUR")
	GUICtrlSetFont(-1,15,$FW_NORMAL, $GUI_FONTITALIC)

	Local $Currency_2_Amount = GUICtrlCreateLabel("Amount:",500,410,300,40)
	GUICtrlSetFont(-1,15,$FW_NORMAL, $GUI_FONTITALIC)

	Global $Currency_I_Want_Input = GUICtrlCreateInput("1",500,450,300,40)
	GUICtrlSetFont(-1,22,$FW_NORMAL, $GUI_FONTITALIC)

	Local $Currency_I_Have_Choice
	Local $Currency_I_Want_Choice

	While 1

		$idMsg = GUIGetMsg()

		; Close Button And First Currency Menu
		Switch $idMsg

			Case $Currency_I_Have_Choice

				$Currency_I_Have_Choice = GUICtrlRead($Currency_I_Have_ComboBox)

				Switch $Currency_I_Have_Choice

					Case "US Dolar - USD"
						$Currency_I_Have = "US Dolar - USD"

					Case "Euro - EUR"
						$Currency_I_Have = "Euro - EUR"

					Case "British Pound - GBP"
						$Currency_I_Have = "British Pound - GBP"

					Case "Bulgarian Lev - BGN"
						$Currency_I_Have = "Bulgarian Lev - BGN"

				EndSwitch

			Case $GUI_EVENT_CLOSE
				Exit

		EndSwitch

		$scmMsg = GUIGetMsg()

		; Second Currency Menu
		Switch $scmMsg

			Case $Currency_I_Want_Choice

				$Currency_I_Want_Choice = GUICtrlRead($Currency_I_Want_ComboBox)

				Switch $Currency_I_Want_Choice

					Case "Euro - EUR"
						$Currency_I_Want = "Euro - EUR"

					Case "US Dolar - USD"
						$Currency_I_Want = "US Dolar - USD"

					Case "British Pound - GBP"
						$Currency_I_Want = "British Pound - GBP"

					Case "Bulgarian Lev - BGN"
						$Currency_I_Want = "Bulgarian Lev - BGN"

				EndSwitch
		EndSwitch

		$Read_My_Currency_Amount = GUICtrlRead($Currency_I_Have_Input)
		Calculation()

		;If($Read_My_Currency_Amount <> $Last_Introduced_Amount) Then
			;$Last_Introduced_Amount = $Read_My_Currency_Amount
		;EndIf

	WEnd

EndFunc

Func Calculation()

	Local $US_Dolar , $British_Pound , $Bulgarian_Lev , $Euro
	Local $Currency_I_Want_Amount

	Switch $Currency_I_Have

		Case "US Dolar - USD"

			If($Currency_I_Want = "Euro - EUR") Then
				Local $USD_to_Euro = 0.84307
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $USD_to_Euro
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "British Pound - GBP") Then
				Local $USD_to_GBP = 0.72417
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $USD_to_GBP
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "Bulgarian Lev - BGN") Then
				Local $USD_to_BGN = 1.64890
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $USD_to_BGN
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			Else
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * 1
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			EndIf

		Case "Euro - EUR"

			If($Currency_I_Want = "US Dolar - USD") Then
				Local $Euro_to_USD = 1.18600
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $Euro_to_USD
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "British Pound - GBP") Then
				Local $EUR_to_GBP = 0.85889
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $EUR_to_GBP
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "Bulgarian Lev - BGN") Then
				Local $EUR_to_BGN = 1.95583
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $EUR_to_BGN
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			Else
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * 1
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			EndIf

		Case "British Pound - GBP"

			If($Currency_I_Want = "US Dolar - USD") Then
				Local $GBP_to_USD = 1.38070
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $GBP_to_USD
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "Euro - EUR") Then
				Local $GBP_to_EUR = 1.16404
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $GBP_to_EUR
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "Bulgarian Lev - BGN") Then
				Local $GBP_to_BGN = 2.27667
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $GBP_to_BGN
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			Else
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * 1
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			EndIf

		Case "Bulgarian Lev - BGN"

			If($Currency_I_Want = "US Dolar - USD") Then
				Local $BGN_to_USD = 0.60639
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $BGN_to_USD
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "Euro - EUR") Then
				Local $BGN_to_EUR = 0.51129
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $BGN_to_EUR
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			ElseIf($Currency_I_Want = "British Pound - GBP") Then
				Local $BGN_to_GBP = 0.43914
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * $BGN_to_GBP
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			Else
				$Currency_I_Want_Amount = $Read_My_Currency_Amount * 1
				GUICtrlSetData($Currency_I_Want_Input,$Currency_I_Want_Amount)

			EndIf

	EndSwitch

EndFunc

;Idle
While 1
	Sleep(100)
WEnd

Func TerminateApp()
	GUIDelete()
	Exit
EndFunc