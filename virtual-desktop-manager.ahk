/*
Name: Virtual Desktop Manager
Version: 2020.01.19
Author: Adam Lui
Namespace: http://cultofgeek.com
Notes: Alt+C - Create Virtual Desktop
 Alt+V - Close Virtual Desktop
 Alt+Z - Navigate to Left Virtual Desktop
 Alt+X - Navigate to Right Virtual Desktop
 Alt+Q or Win+Q - Exit Script
*/
#singleInstance force
!c::send #^d
!v::send #^{f4}
!z::send #^{left}
!x::send #^{right}
!q::
#q::exitApp
