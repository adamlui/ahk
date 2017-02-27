/*
Name: MTurk A9 Data Validation Hotkeys
Version: 2017.02.25
Author: adaaaam
Namespace: https://mturkers.org/adaaaam
Requester URL: https://www.mturk.com/mturk/searchbar?selectedSearchType=hitgroups&requesterId=A3HLF55H6JSTI0
Download URL: https://raw.githubusercontent.com/adaaaam/ahk/master/mturk-a9-data-validation-hotkeys.ahk

HOTKEYS:
 A or 1 - Strongly Dissimilar
 S or 2 - Somewhat Dissimilar
 D or 3 - Neither Similar nor Dissimilar
 F or 4 - Somewhat Similar
 G or 5 - Strongly Similar

 E or Enter - Submit HIT

 Alt+Q - Toggle Suspend
 Win+Q - Exit

NOTE: To activate auto-submission, replace line 26 with "autoSubmit = true"
*/

#singleInstance force

autoSubmit = false

marX := 93, marY := 680

loop 4 {
	hotkey, ifWinActive, Amazon Mechanical Turk
	hotkey, % chr(a_index+48), selector
}

!q::suspend
#q::exitApp

#ifWinActive Amazon Mechanical Turk

a::
s::
d::
f::
g::
	mouseClick,, marX, marY,, 0
	send {tab}
	b := % a_thisHotkey = "a" ? "0" : a_thisHotkey = "s" ? "1" : a_thisHotkey = "d" ? "2" : a_thisHotkey = "f" ? "3" : a_thisHotkey = "g" ? "4" :
	send % b = "0" ? "{space}" : "{right " b "}"
	send % autoSubmit = "true" ? "{enter}" :
return

e::send {enter}

selector:
	mouseClick,, marX, marY,, 0
	send {tab}
	a := a_thisHotkey - 1
	send % a_thisHotkey = "1" ? "{space}" : "{right " a "}"
return
