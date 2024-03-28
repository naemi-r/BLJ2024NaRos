Add-Type -AssemblyName System.Windows.Forms

# Erstellen Sie ein neues Formularobjekt
$form = New-Object System.Windows.Forms.Form
$form.Text = "ADUserSimplified"
$form.Size = New-Object System.Drawing.Size(800, 500) # Setzen Sie die Größe des Formulars

# Erstellen Sie ein Labelobjekt
$label = New-Object System.Windows.Forms.Label
$label.Text = "Welcome to the GUI Add a User"
$label.AutoSize = $true
$label.Font = New-Object System.Drawing.Font("Arial", 16) # Hier setzen Sie die Schriftgröße
$label.Location = New-Object System.Drawing.Point(15,10)
$form.Controls.Add($label)  # Fügen Sie das Label zum Formular hinzu

# Label und Textfeld für den Vornamen
$labelFirstName = New-Object System.Windows.Forms.Label
$labelFirstName.Text = "Vorname:"
$labelFirstName.Location = New-Object System.Drawing.Point(20, 40)
$form.Controls.Add($labelFirstName)  # Fügen Sie das Label für den Vornamen zum Formular hinzu

$textBoxFirstName = New-Object System.Windows.Forms.TextBox
$textBoxFirstName.Location = New-Object System.Drawing.Point(120, 40)
$textBoxFirstName.Size = New-Object System.Drawing.Size(200, 20)
$textBoxFirstName.Text = ""
$form.Controls.Add($textBoxFirstName)  # Fügen Sie das Textfeld für den Vornamen zum Formular hinzu

# Ereignishandler für Textänderungen im Vornamefeld
$textBoxFirstName.add_TextChanged
({
    UpdateEmail
    UpdateUsername
})

# Label und Textfeld für den Nachnamen
$labelLastName = New-Object System.Windows.Forms.Label
$labelLastName.Text = "Nachname:"
$labelLastName.Location = New-Object System.Drawing.Point(20, 70)
$form.Controls.Add($labelLastName)  # Fügen Sie das Label für den Nachnamen zum Formular hinzu

$textBoxLastName = New-Object System.Windows.Forms.TextBox
$textBoxLastName.Location = New-Object System.Drawing.Point(120, 70)
$textBoxLastName.Size = New-Object System.Drawing.Size(200, 20)
$textBoxLastName.Text = ""
$form.Controls.Add($textBoxLastName)  # Fügen Sie das Textfeld für den Nachnamen zum Formular hinzu

# Ereignishandler für Textänderungen im Nachnamefeld
$textBoxLastName.add_TextChanged
({
    UpdateEmail
    UpdateUsername
})

$labelDescription = New-Object System.Windows.Forms.Label
$labelDescription.Text = "Description:"
$labelDescription.Location = New-Object System.Drawing.Point(20, 100)
$form.Controls.Add($labelDescription)  # Fügen Sie das Label für den Description zum Formular hinzu

$textBoxDescription = New-Object System.Windows.Forms.TextBox
$textBoxDescription.Location = New-Object System.Drawing.Point(120, 100)
$textBoxDescription.Size = New-Object System.Drawing.Size(200, 20)
$labelDescription.Text = ""
$form.Controls.Add($textBoxDescription)  # Fügen Sie das Textfeld für den Description zum Formular hinzu
$textBoxDescription.add_TextChanged
({
    UpdateEmail
    UpdateUsername
})

$labelOffice = New-Object System.Windows.Forms.Label
$labelOffice.Text = "Office:"
$labelOffice.Location = New-Object System.Drawing.Point(20, 130)
$form.Controls.Add($labelOffice)  # Fügen Sie das Label für den Office zum Formular hinzu

$textBoxOffice = New-Object System.Windows.Forms.TextBox
$textBoxOffice.Location = New-Object System.Drawing.Point(120, 130)
$textBoxOffice.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxOffice)  # Fügen Sie das Textfeld für den Office zum Formular hinzu

