# Pfad zur vorhandenen Excel-Datei angeben
$excelDatei = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-10\Hashing\paswoerter.xlsx"

# Benutzereingabe für Daten
$csvString = Read-Host "Geben Sie die Daten im CSV-Format ein (z.B. Name,Alter,Stadt;Name2,Alter2,Stadt2):"

# Excel-Anwendung starten
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# Arbeitsmappe öffnen
$arbeitsmappe = $excel.Workbooks.Open($excelDatei)

# Arbeitsblatt auswählen (hier wird das erste Blatt verwendet)
$arbeitsblatt = $arbeitsmappe.Worksheets.Item(1)

# PowerShell-Objekt aus dem CSV-String erstellen
$csvObjekt = $csvString | ConvertFrom-Csv -Delimiter ','

# Zeile, ab der Daten eingefügt werden sollen (hier wird die nächste leere Zeile verwendet)
$zeile = $arbeitsblatt.UsedRange.Rows.Count + 1

# Daten in Excel-Tabelle einfügen
foreach ($eintrag in $csvObjekt) {
    $spalte = 1
    foreach ($feld in $eintrag.PSObject.Properties) {
        $arbeitsblatt.Cells.Item($zeile, $spalte) = $feld.Value
        $spalte++
    }
    $zeile++
}

# Excel-Datei speichern
$arbeitsmappe.Save()

# Excel-Anwendung beenden
$excel.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
