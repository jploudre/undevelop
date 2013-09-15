ListName=C:\Users\jkploudre\Documents\GitHub\undevelop\plantext.txt
#Include C:\Users\jkploudre\Documents\GitHub\undevelop\unfocus-plan-macros.ahk

FileRead, WordList, %Listname%
PrepareWordList(WordList)

windowwidth := 600
nobevel = -E0x200
smallboxheight = 26
fromtopposition = 10
fullboxheight = 235
lefteditoffset = 36
editwidth := windowwidth - lefteditoffset
MaxResults = 8

; Colors from http://ethanschoonover.com/solarized
base0 = 839496
base1 = 93a1a1
base2 = eee8d5
base3 = fdf6e3
base00 = 657b83
base01 = 586e75
base02 = 073642
base03 = 002b36
yellow = b58900
orange = cb4b16
red = dc322f
magenta = d33682
violet = 6c71c4
blue = 268bd2
cyan = 2aa198
green = 859900

;http://www.autohotkey.com/board/topic/35813-function-ctlcolors-more-colored-controls/?p=289426
/*
	Function:	CColor
				Set text and background color for some Gui controls. 
				Supported types: Edit, Text, ListBox, ComboBox, DropDownList, CheckBox, RadioButton, ListView, TreeView, RichEdit
   
	Parameters:   
		Hwnd		-  Handle of the control.
		Background  -  Background color. HTML color name or 6-digit RGB value. Optional.
		Foreground  -  Foreground color. HTML color name or 6-digit RGB value. Optional.
	  
	Remarks:
		You need to redraw the window for changes to take effect. For some controls, it may be needed to explicitelly specify 
		foreground color ("cRed") when creating control, otherwise text will stay black.

		On tha first call for a specific control class the function registers itself as message handler for WM_CTLCOLOR
		message of appropriate class.

		Buttons are always drawn with the default system colors. Drawing buttons requires several different brushes-face, highlight and shadow 
		but the WM_CTLCOLORBTN message allows only one brush to be returned. To provide a custom appearance for push buttons, use an owner-drawn button.

	About:
		o Version 1.0 by majkinetor.
		o Original code by (de)nick, See: <http://www.autohotkey.com/forum/topic238864.html>.
		o Licenced under BSD <http://creativecommons.org/licenses/BSD/>.
 */
CColor(Hwnd, Background="", Foreground="") {
	return CColor_(Background, Foreground, "", Hwnd+0)
}

