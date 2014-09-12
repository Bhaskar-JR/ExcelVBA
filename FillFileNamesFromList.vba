Sub FillFileNamesFromList()

    'Takes a list of file names without extensions, verifies they exist, then
    '  pastes the file name w/ extension in the result column.
    
    'NOTE: If there are file with the same name but different extension, 
    '  the last extension listed in the array is passed back to the result 
    '  column. In the code below, PDF will override (trump) tif 
    
    Dim FirstRow As Long
    Dim LastRow As Long
    Dim iRow As Long
    Dim iFileType As Long
    Dim FileTypeCnt As Long
    Dim NameCol As Long
    Dim ResultCol As Long
    Dim FileTypes(1 To 5) As String
    Dim SearchFolder As String
    Dim FileName As String
    Dim strLink As String

    FirstRow = 2
    NameCol = 5
    ResultCol = 18
    
    'Find the last row in the NameCol
    LastRow = FindLastRow(NameCol)
    
    SearchFolder = "V:\Corporate\Tax\Private\Indirect Tax\Projects\Axip - Audit - TX - 2010 to 2013-02\Expenses\OH\Invoices\"

    'Defines the file type to search for.
    FileTypes(1) = "tif"
    FileTypes(2) = "pdf"
    FileTypes(3) = ""
    FileTypes(4) = ""
    FileTypes(5) = ""


    For iRow = FirstRow To LastRow
        FileName = Cells(iRow, NameCol)
            
        For iFileType = LBound(FileTypes) To UBound(FileTypes)
            If FileTypes(iFileType) <> "" Then
                
                If FileExist(SearchFolder, FileName, FileTypes(iFileType)) Then
                    
                    'Uncomment to put filename in the result cell
                    'Cells(iRow, ResultCol) = FileName & "." & FileTypes(iFileType)
                        
                    'Uncomment and modify as needed to add file hyperlink
                    strLink = "=HyperLink(" & Chr(34) & "Invoices\" & _
                        FileName & "." & FileTypes(iFileType) & Chr(34) & ")"
                    
                    Cells(iRow, ResultCol + 1).Formula = strLink
                    
                End If
            
            End If
        Next
    Next

End Sub
