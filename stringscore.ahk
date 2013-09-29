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
    if( word = "") 
        return 0
    
    runningScore = 0
    ; charScore
    ; finalScore
    StringLower, lString, line
    strLength = strlen (abbreviation)
    StringLower, lWord, word
    wordLength = strlen (word)
    ; idxOf
    startAt = 0
    fuzzies = 1
    ; fuzzyFactor
  
    ; Cache fuzzyFactor for speed increase
    if (fuzziness)
    fuzzyFactor = 1 - fuzziness

    ; Walk through word and add up scores.
    ; Code duplication occurs to prevent checking fuzziness inside for loop

    if (fuzziness) {
        while (%A_Index% <= wordLength)
        {
		; Find next first case-insensitive match of a character.
		; AHK StringMid counts from 1; StringGetPos counts from 0
		StringMid, wordcharacter, lWord, %A_Index%, 1
		StringGetPos, indxOf, lstring, wordcharacter, , startAt

		if (Errorlevel = 1)
		{
		fuzzies += fuzzyFactor ; for mispelling
		
		}
		if (startAt = indxOf {
		; Consecutive letter & start-of-string Bonus
		charScore = 0.7
      	} 
      	else {
        charScore = 0.1
		
		; Acronym Bonus
        ; Weighing Logic: Typing the first character of an acronym is as if you
        ; preceded it with two perfect character matches.
        
		StringMid, previousstringcharacter, lstring, indxOf - 1, 1
		; For my use, might also want to match previous character of tab or hyphen
		if (previousstringcharacter = ' ')
		charScore += 0.8
		}
		
		; Same case bonus.
		StringMid, wordcasecharacter, word, indxOf, 1
		StringMid, stringcasecharacter, line, indxOf, 1
		if (wordcasecharacter = stringcasecharacter)
		charScore += 0.1
		
		
		; Update scores and startAt position for next round of indexOf
		runningScore += charScore;
      	startAt = idxOf + 1;
        }
    }
    else {
        while (%A_Index% <= wordLength )
        {
		StringMid, wordcharacter, lWord, %A_Index%, 1
		StringGetPos, indxOf, lstring, wordcharacter, , startAt

		if (Errorlevel = 1)
		return 0
		
		if (startAt = indxOf {
		charScore = 0.7
      	} 
      	else {
        charScore = 0.1
		
		StringMid, previousstringcharacter, lstring, indxOf - 1, 1
		if (previousstringcharacter = ' ')
		charScore += 0.8
		}
		
		StringMid, wordcasecharacter, word, indxOf, 1
		StringMid, stringcasecharacter, line, indxOf, 1
		if (wordcasecharacter = stringcasecharacter)
		charScore += 0.1
		
		runningScore += charScore;
      	startAt = idxOf + 1;
		
        }
    }
    
	; Reduce penalty for longer strings.
	finalScore = 0.5 * (runningScore / strLength  + runningScore / wordLength) / fuzzies
	StringMid, firststringcharacter, lstring, 1, 1
	StringMid, firstwordcharacter, lword, 1, 1
	
	if ((firststringcharacter = firstwordcharacter) AND (finalScore < 0.85))
	finalScore += 0.15;
	
	return finalScore
}