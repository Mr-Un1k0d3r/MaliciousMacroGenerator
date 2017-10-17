[use:func_evasion_uptime]

Function func_evasion_uptime(func_evasion_uptime5 As Long) As String
	On Error Resume Next
	Dim func_evasion_uptime1 As Object
	Dim func_evasion_uptime2 As Object
	Dim func_evasion_uptime10 As Object

	Dim func_evasion_uptime4 As Long
	Dim func_evasion_uptime6 As String
	Set func_evasion_uptime1 = GetObject(decode("{[winmgmts:\\.\root\cimv2]}"))
	Set func_evasion_uptime2 = func_evasion_uptime1.ExecQuery(decode("{[SELECT LastBootUpTime FROM Win32_OperatingSystem]}"))
	Set func_evasion_uptime10 = CreateObject(decode("{[WbemScripting.SWbemDateTime]}"))
	For Each func_evasion_uptime3 In func_evasion_uptime2
		func_evasion_uptime10.Value = func_evasion_uptime3.LastBootUpTime
		func_evasion_uptime9 = DateDiff("s", "1/1/1970", Now())
		func_evasion_uptime8 = DateDiff("s", "1/1/1970", func_evasion_uptime10.GetVarDate)
		func_evasion_uptime4 = (func_evasion_uptime9 - func_evasion_uptime8)
	Next

	If (func_evasion_uptime4 > func_evasion_uptime5) Then
		func_evasion_uptime6 = "bool1"
	Else
		func_evasion_uptime6 = "bool2"
	End If
    func_evasion_uptime = func_evasion_uptime6
End Function
