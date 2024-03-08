# Pfad zur vorhandenen Excel-Datei
$excelDatei = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-10\Hashing\soso.xlsx"

# Strings, die exportiert werden sollen (hier als Beispiel)
$strings = "String1", "String2", "String3"

# Erstellt eine Excel-Anwendung
$excel = New-Object -ComObject Excel.Application

# Excel-Tabelle öffnen oder erstellen
if (Test-Path $excelDatei) {
    $workbook = $excel.Workbooks.Open($excelDatei, 0, $true)  # Der dritte Parameter ($true) öffnet das Workbook im schreibgeschützten Modus
} else {
    $workbook = $excel.Workbooks.Add()
}

# Arbeitsblatt auswählen (hier als Beispiel das erste Blatt)
$worksheet = $workbook.Worksheets.Item(1)

# Zähler für die Zeile
$row = $worksheet.UsedRange.Rows.Count + 1

# Neue Strings in neue Zeilen einfügen
foreach ($string in $strings) {
    # String in die Zelle schreiben
    $worksheet.Cells.Item($row, 1) = $string

    # Zähler für die Zeile erhöhen
    $row++
}

# Excel-Tabelle speichern und schließen
$workbook.SaveAs($excelDatei)
$workbook.Close()
$excel.Quit()

# Aufräumen der COM-Objekte
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet)
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook)
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel)
