Function HexToStr(ByVal hexString As String) As String
    Dim counter As Long
    For counter = 1 To Len(hexString) Step 2
    HexToStr = HexToStr & Chr$(Val("&H" & Mid$(hexString, counter, 2)))
    Next counter
End Function
