
var $char : Text
var $charCode : Integer

//C_TEXT(criteria)
C_LONGINT:C283($charCode)


Case of 
		
	: (FORM Event:C1606.code=On Load:K2:1)
		
		Form:C1466.delay:=500//define max delay between two keystrokes (in ms)
		Form:C1466.ms:=Milliseconds:C459
		Form:C1466.memoMs:=0
		Form:C1466.criteria:=""
		
	: (FORM Event:C1606.code=On Before Keystroke:K2:6)
		
		If (Not:C34(Is editing text:C1744))// check not in input mode
			
			//if not lets proceed
			
			Form:C1466.ms:=Milliseconds:C459
			
			$charCode:=Character code:C91(Keystroke:C390)
			Case of 
					
				: ($charCode=127)// suppr
					
				: ($charCode>=28) & ($charCode<=31)// arrows
					
				Else 
					
					If ($charCode=8)// backspace
						
						Form:C1466.criteria:=Substring:C12(Form:C1466.criteria;1;Length:C16(Form:C1466.criteria)-1)
						
					Else 
						
						If ((Form:C1466.ms-Form:C1466.memoMs)>Form:C1466.delay)//very slow typing
							Form:C1466.criteria:=Keystroke:C390// reset the search criteria
						Else // quick typing
							Form:C1466.criteria:=Form:C1466.criteria+Keystroke:C390
						End if 
						
					End if 
					
					//FILTER KEYSTROKE("")
					
					Form:C1466.memoMs:=Form:C1466.ms
					SET TIMER:C645((Form:C1466.delay/1000)*60)// reset the timer on each key and wait for delay
					
			End case 
			
		End if 
		
End case 
