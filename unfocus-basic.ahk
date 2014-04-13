InitialSettings()
ReadDataFiles()

FileRead, testcsv, planprescribemed.csv
;WordList := WordlistFromCSV(testcsv)

WordList := WordlistFromDataFile(ByRef icdlist)



; Set Up GUI
{

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
    searchterm = %searchterm%%input%  
    GuiControl,, Edit1, %searchterm%
	if (strlen(searchterm) < 2)
    {
        continue
    }


	RefreshList(0,0)
    
}
return
} ; End GUI

; Functions #######################################################

RefreshList(animate, small)
{
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
	{
		StringTrimLeft, trimmedfield, A_Loopfield, 2
		SortedMatches .= StringScore(CurrentWord,trimmedfield) . "}" . A_LoopField . "`n"
	}
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

StringScore(word,line,fuzziness=0)
{
	;If the string is equal to the word, perfect match.
    if (word = line)
        return 1
    
    ;if it's not a perfect match and is empty return 0
    if(word = "") 
        return 0
    
    runningScore = 0
    StringLower, lString, line
    strLength := strlen(line)
    StringLower, lWord, word
    wordLength := strlen(word)
    startAt = 0
    fuzzies = 1
  
    ; Cache fuzzyFactor for speed increase
    if (fuzziness)
    fuzzyFactor = 1 - %fuzziness%

    ; Walk through word and add up scores.
    ; Code duplication occurs to prevent checking fuzziness inside for loop
		
    if (fuzziness) {
        while (A_Index <= wordLength )
        {
		; Find next first case-insensitive match of a character.
		; AHK StringMid counts from 1; StringGetPos counts from 0
		StringMid, wordcharacter, lWord, %A_Index%, 1
		StringGetPos, idxOf, lstring, %wordcharacter%, , startAt

		if (Errorlevel = 1)
		{
		fuzzies += fuzzyFactor ; for mispelling
		continue
		}
		if (%startAt% = %idxOf%)
		{
		; Consecutive letter & start-of-string Bonus
		charScore = 0.7
      	} 
      	else {
        charScore = 0.1
		
		; Acronym Bonus
        ; Weighing Logic: Typing the first character of an acronym is as if you
        ; preceded it with two perfect character matches.


		StringMid, previousstringcharacter, lstring, idxOf, 1
		; Might also want to match previous character of tab or hyphen
		if (previousstringcharacter = (%A_Space%))
		charScore += 0.8
		msgbox Loop %A_Index%, previousstringcharacter is space or tab
		}

		; Same case bonus.
		StringMid, wordcasecharacter, word, idxOf, 1
		StringMid, stringcasecharacter, line, idxOf, 1
		if (wordcasecharacter == stringcasecharacter)
		charScore += 0.1		
		
		; Update scores and startAt position for next round of search
		runningScore += charScore
      	startAt := idxOf + 1
        }
    }
    else {
        while (A_Index <= wordLength )
        {
		StringMid, wordcharacter, lWord, %A_Index%, 1
		StringGetPos, idxOf, lstring, %wordcharacter%, , startAt
		
		;msgbox Loopnumber %A_index% wordLength %wordLength% startat %startAt% indxof %idxOf% wordcharacter %wordcharacter% 
		
		if (Errorlevel = 1)
		return 0
		
		if (startAt = idxOf)
		{
		;msgbox startat %startAt% indxof %idxOf% so 0.7 points
		charScore = 0.7
      	} 
      	else 
		{
        charScore = 0.1
		;msgbox startat %startAt% not equal indxof %idxOf% so 0.1 points
		StringMid, previousstringcharacter, lstring, idxOf -1, 1
		if (Errorlevel != 1)
		{
			if (previousstringcharacter = A_Space or A_Tab)
			{
			;	msgbox Loop %A_Index%, previousstringcharacter is Tab or Space
			charScore += 0.1
			}
		}
		}
		
		StringMid, wordcasecharacter, word, idxOf, 1
		StringMid, stringcasecharacter, line, idxOf, 1
		if (wordcasecharacter == stringcasecharacter)
		{
		;MsgBox Loop %A_Index% Capitalization wordcasecharacter %wordcasecharacter% stringcasecharacter %stringcasecharacter% so add 0.1
		charScore += 0.1
		}
		runningScore += charScore
      	startAt := idxOf + 1
		}
    }
    
	; Reduce penalty for longer strings.
	finalScore := (0.5*((runningScore/strLength)+(runningScore/wordLength)))/fuzzies
	StringMid, firststringcharacter, lstring, 1, 1
	StringMid, firstwordcharacter, lword, 1, 1
	
	if ((firststringcharacter = firstwordcharacter) AND (finalScore < 0.85))
	finalScore += 0.15
	
	return finalScore
}

WordlistFromCSV(ByRef CSVfile)
{
	Loop, parse, CSVfile, `n, `r
	{
		loop, parse, A_Loopfield, CSV
		{
			; Just grab first two fields
			if (A_Index < "3"){
			WordList .= A_Loopfield . "`t"
			}
		}
		WordList .= "`n"
	}
	return WordList
}

WordlistFromDataFile(ByRef datafile)
{
	Loop, parse, datafile, |
	{
		loop, parse, A_Loopfield, ^
		{
			if (A_Index = "1"){
			StringUpper, titlecase, A_Loopfield, T
			WordList .= "…"  . "`t" .  titlecase . "`t"
			}
			if (A_Index = "2"){
			WordList .= A_Loopfield . "`t"
			}
		}
		WordList .= "`n"
	}
	return WordList
}

InitialSettings()
{
global
; AHK Program Variables
SetBatchLines -1
#NoEnv
;#Warn All
;#Warn LocalSameAsGlobal, Off
#MaxThreadsBuffer On
#SingleInstance, Force

; UI Variables
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
cyan = 2aa198
yellow = b58900
orange = cb4b16
red = dc322f
magenta = d33682
violet = 6c71c4
blue = 268bd2
cyan = 2aa198
green = 859900

; Random UI Color
Random, colorchoice, 0, 7
randomeaccentcolor := (colorchoice = 0 ) ? yellow : (colorchoice = 2) ? orange : (colorchoice = 3) ? red : (colorchoice = 4) ? magenta : (colorchoice = 5) ? violet : (colorchoice = 6) ? cyan : green

; Install the Custom Font
Filecopy, jkpAwesome.TTF, %A_Temp%\jkpAwesome.TTF
tempfontlocation :=  A_Temp . "\jkpAwesome.TTF"
DllCall( "GDI32.DLL\AddFontResourceEx", Str, tempfontlocation ,UInt,(FR_PRIVATE:=0x10), Int,0)


; GUI Interface
Gui, +AlwaysOnTop -Caption +ToolWindow Border
GUI, margin, 0,0
gui, color, %base2%, %base3%
gui, font, s18 q4 c%base02%, FontAwesome
Gui, Add, ListBox, vChoice gListBoxClick w%windowwidth% x0 Y%smallboxheight% h216 t9 t18 t300 %nobevel%
gui, font, s18 q4 c%randomeaccentcolor%, FontAwesome
Gui, Add, Edit, x%lefteditoffset% y0 w%editwidth% h%smallboxheight% %nobevel%
Gui, Add, Text, x2 y0, Ä
}

ReadDataFiles()
{
global
FileRead, icdlist, data/icdlist.txt
FileRead, medlist, data/icdlist.txt
FileRead, orderlist, data/orderlist.txt
}

; Subroutines #######################################################
GuiClose:
GuiEscape:
{
DllCall( "GDI32.DLL\RemoveFontResourceEx",Str, tempfontlocation ,UInt,(FR_PRIVATE:=0x10),Int,0)
   ExitApp
return
}

DeleteSearchChar:
{
if searchterm =
    return
StringTrimRight, searchterm, searchterm, 1
GuiControl,, Edit1, %searchterm%
if (strlen(searchterm) < 2)
{
	RefreshList(0,1)
    return
}
RefreshList(0,0)
return
}

ListBoxClick:
{
if A_GuiControlEvent = DoubleClick
    send, {enter}
return
}

GetSelection:
{
Gui, submit
GuiControlGet, Choice
gui, cancel
gosub, GuiClose
return
}
