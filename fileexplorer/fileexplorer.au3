;#include "_ImageSearch_UDF.au3"
#include <_SendEx.au3>


HotKeySet("{Esc}", "_Exit")
HotKeySet("^!{SPACE}","search")
HotKeySet("^!n","newfolder")
HotKeySet("^!t","newtextfile")
HotKeySet("^!w","wrap")
HotKeySet("^!r","readonly")
HotKeySet("^!a","showattributes")

;show attributes column
func showattributes()
	_SendEx("{ALTDOWN}")
	Sleep(100)
	_SendEx("{ALTUP}")
	Send("v")
	Send("a")
	Send("{UP}")
	Send("{ENTER}")
	Sleep(250)
	Send("attr")
	Send("{SPACE}")
	Sleep(250)
	Send("{ENTER}")

EndFunc

func readonly()
	_SendEx("{CTRLDOWN}")
	MouseClick("right")
	_SendEx("{CTRLUP}")
	Send("r")
	sleep(250)
	Send("r")
	Send("{ENTER}")
EndFunc

Func newfolder()
	_SendEx("^+n");
EndFunc


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
	_SendEx("wt");
	;SearchAndClick("newtextfile");
EndFunc

;wrap a text file in a folder with the same name
Func wrap()

	;User to select file
	_SendEx("^x");cut the file
	_SendEx("^+n");;create new folder
	Send("{ENTER}");
	Send("{ENTER}");
	Sleep(250);
	Send("^v");
	Sleep(250);
	_SendEx("{F2}");copy file name
	Send("^c");
	Send("{ENTER}");
	Send("{BACKSPACE}");
	Sleep(100);
	Send("{F2}")
	Send("^v");
	Send("{ENTER}");

EndFunc

;search and click
;Func SearchAndClick($imageName, $offsetX="", $offsetY="")
	;$pos = MouseGetPos();
	;Local $image = _ImageSearch(@ScriptDir & "\"& $imageName & ".bmp")
	;MouseClick("left", $image[1]+$offsetX, $image[2]+$offsetY);
	;MouseMove($pos[0],$pos[1]);
	;Sleep(100);
;EndFunc






;exit
Func _Exit()
	Exit 0
EndFunc