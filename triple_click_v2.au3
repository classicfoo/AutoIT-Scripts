#include <AutoItConstants.au3>
#include <Misc.au3>

While 1
    If _IsPressed("04") Then
		If WinActive("[CLASS:Notepad]") Then ; Check if Notepad is currently active.
			
			;If Notepad is active, select line using keys
			;MsgBox($MB_SYSTEMMODAL, "", "WinActive" & @CRLF & "Notepad is active.")
			MouseClick($MOUSE_CLICK_LEFT);
			Send("{HOME}");
			Send("+{END}");
			
		Else
			;If Notepad not active, select line using mouse
			;MsgBox($MB_SYSTEMMODAL, "", "WinActive" & @CRLF & "Notepad is not active.")
			MouseClick($MOUSE_CLICK_LEFT)
			Sleep(50)
			MouseClick($MOUSE_CLICK_LEFT)
			Sleep(50)
			MouseClick($MOUSE_CLICK_LEFT)
		EndIf
		
	EndIf
WEnd
	

		
