; IconController_se.ahk
#NoEnv
#SingleInstance Force
!q::
RegRead, state, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideIcons
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideIcons, % (state ? 0 : 1)
DllCall("Shell32.dll\SHChangeNotify", "UInt", 0x8000000, "UInt", 0x1000, "Ptr", 0, "Ptr", 0)
return
