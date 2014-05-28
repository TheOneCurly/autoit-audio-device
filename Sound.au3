#include <Constants.au3>

; Open sound settings
Run("RUNDLL32.EXE shell32.dll,Control_RunDLL mmsys.cpl,,4")
WinWaitActive("Sound")

$dir = "{DOWN}"
$num_devices = ControlListView ("Sound", "", 1000, "GetItemCount")

For $i = 1 To $num_devices
   Send($dir)

   If $i = $num_devices Then
	  moveTop($num_devices)
	  switchDir()
	  ExitLoop
   EndIf
   If ControlCommand ("Sound", "", 1002, "IsEnabled", "") = 0 Then ExitLoop
Next

Send($dir)

; Click "Set Default"
ControlClick("Sound", "", "[CLASS:Button;INSTANCE:2]")

; Close sound settings
WinClose("Sound")

Func moveTop ($num)
   For $i = 1 To $num
	  Send("{UP}")
   Next
EndFunc

Func switchDir ()
   If $dir = "{DOWN}" Then
	  $dir = "{UP}"
   Else
	  $dir = "{Down}"
   EndIf
EndFunc