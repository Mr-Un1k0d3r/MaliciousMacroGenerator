[use:func_evasion_domain]
[use:func_evasion_main_domain]
[use:func_evasion_env]
[use:func_evasion_dom_wrapper]

Function func_evasion_domain() As String
	Dim func_evasion_domain1 As String
	func_evasion_domain1 = "data1"
	func_evasion_domain1 = func_evasion_env(func_evasion_domain1)
	func_evasion_domain1 = func_evasion_main_domain(func_evasion_domain1)
	func_evasion_domain = func_evasion_domain1
End Function

Function func_evasion_main_domain(func_evasion_domain1 As String) As String
    Dim func_evasion_domain2 As String
    Dim func_evasion_domain3 As String
    Dim func_evasion_domain4 As String
    Dim func_evasion_domain5 As Integer
    func_evasion_domain5 = [int100]
    func_evasion_domain3 = "decode"
    func_evasion_domain4 = "[DOMAIN]"
    func_evasion_domain3 = func_evasion_dom_wrapper(func_evasion_domain3, func_evasion_domain4, func_evasion_domain5)
    func_evasion_domain2 = func_evasion_domain3
    If (UCase(func_evasion_domain1) = func_evasion_domain2) Then
        func_evasion_main_domain = "bool1"
    Else
        func_evasion_main_domain = "bool2"
    End If
End Function

Function func_evasion_env(func_evasion_env1 As String) As String
    Dim func_evasion_env2 As String
	Dim func_evasion_env3 As String
	Dim func_evasion_env4 As Integer
	func_evasion_env4 = [int101]
	func_evasion_env3 = "decode"
	func_evasion_env3 = func_evasion_dom_wrapper(func_evasion_env3, "{[USERDOMAIN]}", func_evasion_env4)
    func_evasion_env2 = Environ(func_evasion_env3)
    func_evasion_env = func_evasion_env2
End Function

Function func_evasion_dom_wrapper(func_evasion_dom_wrapper1 As String, func_evasion_dom_wrapper2 As String, func_evasion_dom_wrapper3 As Integer) As String
    If (func_evasion_dom_wrapper3 > 1) Then
        func_evasion_dom_wrapper = Application.Run(func_evasion_dom_wrapper1, func_evasion_dom_wrapper2)
    End If
End Function
