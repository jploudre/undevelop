ListName=C:\Users\jkploudre\Documents\GitHub\undevelop\plantext.txt
#Include C:\Users\jkploudre\Documents\GitHub\undevelop\unfocus-plan-macros.ahk

FileRead, WordList, %Listname%
PrepareWordList(WordList)

SetBatchLines -1
windowwidth := 600
nobevel = -E0x200
smallboxheight = 26
fromtopposition = 10
fullboxheight = 235
lefteditoffset = 2
editwidth := windowwidth - lefteditoffset
MaxResults = 8

#NoEnv

#SingleInstance, Force

DllCall( "GDI32.DLL\AddFontResourceEx", Str,"C:\Users\jkploudre\Documents\GitHub\undevelop\jkpAwesome.TTF",UInt,(FR_PRIVATE:=0x10), Int,0)
Gui, +AlwaysOnTop -Caption +ToolWindow Border
GUI, margin, 0,0
gui, color, 6b7c70, ffffff
gui, font, s18 q4, FontAwesome
Gui, Add, ListBox, vChoice gListBoxClick w%windowwidth% x0 Y%smallboxheight% h216 t9 -Background %nobevel%
gui, color, F2efc2, F2efc2
Gui, Add, Edit, x%lefteditoffset% y0 w%editwidth% h%smallboxheight% %nobevel%

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
	MatchList = 
	Matchlist := Suggest(searchterm, ByRef Wordlist)
}

GuiControl,, ListBox1, |%Matchlist%
GuiControl, Choose, ListBox1, 1


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

Suggest(Word, Byref Wordlist)
{
global

Pattern := ".*" . RegExReplace(Word,"S).","$0.*") ;subsequence matching pattern

    Pattern := "`nimS)^" . Pattern ;match options

    ;search for words matching the pattern
    Position := 1
    While, Position := RegExMatch(WordList,Pattern,Word,Position)
    {
        Position += StrLen(Word)
        MatchList .= Word . "|"
    }
    
    Sort, MatchList, FRankResults D| ;rank results by score
    
    Position1 := InStr(MatchList,"|",True,1,MaxResults)
	If Position1
    MatchList := SubStr(MatchList,1,Position1 - 1)

    Return, MatchList
}

RankResults(Entry1,Entry2,Offset)
{
    Return, Score(Entry2,0) - Score(Entry1,Offset)
}

Score(Entry,Offset)
{
    global searchterm
    Score := 100

    Length := StrLen(searchterm)

    ;determine prefixing
    Position2 := 1
    While, Position2 <= Length && SubStr(searchterm,Position2,1) = SubStr(Entry,Position2,1)
        Position2 ++
    Score *= Position2 ** 3

    ;determine number of superfluous characters
    RegExMatch(Entry,"`nmS)^" . SubStr(RegExReplace(searchterm,"S).","$0.*"),1,-2),Word)
    Score *= (1 + StrLen(Word) - Length) ** -1.5

    ;determine the offset (for wordlists sorted by frequency)
    If Offset > 0
        Score *= 10 ** 0.4
    Else If Offset < 0
        Score *= 10 ** -0.4

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
    While, InStr(WordList,"`n`n")
        StringReplace, WordList, WordList, `n`n, `n, All
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