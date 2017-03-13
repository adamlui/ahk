/*
Name: Gamepad Mapper
Namespace: https://twitter.com/adamllui
Version: 2016.06.16
Author: adaaaam
Notes: Win+Q to exit.
*/

#persistent
#singleInstance force

; Map joystick
up = e
down = d
left = s
right = f

setTimer, watchAxis, 5
return

; Map buttons
joy4::send i  ; Y button
joy3::send o  ; X button
joy1::send {space}  ; A button
joy2::send k  ; B button
joy5::send j  ; L button
joy6::send P  ; R button
joy7::send g  ; Select button

watchAxis:
    getKeyState, joyX, joyX
    getKeyState, joyY, joyY
    yAxisPrev = %yAxis%
    xAxisPrev = %xAxis%
    if (joyY < 30) && (joyX < 70) && (joyX > 30) {
        yAxis := up
        xAxis = 
    } else if (joyY < 30) && (joyX > 70) {
        yAxis := up
        xAxis := right
    } else if (joyX > 70) && (joyY > 30) && (joyY < 70) {
        yAxis =
        xAxis := right
    } else if (joyY > 70) && (joyX > 70) {
        yAxis := down
        xAxis := right
    } else if (joyY > 70) && (joyX < 70) && (joyX > 30) {
        yAxis := down
        xAxis =
    } else if (joyY > 70) && (joyX < 30) {  ;
        yAxis := down
        xAxis := left
    } else if (joyX < 30) && (joyY > 30) && (joyY < 70) {
        yAxis =
        xAxis := left
    } else if (joyY < 30) && (joyX < 30) {
        yAxis := up
        xAxis := left
    } else {
        yAxis =
        xAxis =
    }
    setKeyDelay -1
    if (yAxisPrev !=  yAxis) {  ; If change in y-axis detected
        if yAxisPrev  ; There is a previous up/down key to release.
            send {%yAxisPrev% up}  ; Release it.
        if yAxis  ; There is an up/down key to press down.
            send {%yAxis% down}  ; Press it down.
    }
    if (xAxisPrev !=  xAxis) {  ; If change in x-axis detected
        if xAxisPrev  ; There is a previous left/right key to release.
            send {%xAxisPrev% up}  ; Release it.
        if xAxis  ; There is a left/right key to press down.
            send {%xAxis% down}  ; Press it down.
    }
return

#q::exitApp
