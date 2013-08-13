ArrayCount = 0
Loop, Read, %Listname%
{
    ArrayCount += 1  
    Array%ArrayCount% := A_LoopReadLine
}

SetBatchLines -1
windowwidth := 432
#NoEnv

#SingleInstance, Force
Gui, +AlwaysOnTop -Caption +ToolWindow Border
GUI, margin, 0,0
gui, color, 6b7c70, ffffff
gui, font, s18, Tahoma Bold
Gui, Add, ListBox, vChoice gListBoxClick w%windowwidth% x0 Y36 h236 t240 t316 -Background -E0x200
gui, color, 6b7c70, F2efc2
Gui, Add, Edit, x0 y0 w%windowwidth% h36 -E0x200

RefreshList(1,1)

search =   
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
   
    search = %search%%input%  
    GuiControl,, Edit1, %search%            
	RefreshList(0,0)
}
return

; Functions.#######################################################
GuiClose:
GuiEscape:
   ExitApp
   
RefreshList(animate, small){
Critical
global windowwidth
global ArrayCount
global search

If (small = 0)
{
	resultnum := 0, Wordlist :=""
	Loop, %ArrayCount%
	{
	   IfInString, Array%A_Index% , %Search%      
	   {
		  resultnum++
		  line := Array%A_Index%
		  Wordlist = %Wordlist% | %line%
		  if (resultnum >7)
		  Break
	}
	   Else
		  continue
	}
}

GuiControl,, ListBox1, %wordlist%
GuiControl, Choose, ListBox1, 1

If (animate = 1) {
	Gui +LastFound
	GUI_ID:=WinExist() 
	Gui, Show, xCenter y10 w%windowwidth% h36 Hide, Plan Autocomplete
	DllCall("AnimateWindow","UInt",GUI_ID,"Int",300,"UInt","0xa0000")
}

else if (small = 1){
	Gui, Show, xCenter y10 w%windowwidth% h36, Plan Autocomplete
}
else if (small = 0) {
	Gui, Show, xCenter y10 w%windowwidth% h268, Plan Autocomplete
}
}

DeleteSearchChar:
if search =
    return
StringTrimRight, search, search, 1
GuiControl,, Edit1, %search%
; make interface small again if empty search term
if search =
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