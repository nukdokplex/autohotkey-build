#IfWinActive Half-Life
*8::
Loop
{
GetKeyState,state,8,P
if state = U
break
Send, {Blind}{x}
Sleep,2.500
}
return
#IfWinActive

