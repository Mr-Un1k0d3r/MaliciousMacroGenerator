##Want to write your own template?

#Variables
At the moment the engine support the following keyword `"var", "func", "data", "cond", "int", "[INT]", "[SMALLINT]"`.

This mean that everytime one of these keyword is found it will be replace with random value.

```
Function func1(var1 As String) As String
  Dim var2 As String
  Dim int1 As String
  int1 = [SMALLINT]
  If (var2 = var1) Then
    func1 = "cond1"
  End If
End Function
```

Will become

```
Function groJeU(JToaRdHxMcE0 As String) As String
  Dim CoVSEHgccgKzTV0 As String
	Dim BsviMcpRUPErzxVJ As Integer
	BsviMcpRUPErzxVJ = 4
	If (CoVSEHgccgKzTV0 = JToaRdHxMcE0) Then
	  groJeU = "mrkOOiQriGHJrABNJXf"
	End If
End Function
```

#User defined variables
Want to add specific variable like a URL. Simply define it in the template like this `[URL]`

```
Function func1(var1 As String) As String
  Dim var2 As String
  Dim int1 As String
  int1 = [SMALLINT]
  var2 = "[URL]"
  If (var2 = var1) Then
    func1 = "cond1"
  End If
End Function
```

Once it will be parsed by the Python script the variable will be replace by the value defined in the config file

```
"encodedvars":  {
                "URL": "https://ringzer0team.com"
                },
```
