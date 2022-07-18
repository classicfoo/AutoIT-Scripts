#include <AutoItConstants.au3>
#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <String.au3>


HotKeySet("^!{RIGHT}", "ToProper") ; Ctrl-Alt-Right
HotKeySet("^!{DOWN}", "ToLower") ; Ctrl-Alt-Down
HotKeySet("^!{UP}", "ToUpper") ; Ctrl-Alt-Up
HotKeySet("^!{LEFT}", "RemoveNewlines") ; Ctrl-Alt-Left

Func ToProper()
        Local $sData = ClipGet(); keep current clipboard data
		Send("^c");
		ClipPut (_StringTitleCase(ClipGet()));
		Send("^v");
		ClipPut ($sData); restore clipboard data
EndFunc

Func ToUpper()
        Local $sData = ClipGet(); keep current clipboard data
		Send("^c");
		ClipPut (StringUpper(ClipGet()));
		Send("^v");
		ClipPut ($sData); restore clipboard data
EndFunc

Func ToLower()
        Local $sData = ClipGet(); keep current clipboard data
		Send("^c");
		ClipPut (StringLower(ClipGet()));
		Send("^v");
		ClipPut ($sData); restore clipboard data
	EndFunc
	
Func RemoveNewlines()
	Local $sData = ClipGet(); keep current clipboard data
	Send("^c");
	;MsgBox($MB_SYSTEMMODAL, "Title", ClipGet());
	ClipPut (StringReplace(ClipGet(), @CRLF, ". ")); replace newlines with ""
	ClipPut (StringReplace(ClipGet(), " .", ". ")); replace any double space with single space
	ClipPut (StringReplace(ClipGet(), "    ", " ")); replace any 4 spaces with single space
	ClipPut (StringReplace(ClipGet(), "   ", " ")); replace any triple space with single space
	ClipPut (StringReplace(ClipGet(), "  ", " ")); replace any double space with single space
	ClipPut (StringReplace(ClipGet(), "..", ".")); replace any double space with single space
	ClipPut (StringReplace(ClipGet(), ClipGet(), ClipGet()&".")); add a full stop to the end
	Send("^v");
	;ClipPut ($sData); restore clipboard data
EndFunc


While 1
WEnd



;Working With Quotes In A String Can Get Hairy Fast And _Stringbetween Returns An Array, Try This Code And See If It Doesn't Help...

		;Reselect The String
		;Local $Ilength = Stringlen(Clipget()); Get Length Of String That Was Copied
		;For $I = $Ilength To 1 Step -1
		;	Send("{Left}");
		;
		;Next
