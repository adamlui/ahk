/*

Name: Auto-Focus
Version: 2016.10.18
Author: adaaaam
Namespace: https://mturkers.org/adaaaam

Notes:
- Alt+Shift+F to toggle auto-focus. Win+Q to exit.
- When active, window under cursor is brought to focus.

*/

#singleInstance force

+!f::  ; Toggle auto-focus
	notify("Auto-Focus", (focus:=!focus) ? "on" : "off")
	setTimer, autoFocus, % focus ? 100 : "off"
return
autoFocus:
	mouseGetPos,,, control
	winActivate, ahk_id %control%
return

#q::exitApp

notify(alert, status = 0) {
	global
	transparency = 200  ; Set transparency level (0-255)
	stringUpper, status, status
	; Define notification properties and elements
	gui +alwaysOnTop +toolWindow -caption +E0x20
	gui color, black 
	gui font, cWhite s40 bold, arial
	gui add, text, vNotification center w700
	alert := alert " " status
	guiControl,, notification, % alert
	gui, show, autosize
	opacity = 0
	; Fade shit
	loop % transparency / 8 {	
		winSet, transparent, % opacity
		sleep 1
		opacity += 8
	}
	sleep 375  ; Maintain notification
	loop % transparency / 8 {
		winSet, transparent, % transparency
		sleep 1
		transparency -= 8
	}
	gui destroy
}
