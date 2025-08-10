; IconController_se.ahk
#NoEnv
#SingleInstance Force
#WinActivateForce

; 默认快捷键：Alt+Q
!q::
ToggleDesktopIcons()
return

; 切换函数
ToggleDesktopIcons() {
    RegRead, state, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideIcons
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideIcons, % (state ? 0 : 1)
    DllCall("Shell32.dll\SHChangeNotify", "UInt", 0x8000000, "UInt", 0x1000, "Ptr", 0, "Ptr", 0)
}
