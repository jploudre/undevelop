;stringscore_testsuite()

stringscore_testsuite()
{
ExactMatch := StringScore("Hello World","Hello World")
NotMatch := StringScore("hellx","Hello World")
MustBeSequential := StringScore("WH","Hello World")
SameCaseBetter1 := StringScore("Hello","Hello World")
SameCaseBetter2 := StringScore("hello","Hello World")
HigherScoreForCloserMatches1 := StringScore("H","Hello World")
HigherScoreForCloserMatches2 := StringScore("He","Hello World")
MatchingWithWrongCase := StringScore("himi","Hillsdale Michigan")
ProperRelativeWeighting1 := StringScore("e","hello world")
ProperRelativeWeighting2 := StringScore("h","hello world")
ProperRelativeWeighting3 := StringScore("hel","hello world")
ProperRelativeWeighting4 := StringScore("hell","hello world")
ProperRelativeWeighting5 := StringScore("hello","hello world")
ProperRelativeWeighting6 := StringScore("helloworl","hello world")
ProperRelativeWeighting7 := StringScore("hello worl","hello world")
ConsecutiveLetterBonus1 := StringScore("Hel","hello world")
ConsecutiveLetterBonus2 := StringScore("Hld","hello world")
AcronymBonus1 := StringScore("HW","Hello World")
AcronymBonus2 := StringScore("Ho","Hello World")
AcronymBonus3 := StringScore("yaHW","yet another Hello World")
AcronymBonus4 := StringScore("yet another","Hello World")
AcronymBonus5 := StringScore("HiMi","Hillsdale Michigan")
AcronymBonus6 := StringScore("Hil","Hillsdale Michigan")
AcronymBonus7 := StringScore("HiMi","Hillsdale Michigan")
AcronymBonus8 := StringScore("illsda","Hillsdale Michigan")
AcronymBonus9 := StringScore("HiMi","Hillsdale Michigan")
AcronymBonus10 := StringScore("hills","Hillsdale Michigan")
AcronymBonus11 := StringScore("HiMi","Hillsdale Michigan")
AcronymBonus12 := StringScore("hillsd","Hillsdale Michigan")
BeginningOfStringBonus1  := StringScore("hi","Hillsdale")
BeginningOfStringBonus2  := StringScore("hi","Chippewa")
BeginningOfStringBonus3  := StringScore("h","hello world")
BeginningOfStringBonus4  := StringScore("w","hello world")
ProperStringWeights1 := StringScore("res","Research Resources North")
ProperStringWeights2 := StringScore("res","Mary Conces")
ProperStringWeights3 := StringScore("res","Research Resources North")
ProperStringWeights4 := StringScore("res","Bonnie Strathern - Southwest Michigan Title Search")
StartofStringBonus1 := StringScore("mar","Mary Large")
StartofStringBonus2 := StringScore("mar","Large Mary")
StartofStringBonus3 := StringScore("mar","Silly Mary Large")
StartofStringBonus4 := StringScore("mar","Silly Large Mary")

; Benchmark 4000 iteration of 446 Characters with 70 Character Match
StartTime := A_TickCount
Loop, 4000
{
thescore := StringScore("CBC","Complete Blood Count")
}
TotalTime := A_TickCount - StartTime



msgbox Exact Match:`t%ExactMatch% `nNot Matching:`t%NotMatch%`nMust be sequential:`t%MustBeSequential%`nSame Case Better:`t%SameCaseBetter1% > %SameCaseBetter2%`nHigher Score For Closer Matches:`t%HigherScoreForCloserMatches1% < %HigherScoreForCloserMatches2%`nMatching With Wrong Case:`t%MatchingWithWrongCase% > 0`n`nProper Relative Weighting`n================`n%ProperRelativeWeighting1%`n%ProperRelativeWeighting2%`n%ProperRelativeWeighting3%`n%ProperRelativeWeighting4%`n%ProperRelativeWeighting5%`n%ProperRelativeWeighting6%`n%ProperRelativeWeighting7%`n`nConsecutive Letter Bonus:`t%ConsecutiveLetterBonus1% > %ConsecutiveLetterBonus2%`n`nAcronym Bonus`n================`n%AcronymBonus1% > %AcronymBonus2%`n%AcronymBonus3% > %AcronymBonus4%`n%AcronymBonus5% > %AcronymBonus6%`n%AcronymBonus7% > %AcronymBonus8%`n%AcronymBonus9% > %AcronymBonus10%`n%AcronymBonus11% > %AcronymBonus12%`n`nBeginning of String Bonus`n================`n%BeginningOfStringBonus1% > %BeginningOfStringBonus2%`n%BeginningOfStringBonus3% > %BeginningOfStringBonus4%`n`nProper String Weighting Bonus`n================`n%ProperStringWeights1% > %ProperStringWeights2%`n%ProperStringWeights3% > %ProperStringWeights4%`n`nStart of String Bonus`n================`n%StartofStringBonus1% > %StartofStringBonus2%`n%StartofStringBonus3% = %StartofStringBonus4%`n`n4000 Searching for CBC:`t%TotalTime% milliseconds

}

/*
 * Based on string_score.js. Ported by Jonathan Ploudre
 * October 2013
 * --------------------
 * 
 * string_score.js: String Scoring Algorithm 0.1.10 
 *
 * http://joshaven.com/string_score
 * https://github.com/joshaven/string_score
 *
 * Copyright (C) 2009-2011 Joshaven Potter <yourtech@gmail.com>
 * Special thanks to all of the contributors listed here https://github.com/joshaven/string_score
 * MIT license: http://www.opensource.org/licenses/mit-license.php
 *
 * Date: Tue Mar 1 2011
 * Updated: Tue Jun 11 2013
*/

/**
 * Scores a string against another string.
 *  'Hello World'.score('he');     //=> 0.5931818181818181
 *  'Hello World'.score('Hello');  //=> 0.7318181818181818
 */
 
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

		StringMid, wordcharacter, lWord, %A_Index%, 1
		StringGetPos, idxOf, lstring, %wordcharacter%, , startAt
		StringMid, previousstringcharacter, lstring, idxOf - 1, 1
		; Might also want to match previous character of tab or hyphen
		if (previousstringcharacter = " ")
		charScore += 0.8
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
		
		if (Errorlevel = 1)
		return 0
		
		if (startAt = idxOf)
		{
		charScore = 0.7
      	} 
      	else 
		{
        charScore = 0.1
		
		StringMid, previousstringcharacter, lstring, idxOf, 1
		if (previousstringcharacter = " ")
		charScore += 0.8
		}
		
		StringMid, wordcasecharacter, word, idxOf, 1
		StringMid, stringcasecharacter, line, idxOf, 1
		if (wordcasecharacter == stringcasecharacter)
		charScore += 0.1
		
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