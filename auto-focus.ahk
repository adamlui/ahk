/*

Name: Auto-Focus
Namespace: https://mturkers.org/forum/t/auto-focus.6/
Version: 2017.04.02
Author: adaaaam

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
	stringUpper, status, status
	; Define notification properties and elements
	gui +alwaysOnTop +toolWindow -caption +E0x20
	gui color, black 
	gui font, cWhite s40 bold, arial
	gui add, text, vNotification center w700
	alert := alert " " status
	guiControl,, notification, % alert
	gui, show, autosize
	sleep 375
	gui destroy
}
