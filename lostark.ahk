#IfWinActive ahk_class EFLaunchUnrealUWindowsClient ahk_exe LOSTARK.exe

#InstallKeybdHook
#InstallMouseHook
#UseHook On

CoordMode, Mouse, Window

_loop := false
_row := -1

; Alt+S acts like Alt+P.
!s::
send, !p
return

; Alt+F acts like Alt+Y.
!f::
send, !y
return

; Ctrl+Alt+0: Take attachments from mail and delete it.
!^0::
  _loop := !_loop
  if (_loop)
    SetTimer, _take_mail, -1000
return

; Ctrl+Alt+1: Buy 999 items of product #1 listed on the market's search page.
!^1::
  _loop := !_loop
  if (_loop) {
    _row := 1
    SetTimer, _buy, -1000
  }
return

; Ctrl+Alt+2: Buy 999 items of product #2 listed on the market's search page.
!^2::
  _loop := !_loop
  if (_loop) {
    _row := 2
    SetTimer, _buy, -1000
  }
return

; Ctrl+Alt+3: Buy 999 items of product #3 listed on the market's search page.
!^3::
  _loop := !_loop
  if (_loop) {
    _row := 3
    SetTimer, _buy, -1000
  }
return

_take_mail:
while (true) {
  if (!_loop)
    break
  MouseClick, L, 721, 517
  Sleep, 100
  if (!_loop)
    break
  MouseClick, L, 935, 1025
  Sleep, 1000
  if (!_loop)
    break
  MouseClick, L, 721, 517
  Sleep, 100
  if (!_loop)
    break
  MouseClick, L, 1059, 1021
  Sleep, 100
  if (!_loop)
    break
  MouseClick, L, 950, 787
  Sleep, 500
}
return

_buy:
while (true) {
  if (!_loop)
    break
  MouseClick, L, 999, 537 + (_row - 1) * 57
  Sleep, 100

  if (!_loop)
    break
  MouseClick, L, 1890, 1129
  Sleep, 100

  if (!_loop)
    break
  MouseClick, L, 1315, 697
  Sleep, 100

  if (!_loop)
    break
  Send, {Blind}{Backspace}
  Sleep, 10
  Send, {Blind}999
  Sleep, 10

  if (!_loop)
    break
  MouseClick, L, 1281, 997
  Sleep, 100

  if (!_loop)
    break
  MouseClick, L, 1281, 790
  Sleep, 10000
}
return
