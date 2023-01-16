/*

Name: Auto-Typer
Version: 2022.06.04
Author: Adam Lui
Namespace: https://elonsucks.org/@adam
Description: Automatically sends messages to apps like Discord.

Notes:
- Set message in line 13
- Set delay between messages (in milliseconds) in line 12
- Activate by pressing ` (backquote) key
  
*/

#singleInstance force 
delay = 61000
msg = .

`::  ; Toggle autoTyper 
    send % !auto ? msg "{enter}" : 
    setTimer, autoTyper, % !auto ? delay : "off" 
    notify("Auto-Typer", (auto:=!auto) ? "ON" : "OFF") 
return 
autoTyper: 
    send %msg%{enter} 
return 
 
notify(alert, status = 0) { 
    global 
    gui +alwaysOnTop +toolWindow -caption +E0x20 
    gui color, black  
    gui font, cWhite s40 bold, arial 
    gui add, text, vNotification center w700 
    alert := alert " " status 
    guiControl,, notification, % alert 
    gui, show, autosize 
    opacity = 0 
    sleep 775  ; Maintain notification 
    gui destroy 
}
