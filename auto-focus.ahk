/*

Name: Auto-Focus
Version: 2023.01.16
Author: Adam Lui
Namespace: https://elonsucks.org/@adam
Description: Brings window under cursor into focus automatically.

Notes:
- Alt+Shift+F to toggle auto-focus. Win+Q to exit.

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
