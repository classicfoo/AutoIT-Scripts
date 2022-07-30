#include "_ImageSearch_UDF.au3"
#include <_SendEx.au3>

HotKeySet("^!{SPACE}","search")
HotKeySet("^!n","newtextfile")

;search using everything
Func search()
	_SendEx("{CTRLDOWN}")
	MouseClick("right")
	_SendEx("{CTRLUP}")
	sleep(100)
	_SendEx("+s")
	_SendEx("+s")
	_SendEx("{ENTER}")
EndFunc

;new text file
Func newtextfile()
	_SendEx("{CTRLDOWN}")
	MouseClick("right")
	_SendEx("{CTRLUP}")
	sleep(100);
	_SendEx("+w");
	SearchAndClick("newtextfile");
EndFunc

;search and click
Func SearchAndClick($imageName, $offsetX="", $offsetY="")
	$pos = MouseGetPos();
	Local $image = _ImageSearch(@ScriptDir & "\"& $imageName & ".bmp")
	MouseClick("left", $image[1]+$offsetX, $image[2]+$offsetY);
	MouseMove($pos[0],$pos[1]);
	Sleep(100);
EndFunc






