; Load Different plans based on 'location'
SetTitleMatchMode, 2


IfWinActive, Level
{
ListName=plantext.txt
; Needs correlated include at the end.
}


#Include unfocus-basic.ahk

; JKP Custom Functions
; Functions.#######################################################

templateclicker(level1, level2 = 0,level3 = 0,level4 = 0,level5 = 0,level6 = 0)
{
	CoordMode, mouse, screen
	WinGetPos, originx, originy,,,A
	templaterelativeclicker(level1,60,originx,originy)
	templaterelativeclicker(level2,260,originx,originy)
	templaterelativeclicker(level3,460,originx,originy)
	templaterelativeclicker(level4,660,originx,originy)
	templaterelativeclicker(level5,860,originx,originy)
	templaterelativeclicker(level6,1060,originx,originy)
	CoordMode, mouse, relative
}
return

templaterelativeclicker(level,offset,originx,originy)
{
	if (level is between 0  and 6){
		If(level > 0) {
		clicky := originy + (level * 25) + 15
		clickx := originx + offset
		click, %clickx%, %clicky%
		WinWaitNotActive
		}
	}
}
return

rxmed(med)
{
templateclicker("15", "4", "2")
Sendinput %med%{Enter}{Escape}
WinWaitActive, Patient Chart
ImageSearch, FoundX, FoundY, 421, 152, 1040, 975, *n4 prescriptions.png
click, %FoundX%, %FoundY%
WinWaitActive, Medication List
SendInput !w%med%
}
return

; WordRetrieve should be an #include to match the list being processed

#Include unfocus-plan-macros.ahk



