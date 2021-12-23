#include<array.au3>

#cs
local $aArr = [1,2,3,4,5]

for $i = 1 to UBound($aArr)
   $nValue = random(0, ubound($aArr) - 1 , 1)
   msgbox(0, '' , $aArr[$nValue])
   _ArrayDelete($aArr , $nValue)
next
#ce

For $i = 1 To 6
    MsgBox(0, "Button hit", "Number is " & _Surprise())
Next

Func _Surprise()
    Local Static $a = [1, 2, 3, 4, 5], $n
    If $n = 0 Then _ArrayShuffle($a)
    $n += 1
    Return ($n > 5 ? "no more available!" : $a[$n - 1])
EndFunc