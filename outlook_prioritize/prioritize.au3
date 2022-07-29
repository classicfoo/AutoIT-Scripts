#include "_ImageSearch_UDF.au3"

HotKeySet("{Esc}", "_Exit")
HotKeySet("{F4}", "complete");
HotKeySet("{F5}", "today");
HotKeySet("{F6}", "tomorrow");
HotKeySet("{F7}", "nextweek");


while 1
sleep(1000);
WEnd


Func complete()
	$cell = MouseGetPos()
	SearchAndClick("complete");
	MouseClick("left",$cell[0],$cell[1]);
EndFunc

Func today()
	$cell = MouseGetPos()
	SearchAndClick("today");
	MouseClick("left",$cell[0],$cell[1]);
EndFunc

Func tomorrow()
	$cell = MouseGetPos()
	SearchAndClick("tomorrow");
	MouseClick("left",$cell[0],$cell[1]);
EndFunc

Func nextweek()
	$cell = MouseGetPos()
	SearchAndClick("nextweek");
	MouseClick("left",$cell[0],$cell[1]);
EndFunc



;exit
Func _Exit()
	Exit 0
EndFunc

;search and click
Func SearchAndClick($imageName, $offsetX="", $offsetY="") 
	Local $image = _ImageSearch(@ScriptDir & "\"& $imageName & ".bmp")
	MouseClick("left", $image[1]+$offsetX, $image[2]+$offsetY);
	
	Sleep(100);
EndFunc