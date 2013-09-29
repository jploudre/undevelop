/*
 * Based on string_score.js. Ported by Jonathan Ploudre
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
    counter = 0

    if (fuzziness) {
        while (counter < wordLength)
        {
		; Find next first case-insensitive match of a character.
		
		
		; Consecutive letter & start-of-string Bonus
		
		
		; Acronym Bonus
        ; Weighing Logic: Typing the first character of an acronym is as if you
        ; preceded it with two perfect character matches.
		
		; Same case bonus.
		
		
		; Update scores and startAt position for next round of indexOf
		
        counter ++
        }
    }
    else {
        while (counter < wordLength)
        {
    
        counter ++
        }
    }
    
	; Reduce penalty for longer strings.
	
	
	
	return finalScore
}