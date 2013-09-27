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

; Accent Colors
cyan = 2aa198
yellow = b58900
orange = cb4b16
red = dc322f
magenta = d33682
violet = 6c71c4
blue = 268bd2
cyan = 2aa198
green = 859900

Random, colorchoice, 0, 7
randomeaccentcolor := (colorchoice = 0 ) ? yellow : (colorchoice = 2) ? orange : (colorchoice = 3) ? red : (colorchoice = 4) ? magenta : (colorchoice = 5) ? violet : (colorchoice = 6) ? cyan : green


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
gui, font, s18 q4 c%base02%, FontAwesome
Gui, Add, ListBox, vChoice gListBoxClick w%windowwidth% x0 Y%smallboxheight% h216 t9 %nobevel%
gui, font, s18 q4 c%randomeaccentcolor%, FontAwesome
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

Score(Word,Entry)
{
    RegExMatch(Entry,"`nimS)^" . SubStr(RegExReplace(Word,"S).","$0.*"),1,-2),Remaining)
    Return, StrDiff(Remaining,Word)
    /*
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
    */
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