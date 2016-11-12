[use:password_protect]

Function password_protect(password_protect1 As String) As String
	Dim password_protect2 As String
	password_protect2 = "data1"
	ActiveDocument.Password = decode(password_protect2)
	password_protect2 = "data2"
	ActiveDocument.Save
	password_protect = password_protect2
End Function