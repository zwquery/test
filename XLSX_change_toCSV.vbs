'This VBS has been written to apply some changes to all .XLSX files of current folder :
'
'1' Open next .XLSX
'2' Delete 22 lines
'3' Move entire column (data)
'4' Copy all data from one to another column
'5' Put everything from this column to lowercase
'6' Change titles
'7' Put arbirary value at specific location
'8' Save it as CSV file
'9' back to '1' if other .XLSX file...
'



Sub Saver(FileNamo)
Dim DTAddress As String
Dim FileName As String
Dim FullyQualifiedFileName As String
Application.Workbooks(FileNamo).Activate
'
'get the path to the User's Desktop
'
DTAddress = CreateObject("WScript.Shell").SpecialFolders("Desktop") & Application.PathSeparator
'
'build the Workbook name to save as CSV format
'
'FileName = ThisWorkbook.Name
FileName = FileNamo
FileName = Left(FileName, InStr(FileName, ".")) & "csv"
'
'build the fully-qualified workbook "save" path
'
FullyQualifiedFileName = DTAddress & FileName
'
'switch off all application alerts before saving (in case the file already exists etc)
'
Application.DisplayAlerts = False
'
'save the current active sheet as a CSV file to the user's Desktop
'
Application.Workbooks(FileNamo).SaveAs FileName:=FullyQualifiedFileName, FileFormat:=xlCSV
'
'pop-up an info dialogue box to confirm where the file has been saved to
'
'Answer = MsgBox(FileName & Chr(13) & Chr(13) & "Click OK To Close This Workbook", _
'vbOKOnly + vbInformation, "This File Has Been Saved to Your Desktop")
'
'close the original workbook without saving changes
'
Application.Workbooks(FileName).Close savechanges:=False
'
'switch all application alerts back on before exiting
'
Application.DisplayAlerts = True
End Sub



'E3 to 2
Sub E_To_d()
    Cells(3, 5) = "2"
End Sub




'add titles
Sub Set_Titles()
    Cells(1, 1) = "Col1"
    Cells(1, 2) = "Col2"
    Cells(1, 3) = "Col3"
    Cells(1, 4) = "Col4"
    Cells(1, 5) = "Col15"
End Sub



Sub Lowercase()
   ' Loop to cycle through each cell in the specified range.
   For Each x In Range("C1:C4000")
      ' Change the text in the range to uppercase letters.
      x.Value = LCase(x.Value)
   Next
End Sub




'copy data from 2 to 3
Sub Copy_lacs()
    Columns(2).Copy Columns(3)
End Sub



'move 2d
Sub Move_To()
    Columns(1).Cut Range("B1")
End Sub


'delete first columns
Sub Del_first()
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
    Rows(1).EntireRow.Delete
End Sub



Sub BigRun()
Pathname = "START_FOLDER (HARDCODED)"
FileNamo = Dir(Pathname & "*.xlsx")
Do While FileNamo <> ""
Workbooks.Open Pathname & FileNamo
Del_first
Move_To
Copy_lacs
Lowercase
Set_Titles
E_To_d
Saver (FileNamo)
FileNamo = Dir()
Loop
End Sub