CColor_(Wp, Lp, Msg, Hwnd) { 
	static 
	static WM_CTLCOLOREDIT=0x0133, WM_CTLCOLORLISTBOX=0x134, WM_CTLCOLORSTATIC=0x0138
		  ,LVM_SETBKCOLOR=0x1001, LVM_SETTEXTCOLOR=0x1024, LVM_SETTEXTBKCOLOR=0x1026, TVM_SETTEXTCOLOR=0x111E, TVM_SETBKCOLOR=0x111D
		  ,BS_CHECKBOX=2, BS_RADIOBUTTON=8, ES_READONLY=0x800
		  ,CLR_NONE=-1, CSILVER=0xC0C0C0, CGRAY=0x808080, CWHITE=0xFFFFFF, CMAROON=0x80, CRED=0x0FF, CPURPLE=0x800080, CFUCHSIA=0xFF00FF, CGREEN=0x8000, CLIME=0xFF00, COLIVE=0x8080, CYELLOW=0xFFFF, CNAVY=0x800000, CBLUE=0xFF0000, CTEAL=0x808000, CAQUA=0xFFFF00
 		  ,CLASSES := "Button,ComboBox,Edit,ListBox,Static,RICHEDIT50W,SysListView32,SysTreeView32"
	
	If (Msg = "") {      
		if !adrSetTextColor
			adrSetTextColor	:= DllCall("GetProcAddress", "uint", DllCall("GetModuleHandle", "str", "Gdi32.dll"), "str", "SetTextColor")
		   ,adrSetBkColor	:= DllCall("GetProcAddress", "uint", DllCall("GetModuleHandle", "str", "Gdi32.dll"), "str", "SetBkColor")
		   ,adrSetBkMode	:= DllCall("GetProcAddress", "uint", DllCall("GetModuleHandle", "str", "Gdi32.dll"), "str", "SetBkMode")
	
      ;Set the colors (RGB -> BGR)
		BG := !Wp ? "" : C%Wp% != "" ? C%Wp% : "0x" SubStr(WP,5,2) SubStr(WP,3,2) SubStr(WP,1,2) 
		FG := !Lp ? "" : C%Lp% != "" ? C%Lp% : "0x" SubStr(LP,5,2) SubStr(LP,3,2) SubStr(LP,1,2)

	  ;Activate message handling with OnMessage() on the first call for a class 
		WinGetClass, class, ahk_id %Hwnd% 
		If class not in %CLASSES% 
			return A_ThisFunc "> Unsupported control class: " class

		ControlGet, style, Style, , , ahk_id %Hwnd% 
		if (class = "Edit") && (Style & ES_READONLY) 
			class := "Static"
	
		if (class = "Button")
			if (style & BS_RADIOBUTTON) || (style & BS_CHECKBOX) 
				 class := "Static" 
			else return A_ThisFunc "> Unsupported control class: " class
		
		if (class = "ComboBox") { 
			VarSetCapacity(CBBINFO, 52, 0), NumPut(52, CBBINFO), DllCall("GetComboBoxInfo", "UInt", Hwnd, "UInt", &CBBINFO) 
			hwnd := NumGet(CBBINFO, 48)		;hwndList
			%hwnd%BG := BG, %hwnd%FG := FG, %hwnd% := BG ? DllCall("CreateSolidBrush", "UInt", BG) : -1

			IfEqual, CTLCOLORLISTBOX,,SetEnv, CTLCOLORLISTBOX, % OnMessage(WM_CTLCOLORLISTBOX, A_ThisFunc) 

			If NumGet(CBBINFO,44)	;hwndEdit
				Hwnd :=  Numget(CBBINFO,44), class := "Edit"
		} 

		if class in SysListView32,SysTreeView32
		{
			m := class="SysListView32" ? "LVM" : "TVM" 
			SendMessage, %m%_SETBKCOLOR, ,BG, ,ahk_id %Hwnd%
			SendMessage, %m%_SETTEXTCOLOR, ,FG, ,ahk_id %Hwnd%
			SendMessage, %m%_SETTEXTBKCOLOR, ,CLR_NONE, ,ahk_id %Hwnd%
			return
		}

		if (class = "RICHEDIT50W")
			return f := "RichEdit_SetBgColor", %f%(Hwnd, -BG)

		if (!CTLCOLOR%Class%)
			CTLCOLOR%Class% := OnMessage(WM_CTLCOLOR%Class%, A_ThisFunc) 

		return %Hwnd% := BG ? DllCall("CreateSolidBrush", "UInt", BG) : CLR_NONE,  %Hwnd%BG := BG,  %Hwnd%FG := FG
   } 
 
 ; Message handler 
	critical					;its OK, always in new thread.

	Hwnd := Lp + 0, hDC := Wp + 0
	If (%Hwnd%) { 
		DllCall(adrSetBkMode, "uint", hDC, "int", 1)
		if (%Hwnd%FG)
			DllCall(adrSetTextColor, "UInt", hDC, "UInt", %Hwnd%FG)
		if (%Hwnd%BG)
			DllCall(adrSetBkColor, "UInt", hDC, "UInt", %Hwnd%BG)
		return (%Hwnd%)
	}
}




SetBatchLines -1
#NoEnv
;#Warn All
;#Warn LocalSameAsGlobal, Off
#MaxThreadsBuffer On
#SingleInstance, Force