$labelPhonenumber = New-Object System.Windows.Forms.Label
$labelPhonenumber.Text = "Telefonnummer:"
$labelPhonenumber.Location = New-Object System.Drawing.Point(20, 160)
$form.Controls.Add($labelPhonenumber)  # Fügen Sie das Label für den Telefonnummer zum Formular hinzu

$textBoxPhonenumber = New-Object System.Windows.Forms.TextBox
$textBoxPhonenumber.Location = New-Object System.Drawing.Point(120, 160)
$textBoxPhonenumber.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxPhonenumber)  # Fügen Sie das Textfeld für den Telefonnummer zum Formular hinzu

$labelJobTitel = New-Object System.Windows.Forms.Label
$labelJobTitel.Text = "Job Titel:"
$labelJobTitel.Location = New-Object System.Drawing.Point(20, 190)
$form.Controls.Add($labelJobTitel)  # Fügen Sie das Label für den Job Titel zum Formular hinzu

$textBoxJobTitel = New-Object System.Windows.Forms.TextBox
$textBoxJobTitel.Location = New-Object System.Drawing.Point(120, 190)
$textBoxJobTitel.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxJobTitel)  # Fügen Sie das Textfeld für den Job Titel zum Formular hinzu

$labelStreet = New-Object System.Windows.Forms.Label
$labelStreet.Text = "Strasse:"
$labelStreet.Location = New-Object System.Drawing.Point(20, 220)
$form.Controls.Add($labelStreet)  # Fügen Sie das Label für den Strasse zum Formular hinzu

$textBoxStreet = New-Object System.Windows.Forms.TextBox
$textBoxStreet.Location = New-Object System.Drawing.Point(120, 220)
$textBoxStreet.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxStreet)  # Fügen Sie das Textfeld für den Strasse zum Formular hinzu

$labelPLZ = New-Object System.Windows.Forms.Label
$labelPLZ.Text = "PLZ:"
$labelPLZ.Location = New-Object System.Drawing.Point(20, 250)
$form.Controls.Add($labelPLZ)  # Fügen Sie das Label für den PLZ zum Formular hinzu

$textBoxPLZ = New-Object System.Windows.Forms.TextBox
$textBoxPLZ.Location = New-Object System.Drawing.Point(120, 250)
$textBoxPLZ.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxPLZ)  # Fügen Sie das Textfeld für den PLZ zum Formular hinzu

$labelPlace = New-Object System.Windows.Forms.Label
$labelPlace.Text = "Wohnort:"
$labelPlace.Location = New-Object System.Drawing.Point(20, 280)
$form.Controls.Add($labelPlace)  # Fügen Sie das Label für den Wohnort zum Formular hinzu

$textBoxPlace = New-Object System.Windows.Forms.TextBox
$textBoxPlace.Location = New-Object System.Drawing.Point(120, 280)
$textBoxPlace.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxPlace)  # Fügen Sie das Textfeld für den Wohnort zum Formular hinzu

# Funktion zur Aktualisierung der E-Mail-Adresse
function UpdateEmail
{
    $textBoxEMail.Text = $textBoxFirstName.Text + "." + $textBoxLastName.Text + "@noseryoung.com"
}

# Funktion zur Aktualisierung des Benutzernamens
function UpdateUsername
{
    $textBoxUsername.Text = $textBoxFirstName.Text + "." + $textBoxLastName.Text
}

# Label und Textfeld für die E-Mail-Adresse
$labelEMail = New-Object System.Windows.Forms.Label
$labelEMail.Text = "E-Mail:"
$labelEMail.Location = New-Object System.Drawing.Point(20, 310)
$form.Controls.Add($labelEMail)  # Fügen Sie das Label für den E-Mail zum Formular hinzu

$textBoxEMail = New-Object System.Windows.Forms.TextBox
$textBoxEMail.Location = New-Object System.Drawing.Point(120, 310)
$textBoxEMail.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxEMail)  # Fügen Sie das Textfeld für den E-Mail zum Formular hinzu

