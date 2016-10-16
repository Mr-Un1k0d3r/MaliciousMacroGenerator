[use:decode]

Function decode(decode1 As String) As String
	Dim decode2 As Long
	Dim decode3 As String
	Dim decode4 As Integer
	decode4 = [offset]
	For decode2 = 1 To Len(decode1)
		decode3 = decode3 & Chr(Asc(Mid(decode1, decode2, 1)) - decode4)
	Next decode2
	decode = decode3
End Function