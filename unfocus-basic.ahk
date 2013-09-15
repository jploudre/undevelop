ListName=C:\Users\jkploudre\Documents\GitHub\undevelop\plantext.txt
#Include C:\Users\jkploudre\Documents\GitHub\undevelop\unfocus-plan-macros.ahk

FileRead, WordList, %Listname%
PrepareWordList(WordList)

windowwidth := 600
nobevel = -E0x200
smallboxheight = 26
fromtopposition = 10
fullboxheight = 235
lefteditoffset = 2
editwidth := windowwidth - lefteditoffset
MaxResults = 8
base2 = eee8d5
base3 = fdf6e3
base01 = 586e75
base00 = 657b83

/*
http://ethanschoonover.com/solarized

base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60

*/


SetBatchLines -1
#NoEnv
;#Warn All
;#Warn LocalSameAsGlobal, Off
#MaxThreadsBuffer On
#SingleInstance, Force

DllCall( "GDI32.DLL\AddFontResourceEx", Str,"C:\Users\jkploudre\Documents\GitHub\undevelop\jkpAwesome.TTF",UInt,(FR_PRIVATE:=0x10), Int,0)
Gui, +AlwaysOnTop -Caption +ToolWindow Border
GUI, margin, 0,0
gui, color, 6b7c70, %base3%
gui, font, s18 q4 c%base00%, FontAwesome
Gui, Add, ListBox, vChoice gListBoxClick w%windowwidth% x0 Y%smallboxheight% h216 t9 -Background %nobevel%
gui, color, %base2%, %base2%
Gui, Add, Edit, x%lefteditoffset% y0 w%editwidth% h%smallboxheight% c%base01% %nobevel%

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