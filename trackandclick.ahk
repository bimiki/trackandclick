#Persistent
SetTimer, CheckForMovingObject, 50

; crtl + 4 to toggle the script on and off
^4::
  if (A_IsToggled) {
    SetTimer, CheckForMovingObject, Off
    A_IsToggled = 0
  } else {
    SetTimer, CheckForMovingObject, 50
    A_IsToggled = 1
  }
  return

CheckForMovingObject:
  CoordMode, Mouse, Screen
  MouseGetPos, mouseX, mouseY

  ; Use PixelSearch to look for a moving object on the screen
  PixelSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xFF0000, 10
  if (ErrorLevel = 0) {
    ; If a moving object is found, move the mouse to its location and click
    MouseMove, foundX, foundY
    Click
  }

return
