#IfWinActive Half-Life
*c::
Loop
{
GetKeyState,state,c,P
if state = U
break
Send, {Blind}{c}
Sleep,0.200				
}
return
#IfWinActive