# Label und Textfeld für den Benutzernamen
$labelUsername = New-Object System.Windows.Forms.Label
$labelUsername.Text = "Benutzername:"
$labelUsername.Location = New-Object System.Drawing.Point(20, 340)
$form.Controls.Add($labelUsername)  # Fügen Sie das Label für den Benutzername zum Formular hinzu

$textBoxUsername = New-Object System.Windows.Forms.TextBox
$textBoxUsername.Location = New-Object System.Drawing.Point(120, 340)
$textBoxUsername.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxUsername)  # Fügen Sie das Textfeld für den Benutzername zum Formular hinzu

$labelPath = New-Object System.Windows.Forms.Label
$labelPath.Text = "Pfad:"
$labelPath.Location = New-Object System.Drawing.Point(20, 370)
$form.Controls.Add($labelPath)  # Fügen Sie das Label für den Wohnort zum Formular hinzu

$textBoxPath = New-Object System.Windows.Forms.TextBox
$textBoxPath.Location = New-Object System.Drawing.Point(120, 370)
$textBoxPath.Size = New-Object System.Drawing.Size(200, 20)
$textBoxPath.Text = ""
$form.Controls.Add($textBoxPath)  # Fügen Sie das Textfeld für den Wohnort zum Formular hinzu

# Funktion zum Überprüfen des Pfads und Lesen der CSV-Datei
function Read-CSVFile
{
    param
    (
        [string]$Path
    )
    
    if (Test-Path $Path -PathType Leaf)
    {
        try
        {
            $csvContent = Import-Csv -Path $Path
            # Hier können Sie mit $csvContent weiterarbeiten, z. B. Daten anzeigen
            Write-Host "CSV-Datei erfolgreich eingelesen."
            return $csvContent
        }
        catch
        {
            Write-Host "Fehler beim Lesen der CSV-Datei: $_" -ForegroundColor Red
            return $null
        }
    }
    else
    {
        Write-Host "Der angegebene Pfad ist ungültig oder die Datei existiert nicht." -ForegroundColor Yellow
        return $null
    }
}

# Event Handler für eine Aktion, die den Pfad überprüft und die CSV-Datei liest
$textBoxPath.Add_TextChanged
({
    $path = $textBoxPath.Text
    if ($path -ne "")
    {
        $csvData = Read-CSVFile -Path $path
        # Hier können Sie mit den Daten weiterarbeiten, z. B. Anzeigen in einem DataGridView
    }
})

# Beispiel für das Hinzufügen einer DataGridView zur Anzeige der CSV-Daten
$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Location = New-Object System.Drawing.Point(20, 400)
$dataGridView.Size = New-Object System.Drawing.Size(300, 150)
$form.Controls.Add($dataGridView)

# Anzeige des Formulars
$form.ShowDialog()

# Erstellen Sie einen Button
$button = New-Object System.Windows.Forms.Button
$button.Text = "Create"
$button.Location = New-Object System.Drawing.Point(20, 400)
$form.Controls.Add($button)

$button.Add_Click
({
    # Existing CSV file path
    $csvFilePath = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-13\Users.csv"
    
    # New data to append
    $newRow = [PSCustomObject]
    @{
        Vorname = $textBoxFirstName.Text
        Nachname = $textBoxLastName.Text
        Beschreibung = $labeldescription.Text
        EMail = $textBoxEMail.Text
        Benutzername = $textBoxUsername.Text
    }
    
    # Export the new row to the CSV file
    $newRow | Export-Csv -Path $csvFilePath -NoTypeInformation -Append

    # Close the form
    $form.Close()
})

# Erstellen Sie einen Cancel-Button
$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Text = "Cancel"
$buttonCancel.Location = New-Object System.Drawing.Point(110, 400)
$form.Controls.Add($buttonCancel)

$buttonCancel.Add_Click
({
    # Close the form
    $form.Close()
})

$form.ShowDialog() | Out-Null