#include<Date.au3>
HotKeySet("{F11}",_insertDate)



Func _insertDate()
   send(@MDAY&"/"&@MON&"/"& StringRight(@YEAR, 2) & " MH ")
EndFunc


while 1
   Sleep(100)
WEnd