DllCall( "GDI32.DLL\AddFontResourceEx", Str,"C:\Users\jkploudre\Documents\GitHub\undevelop\jkpAwesome.TTF",UInt,(FR_PRIVATE:=0x10), Int,0)
Gui, +AlwaysOnTop -Caption +ToolWindow Border
GUI, margin, 0,0
gui, color, %base2%, %base3%
gui, font, s18 q4 c%base01%, FontAwesome
Gui, Add, ListBox, vChoice gListBoxClick w%windowwidth% x0 Y%smallboxheight% h216 t9 %nobevel%
Random, colorchoice, 0, 7
searchcolor := (colorchoice = 0 ) ? yellow : (colorchoice = 2) ? orange : (colorchoice = 3) ? red : (colorchoice = 4) ? magenta : (colorchoice = 5) ? violet : (colorchoice = 6) ? cyan : green
gui, font, s18 q4 c%searchcolor%, FontAwesome
hGui := WInExist()
CColor(hGui, %base2%, %base2%)
Gui, Add, Edit, x%lefteditoffset% y0 w%editwidth% h%smallboxheight% %nobevel%

Gui, Add, Text, x2 y0, �


RefreshList(1,1)

searchterm =   
Loop
{
    Input, input, L1, {enter}{esc}{backspace}{up}{down}{tab}{space}
    
	   if ErrorLevel = EndKey:escape
      {
         Gui, cancel
         Gosub GuiClose
      }
       if ErrorLevel = EndKey:enter
      {
         GoSub, GetSelection
         continue
      }
       if ErrorLevel = EndKey:backspace
      {
         GoSub, DeleteSearchChar
         continue
      }
       if ErrorLevel = EndKey:up
      {
         Send, {up}
         continue
      }
       if ErrorLevel = EndKey:down
      {
         Send, {down}
         continue
      }
		if ErrorLevel = EndKey:tab
      {
         GoSub, GetSelection
         continue
      }
   		if ErrorLevel = EndKey:space
      {
         if searchterm = 
         GoSub, DoImDone
         continue
      }
    searchterm = %searchterm%%input%  
    GuiControl,, Edit1, %searchterm%            
	RefreshList(0,0)
}
return

; Functions.#######################################################
GuiClose:
GuiEscape:
DllCall( "GDI32.DLL\RemoveFontResourceEx",Str,"C:\Users\jkploudre\Documents\GitHub\undevelop\jkpAwesome.TTF",UInt,(FR_PRIVATE:=0x10),Int,0)
   ExitApp
   
RefreshList(animate, small){
global
Critical

If (small = 0)
{
	Matchlist := Suggest(searchterm, ByRef Wordlist)
	GuiControl,, ListBox1, |%Matchlist%
	GuiControl, Choose, ListBox1, 1
}

If (animate = 1) {
	Gui +LastFound
	GUI_ID:=WinExist() 
	Gui, Show, xCenter y%fromtopposition% w%windowwidth% h%smallboxheight% Hide, AutoComplete
	DllCall("AnimateWindow","UInt",GUI_ID,"Int",200,"UInt","0xa0000")
}

else if (small = 1){
	Gui, Show, xCenter y%fromtopposition% w%windowwidth% h%smallboxheight%, AutoComplete
}
else if (small = 0) {
	Gui, Show, xCenter y%fromtopposition% w%windowwidth% h%fullboxheight%, AutoComplete
}

}

