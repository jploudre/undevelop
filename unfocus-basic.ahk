ArrayCount = 0
Loop, Read, %Listname%
{
    ArrayCount += 1  
    Array%ArrayCount% := A_LoopReadLine
}

FileRead, WordList, %Listname%
PrepareWordList(WordList)

SetBatchLines -1
windowwidth := 432
nobevel = -E0x200
smallboxheight = 29
fromtopposition = 10
fullboxheight = 264
lefteditoffset = 10
editwidth := windowwidth - lefteditoffset
MaxResults = 8

#NoEnv

#SingleInstance, Force
Gui, +AlwaysOnTop -Caption +ToolWindow Border
GUI, margin, 0,0
gui, color, 6b7c70, ffffff
gui, font, s18, Tahoma Bold
Gui, Add, ListBox, vChoice gListBoxClick w%windowwidth% x0 Y%smallboxheight% h236 t240 t316 -Background %nobevel%
gui, color, F2efc2, F2efc2
Gui, Add, Edit, x%lefteditoffset% y0 w%editwidth% h%smallboxheight% %nobevel%

RefreshList(1,1)

searchterm =   
Loop
{
    Input, input, L1, {enter}{esc}{backspace}{up}{down}{tab}
    
	   if ErrorLevel = EndKey:escape
      {
         Gui, cancel
         Gosub GuiClose
      }
       if ErrorLevel = EndKey:enter
      {
         GoSub, WordRetrieve
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
         GoSub, WordRetrieve
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
   ExitApp
   
RefreshList(animate, small){
global
Critical

If (small = 0)
{
	Matchlist := jkpSuggest(searchterm, Wordlist)
	;limit the number of results
	Position := InStr(MatchList,"|",True,1,MaxResults)
	If Position
    MatchList := SubStr(MatchList,1,Position - 1)

}

GuiControl,, ListBox1, %Matchlist%
GuiControl, Choose, ListBox1, 1


If (animate = 1) {
	Gui +LastFound
	GUI_ID:=WinExist() 
	Gui, Show, xCenter y%fromtopposition% w%windowwidth% h%smallboxheight% Hide, AutoComplete
	DllCall("AnimateWindow","UInt",GUI_ID,"Int",300,"UInt","0xa0000")
}

else if (small = 1){
	Gui, Show, xCenter y%fromtopposition% w%windowwidth% h%smallboxheight%, AutoComplete
}
else if (small = 0) {
	Gui, Show, xCenter y%fromtopposition% w%windowwidth% h%fullboxheight%, AutoComplete
}

}

jkpSuggest(Word, ByRef Wordlist)
{
global

Pattern := RegExReplace(Word,"S).","$0.*") ;subsequence matching pattern

    ;treat accented characters as equivalent to their unaccented counterparts
    Pattern := RegExReplace(Pattern,"S)[a" . Chr(224) . Chr(226) . "]","[a" . Chr(224) . Chr(226) . "]")
    Pattern := RegExReplace(Pattern,"S)[c" . Chr(231) . "]","[c" . Chr(231) . "]")
    Pattern := RegExReplace(Pattern,"S)[e" . Chr(233) . Chr(232) . Chr(234) . Chr(235) . "]","[e" . Chr(233) . Chr(232) . Chr(234) . Chr(235) . "]")
    Pattern := RegExReplace(Pattern,"S)[i" . Chr(238) . Chr(239) . "]","[i" . Chr(238) . Chr(239) . "]")
    Pattern := RegExReplace(Pattern,"S)[o" . Chr(244) . "]","[o" . Chr(244) . "]")
    Pattern := RegExReplace(Pattern,"S)[u" . Chr(251) . Chr(249) . "]","[u" . Chr(251) . Chr(249) . "]")

    Pattern := "`nimS)^" . Pattern ;match options

    ;search for words matching the pattern
    MatchList := ""
    Position := 1
    While, Position := RegExMatch(WordList,Pattern,Word,Position)
    {
        Position += StrLen(Word)
        ;StringReplace, Word, Word, %A_Tab%, %A_Space%%A_Space%%A_Space%%A_Space%, All
        MatchList .= Word . "|"
    }
    
    Sort, MatchList, FRankResults D| ;rank results by score

    Return, MatchList
}

RankResults(Entry1,Entry2,Offset)
{
    Return, Score(Entry2,0) - Score(Entry1,Offset)
}

Score(Entry,Offset)
{
    global CurrentWord
    Score := 100

    Length := StrLen(CurrentWord)

    ;determine prefixing
    Position := 1
    While, Position <= Length && SubStr(CurrentWord,Position,1) = SubStr(Entry,Position,1)
        Position ++
    Score *= Position ** 3

    ;determine number of superfluous characters
    RegExMatch(Entry,"`nmS)^" . SubStr(RegExReplace(CurrentWord,"S).","$0.*"),1,-2),Word)
    Score *= (1 + StrLen(Word) - Length) ** -1.5

    ;determine the offset (for wordlists sorted by frequency)
    If Offset > 0
        Score *= 10 ** 0.4
    Else If Offset < 0
        Score *= 10 ** -0.4

    Return, Score
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

WordRetrieve:
Gui, submit
GuiControlGet, Choice

StringGetPos, tabpos, Choice, %A_Tab%,
tabpos++
StringTrimLeft, Choice, Choice, tabpos 
gui, cancel
CoordMode, Mouse, screen
click, 233, 34
CoordMode, Mouse, relative
PerformChoice(Choice)
gosub, GuiClose
return