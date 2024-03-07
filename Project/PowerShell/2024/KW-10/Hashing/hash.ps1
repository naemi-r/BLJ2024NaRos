# Pfad zur vorhandenen Excel-Datei angeben
$excelDatei = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-10\Hashing\paswoerter.xlsx"

# Benutzereingabe für den Namen
$benutzerName = Read-Host "Geben Sie einen Namen ein"
$benutzerPasswort = Read-Host "Geben sie ein Passwort ein"

# Excel-Anwendung starten
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# Arbeitsmappe öffnen
$arbeitsmappe = $excel.Workbooks.Open($excelDatei)

# Aktives Arbeitsblatt auswählen
$arbeitsblatt = $arbeitsmappe.ActiveSheet

# Zeile, ab der Daten eingefügt werden sollen (hier wird die nächste leere Zeile verwendet)
$zeile = $arbeitsblatt.UsedRange.Rows.Count + 1

# Daten in Excel-Tabelle einfügen
$arbeitsblatt.Cells.Item($zeile, 1) = $benutzerName
$arbeitsblatt.Cells.Item($zeile, 1) = $benutzerPasswort

# Excel-Datei speichern
$arbeitsmappe.Save()

# Excel-Anwendung beenden
$arbeitsmappe.Close()
$excel.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($arbeitsmappe) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
