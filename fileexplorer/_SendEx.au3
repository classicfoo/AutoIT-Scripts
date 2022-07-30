
Func _SendEx($sSendKeys, $hUser32Dll = "", $iTimeout = 2000, $sReleaseKeys = "0x10,0x11,0x12,0x5B,0x5C")
    Local $bCloseDll, $sRet
    Local $iDelay = Opt("SendKeyDelay") + Opt("SendKeyDownDelay")
    If $iDelay < 50 Then $iDelay = 50
    Local $aReleaseKeys = StringSplit($sReleaseKeys, ",")
    If @error Then Return SetError(1, 0, "Failed to create release key array")
    If $hUser32Dll <> "user32.dll" Then
        $hUser32Dll = DllOpen("user32.dll")
        If @error Then Return SetError(1, 0, "Failed to open handle to user32.dll")
        $bCloseDll = True
    EndIf
    $sRet = __ReleaseKeys($aReleaseKeys, $iTimeout, $hUser32Dll)
    If Not @error Then
        Send($sSendKeys)
        Sleep($iDelay)
        $sRet = __ReleaseKeys($aReleaseKeys, $iTimeout, $hUser32Dll)
    EndIf
    If $bCloseDll Then DllClose("user32.dll")
    If $sRet Then Return SetError(1, 0, $sRet)
    Return 1
EndFunc

; #INTERNAL_USE_ONLY# ===========================================================================================================
; Name ..........: __ReleaseKeys
; Description ...: release pressed keys
; Syntax ........: __ReleaseKeys(Byref $aReleaseKeys, $iTimeout, $hUser32Dll)
; Parameters ....: $aReleaseKeys        - [in/out] An array of unknowns.
;                  $iTimeout            - An integer value.
;                  $hUser32Dll          - A handle value.
; Return values .: None
; Author ........: iCode
; Modified ......: 25-May-2014
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func __ReleaseKeys(ByRef $aReleaseKeys, $iTimeout, $hUser32Dll)
    If $iTimeout < 50 Then $iTimeout = 250
    Local $aRet, $hTimer = TimerInit()
    For $i = 0 To UBound($aReleaseKeys) - 1
        $aRet = DllCall($hUser32Dll, "short", "GetAsyncKeyState", "int", $aReleaseKeys[$i])
        If @error Then Return SetError(1, 0, "Dll call GetAsyncKeyState failed with key: " & $aReleaseKeys[$i])
        If BitAND($aRet[0], 0x8000) <> 0 Then
            Do
                Sleep(100)
                DllCall($hUser32Dll, "int", "keybd_event", "int", $aReleaseKeys[$i], "int", 0, "long", 2, "long", 0)
                If @error Then Return SetError(1, 0, "Dll call keybd_event failed with key: " & $aReleaseKeys[$i])
                $aRet = DllCall($hUser32Dll, "short", "GetAsyncKeyState", "int", $aReleaseKeys[$i])
                If TimerDiff($hTimer) >= $iTimeout Then Return SetError(1, 0, "Time out limit reached")
            Until BitAND($aRet[0], 0x8000) = 0
        EndIf
    Next
EndFunc