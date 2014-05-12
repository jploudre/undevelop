InitialSettings()

WordList := WordlistFromDataFile(listtypeicd, ByRef icdlist)
WordList := WordlistFromDataFile(listtypemedication, ByRef medlist)
WordList := WordlistFromDataFile(listtypeorder, ByRef orderlist)
Sort, Wordlist, U

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

; toralf's version. http://www.autohotkey.com/board/topic/99960-string-score-compare-two-strings/
StrScore(string, word, fuziness=0){
  ;If the string is equal to the word, perfect match.
  If (string == word) 
    return 1
  ;if it's not a perfect match and is empty return 0
  If (word = "")
    return 0   
 
  runningScore = 0
  strLength := StrLen(string)
  wordLength := StrLen(word)
  startAt = 1
  fuzzies = 1
  Offset = 0
  
  ;Cache fuzzyFactor for speed increase
  fuzzyFactor := fuziness ? 1 - fuziness : 0
 
  ;Walk through word and add up scores.
  ;Code duplication occurs to prevent checking fuzziness inside for loop
  If fuziness {
    Loop, Parse, word
      {
        ;Find next first case-insensitive match of a character.
        idxOf := InStr(String, A_Loopfield, 0, startAt)
        If (idxOf = 0){
          fuzzies += fuzzyFactor
          continue  
        }Else If (startAt = idxOf){
          ;Consecutive letter & start-of-string Bonus
          charScore = 0.7
        }Else{
          charScore = 0.1
          ;Acronym Bonus
          ;Weighing Logic: Typing the first character of an acronym is as if you
          ;preceded it with two perfect character matches.
          if (SubStr(string, idxOf - 1, 1) = " ")
            charScore += 0.8
        }
        ;Same case bonus.
        if (SubStr(string,idxOf,1) == A_Loopfield)
          charScore += 0.1 
        ;Update scores and startAt position for next round of indexOf
        runningScore += charScore
        startAt := idxOf + 1
      }
  }Else {
    Loop, Parse, word
      {
        idxOf := InStr(String, A_Loopfield, 0, startAt)
        If (idxOf = 0){
          return 0  
        }Else If (startAt = idxOf){
          charScore = 0.7
        }Else{
          charScore = 0.1
          if (SubStr(string, idxOf - 1, 1) = " ")
            charScore += 0.8
        }
        if (SubStr(string,idxOf,1) == A_Loopfield)
          charScore += 0.1 
        runningScore += charScore
        startAt := idxOf + 1
      }
  }
  ;Reduce penalty for longer strings.
  finalScore := 0.5 * (runningScore / strLength  + runningScore / wordLength) / fuzzies
  if ((SubStr(Word, 1, 1) = SubStr(String, 1, 1)) AND (finalScore < 0.85)) 
    finalScore += 0.15
  return finalScore
}

WordlistFromDataFile(listtype, ByRef datafile)
{
	global
	Loop, parse, datafile, |
	{
		if (listtype = listtypeicd)
		{
		loop, parse, A_Loopfield, ^
		{
			if (A_Index = "1"){
			StringUpper, titlecase, A_Loopfield, T
			WordList .= stethoscope  . "`t" .  titlecase . "`t"
			}
			if (A_Index = "2"){
			WordList .= A_Loopfield . "`t"
			}
		}
		WordList .= "`n"
		}
		if (listtype = listtypemed)
		{
		loop, parse, A_Loopfield, ^
		{
			if (A_Index = "5"){
			StringUpper, titlecase, A_Loopfield, T
			WordList .= pencilpaper  . "`t" .  titlecase
			}
		}
		WordList .= "`n"
		}
		if (listtype = listtypeorder)
		{
		loop, parse, A_Loopfield, ^
		{
			if (A_Index = "2"){
			StringUpper, titlecase, A_Loopfield, T
			WordList .= labbeaker  . "`t" .  titlecase . "`t"
			}
			if (A_Index = "3"){
			WordList .= A_Loopfield . "`t"
			}
		}
		WordList .= "`n"
		}
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
windowwidth := 800
nobevel = -E0x200
smallboxheight = 26
fromtopposition = 10
fullboxheight = 235
lefteditoffset = 36
editwidth := windowwidth - lefteditoffset
MaxResults = 8

; Names of Icons

stethoscope = … ; Used for ICD
pencilpaper = î  ; Used for Prescriptions
labbeaker = ± ; Orders

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

; Install the Custom Files
Filecopy, jkpAwesome.TTF, %A_Temp%\jkpAwesome.TTF
tempfontlocation :=  A_Temp . "\jkpAwesome.TTF"
DllCall( "GDI32.DLL\AddFontResourceEx", Str, tempfontlocation ,UInt,(FR_PRIVATE:=0x10), Int,0)
FileInstall, data/icdlist.txt, %A_Temp%\icdlist.txt, 1
FileInstall, data/medlist.txt, %A_Temp%\medlist.txt, 1
FileInstall, data/orderlist.txt, %A_Temp%\orderlist.txt, 1
FileRead, icdlist, %A_Temp%\icdlist.txt
FileRead, medlist, %A_Temp%\medlist.txt
FileRead, orderlist, %A_Temp%\orderlist.txt

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
ProcessSelection(Choice)
gosub, GuiClose
return
}

ProcessSelection(theuserchoice)
{
global
; Assumes tab delimited line with 1) Icon character, 2) The Selected Text, 3 and on) Items to process.

userchoicechunks := StrSplit(theuserchoice, A_Tab)
if (userchoicechunks[1] = stethoscope) ; ICD
{
addICD(userchoicechunks[2], userchoicechunks[3])
}
if (userchoicechunks[1] = pencilpaper) ; Medication
{
addMed(userchoicechunks[2])
}
if (userchoicechunks[1] = labbeaker) ; Order
{
addOrder(userchoicechunks[2])
}

}

AddMed(Medication)
{
Global
; For now assumes in Update
Click, 333, 40
WinWaitActive, New Medication
Sleep, 100
Click, 716, 51
WinWaitActive, Find Medication
sleep, 100
SendInput %Medication%
Send !s
}

AddOrder(Order)
{
Global
; For now assumes in Update
Click, 254, 38
WinWaitActive, Update Orders
Sleep, 100
Click, 246, 289
Sleep, 100
Click, 465, 328
SendInput %Order%
SendInput {Enter}
Sleep, 100
Click, 739, 542
}

addICD(TextDescription, ICD)
{
Global
; For now assumes in Update
Click, 405, 40
WinWaitActive, New Problem
Sleep, 100
Click, 586, 72
WinWaitActive, Find Problem
sleep, 100
SendInput %TextDescription% 
SendInput !s
Sleep, 100
Click 491, 422
WinWaitActive New Problem
Sleep, 100
Click, 510, 421
WinWaitActive Update
Notify(stethoscope, "Added",TextDescription)
}

Notify(Type, Title, Message)
{
Global
Gui 2:+LastFound +AlwaysOnTop -Caption +ToolWindow Border  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
GUI, 2:margin, 0,0
Gui, 2:Color, %base2%, %base3%
gui, 2:font, s18 q4 c%randomeaccentcolor%, FontAwesome
Gui, 2:Add, Text, x2 y0, %Type%
Gui, 2:Add, Text, c%Base02% x%lefteditoffset% y0, %Title% -- %Message%
Gui, 2:Show, xCenter y%fromtopposition% w%windowwidth% h%smallboxheight% NoActivate  ; NoActivate avoids deactivating the currently active window.
Sleep 1500
GUI, 2:Destroy
}
