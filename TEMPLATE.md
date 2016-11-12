##Want to write your own template?

#Variables
At the moment the engine support the following keyword `var, func, data, cond, int`

The engine also support following variables `[int], [smallint]`.

This mean that everytime one of these keyword is found it will be replace with random value.

```
Function func1(var1 As String) As String
  Dim var2 As String
  Dim int1 As Integer
  int1 = [smallint1]
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

#Parsing instructions
To tell the parser to encode a string use the following pattern `{[your data]}`. The string will be encoded using the offset defined by `encodingoffset` in the JSON config file.

If you are using keyword that are not supported by the parser add the following line `[use:varname]` at the beginning of your VBA code.

#User defined variables
Want to add specific variable like a URL. Simply define it in the template like this `[URL]`

```
[use:myfunction]

Function myfunction(var1 As String) As String
  Dim var2 As String
  Dim int1 As String
  int1 = [smallint1]
  var2 = "[URL]"
  If (var2 = var1) Then
    myfunction = "cond1"
  End If
End Function
```

Once it will be parsed by the Python script the variable will be replace by the value defined in the config file

```
"encodedvars":  {
                "URL": "https://ringzer0team.com"
                },
```
