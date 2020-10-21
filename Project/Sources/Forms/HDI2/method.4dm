C_LONGINT:C283($page)
C_BOOLEAN:C305($result)
C_OBJECT:C1216($tempEs)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.trace:=False:C215
		OBJECT SET VISIBLE:C603(*; "btnTrace"; False:C215)
		
		Form:C1466.select:=False:C215
		Form:C1466.query:=True:C214
		Form:C1466.criteria:=""
		
		Form:C1466.people:=ds:C1482.people.all()
		
	: (Form event code:C388=On Page Change:K2:54)
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		If (Form:C1466.criteria#"")
			
			Case of 
					
				: (Form:C1466.select)
					
					$tempEs:=ds:C1482.people.query("firstname = :1 or lastname = :1 or zipcode = :1 or city = :1 or state = :1"; Form:C1466.criteria+"@")
					LISTBOX SELECT ROWS:C1715(*; "LB"; $tempEs; lk replace selection:K53:1)
					
					
				: (Form:C1466.query)
					
					Form:C1466.people:=ds:C1482.people.query("firstname = :1 or lastname = :1 or zipcode = :1 or city = :1 or state = :1"; Form:C1466.criteria+"@")
					
			End case 
			
			//Form.criteria:=""
			
		Else 
		End if 
		
End case 

