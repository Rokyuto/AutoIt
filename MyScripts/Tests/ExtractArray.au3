#include <Array.au3>

Local $aArray[4][4]
For $i = 0 To 3
    For $j = 0 To 3
        $aArray[$i][$j] = $i & $j
    Next
Next

Global $KPoP_Idols_Array[7] = ['Rosé','Yuna','Momo','Irene','ChungHa','Karina','UI']
_ArrayAdd($KPoP_Idols_Array,$KPoP_Idols_Array) ; increment array - 2x each Idol
_ArrayShuffle($KPoP_Idols_Array) ;Randomize incremented array
_ArrayDisplay($KPoP_Idols_Array, "Original")

Local $aExtract = _ArrayExtract($KPoP_Idols_Array, 0, 2)
_ArrayDisplay($aExtract, "Row 1-2 cols 2-3")