Suggest(CurrentWord, Byref Wordlist)
{
    global
    
    Pattern := ".*" . RegExReplace(CurrentWord,"S).","$0.*") ;subsequence matching pattern
    Pattern := "`nimS)^" . Pattern ;match options

	/* From Uberi
	RegExMatch(WhatTheWordIs,"`nimS)^" . SubStr(RegExReplace(WhatTheUserTyped,"S).","$0.*"),1,-2),Remaining)
	StrDiff(Remaining,WhatTheUserTyped)
	
	*/


    ;search for words matching the pattern
    MatchList := ""
    Position := 1
    While, Position := RegExMatch(WordList,Pattern,Word,Position)
    {
        Position += StrLen(Word)
        MatchList .= Word . "`n"
    }
    MatchList := SubStr(MatchList,1,-1) ;remove trailing delimiter
    
    ;sort by score
    SortedMatches := ""
    Loop, Parse, MatchList, `n
        SortedMatches .= Score(CurrentWord,A_LoopField) . "}" . A_LoopField . "`n"
    SortedMatches := SubStr(SortedMatches,1,-1)
    Sort, SortedMatches, N R ;rank results numerically descending by score

    ;remove scores
    MatchList := ""
    Loop, Parse, SortedMatches, `n
        MatchList .= SubStr(A_LoopField,InStr(A_LoopField,"}",True,-1) + 1) . "|"

    Position := InStr(MatchList,"|",True,1,MaxResults)
    If Position
    MatchList := SubStr(MatchList,1,Position - 1)


    Return, MatchList
}

/*

Basically, what you want to do is instead of using StrDiff(WhatTheUserTyped,WhatTheWordIs), you can use something like this:

RegExMatch(WhatTheWordIs,"`nimS)^" . SubStr(RegExReplace(WhatTheUserTyped,"S).","$0.*"),1,-2),Remaining)
StrDiff(Remaining,WhatTheUserTyped)
*/


Score(Word,Entry)
{
    Score := 100

    Length := StrLen(Word)

    ;determine prefixing
    Position := 1
    While, Position <= Length && SubStr(Word,Position,1) = SubStr(Entry,Position,1)
        Position ++
    Score *= Position ** 8

    ;determine number of superfluous characters
    RegExMatch(Entry,"`nimS)^" . SubStr(RegExReplace(Word,"S).","$0.*"),1,-2),Remaining)
    Score *= (1 + StrLen(Remaining) - Length) ** -1.5

    Return, Score
}

/*

Forum thread: http://www.autohotkey.com/forum/topic59407.html

*/
 
StrDiff(str1, str2, maxOffset:=5) {
if (str1 = str2)
return (str1 == str2 ? 0/1 : 0.2/StrLen(str1))
if (str1 = "" || str2 = "")
return (str1 = str2 ? 0/1 : 1/1)
StringSplit, n, str1
StringSplit, m, str2
ni := 1, mi := 1, lcs := 0
while ((ni <= n0) && (mi <= m0)) {
if (n%ni% == m%mi%)
lcs += 1
else if (n%ni% = m%mi%)
lcs += 0.8
else {
Loop, % maxOffset {
oi := ni + A_Index, pi := mi + A_Index
if ((n%oi% = m%mi%) && (oi <= n0)) {
ni := oi, lcs += (n%oi% == m%mi% ? 1 : 0.8)
break
}
if ((n%ni% = m%pi%) && (pi <= m0)) {
mi := pi, lcs += (n%ni% == m%pi% ? 1 : 0.8)
break
}
}
}
ni += 1
mi += 1
}
return ((n0 + m0)/2 - lcs) / (n0 > m0 ? n0 : m0)
}

PrepareWordList(ByRef WordList)
{
    If InStr(WordList,"`r")
        StringReplace, WordList, WordList, `r,, All
    While, InStr(WordList,"`n`n") ;remove blank lines within the list
        StringReplace, WordList, WordList, `n`n, `n, All
    WordList := Trim(WordList,"`n") ;remove blank lines at the beginning and end
}


DeleteSearchChar:
if searchterm =
    return
StringTrimRight, searchterm, searchterm, 1
GuiControl,, Edit1, %searchterm%
if searchterm =
{
	RefreshList(0,1)
    return
}
RefreshList(0,0)
return

ListBoxClick:
if A_GuiControlEvent = DoubleClick
    send, {enter}
return

GetSelection:
Gui, submit
GuiControlGet, Choice
gui, cancel
PerformChoice(Choice)
gosub, GuiClose
return

DoImDone:
gui, cancel
Send #{Space}
gosub, GuiClose
return