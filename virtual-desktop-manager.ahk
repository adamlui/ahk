/*

Name:         Virtual Desktop Manager
Version:      2023.01.16
Author:       Adam Lui
Namespace:    https://elonsucks.org/@adam
Description:  Use hotkeys to manage virtual desktops in Windows.

Notes:
- Alt+C - Create Virtual Desktop
- Alt+V - Close Virtual Desktop
- Alt+Z - Navigate to Left Virtual Desktop
- Alt+X - Navigate to Right Virtual Desktop
- Alt+Q or Win+Q - Exit Script
 
*/

#singleInstance force

!c::send #^d
!v::send #^{f4}
!z::send #^{left}
!x::send #^{right}
!q::
#q::exitApp
