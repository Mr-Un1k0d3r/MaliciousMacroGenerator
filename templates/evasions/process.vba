[use:func_evasion_process_wrapper]
[use:func_evasion_process]
[use:func_evasion_get_process]

Function func_evasion_process() As String
	Dim func_evasion_process1 As String
	Dim func_evasion_process2 As Object
	Dim func_evasion_process3 As Object
	func_evasion_process = "bool2"
	
	Set func_evasion_process2 = GetObject(decode("{[winmgmts:\\.\root\cimv2]}"))
	Set func_evasion_process3 = func_evasion_process2.ExecQuery(decode("{[SELECT Name FROM Win32_Process]}"))
	func_evasion_process1 = "data1"
	func_evasion_process1 = func_evasion_get_process()
	For Each func_evasion_process4 In func_evasion_process3
		If LCase(func_evasion_process4.Name) = func_evasion_process1 Then
			func_evasion_process = "bool1"
		End If
	Next
End Function

Function func_evasion_get_process() As String
	Dim func_evasion_get_process1 As String
	Dim func_evasion_get_process2 As String
	Dim func_evasion_get_process3 As Integer
    	func_evasion_get_process3 = [int100]
	func_evasion_get_process1 = "[PROCESS_NAME]"
	func_evasion_get_process2 = "decode"
	func_evasion_get_process = func_evasion_process_wrapper(func_evasion_get_process2, func_evasion_get_process1, func_evasion_get_process3)
End Function

Function func_evasion_process_wrapper(func_evasion_process_wrapper1 As String, func_evasion_process_wrapper2 As String, func_evasion_process_wrapper3 As Integer) As String
    If (func_evasion_process_wrapper3 > 1) Then
        func_evasion_process_wrapper = Application.Run(func_evasion_process_wrapper1, func_evasion_process_wrapper2)
    End If
End Function
