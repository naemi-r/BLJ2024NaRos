Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "ADUserSimplified"
$form.Size = New-Object System.Drawing.Size(800, 500)

$label = New-Object System.Windows.Forms.Label
$label.Text = "Welcome to the GUI Add a User"
$label.AutoSize = $true
$label.Font = New-Object System.Drawing.Font("Arial", 16)
$label.Location = New-Object System.Drawing.Point(15,10)
$form.Controls.Add($label)

#Vornamen
$labelFirstName = New-Object System.Windows.Forms.Label
$labelFirstName.Text = "Vorname:"
$labelFirstName.Location = New-Object System.Drawing.Point(20, 40)
$form.Controls.Add($labelFirstName)

$textBoxFirstName = New-Object System.Windows.Forms.TextBox
$textBoxFirstName.Location = New-Object System.Drawing.Point(120, 40)
$textBoxFirstName.Size = New-Object System.Drawing.Size(200, 20)
$textBoxfirstname.Text = ""
$form.Controls.Add($textBoxFirstName)

#Vornamefeld
$textBoxfirstname.add_TextChanged({
    UpdateEmail
    UpdateUsername
})

#Nachnamen
$labelLastName = New-Object System.Windows.Forms.Label
$labelLastName.Text = "Nachname:"
$labelLastName.Location = New-Object System.Drawing.Point(20, 70)
$form.Controls.Add($labelLastName)

$textBoxLastName = New-Object System.Windows.Forms.TextBox
$textBoxLastName.Location = New-Object System.Drawing.Point(120, 70)
$textBoxLastName.Size = New-Object System.Drawing.Size(200, 20)
$textBoxlastname.Text = ""
$form.Controls.Add($textBoxLastName)

#Nachnamefeld
$textBoxlastname.add_TextChanged({
    UpdateEmail
    UpdateUsername
})

$labelDescription = New-Object System.Windows.Forms.Label
$labelDescription.Text = "Description:"
$labelDescription.Location = New-Object System.Drawing.Point(20, 100)
$textBoxdescription.Text = ""
$form.Controls.Add($labelDescription)

$textBoxDescription = New-Object System.Windows.Forms.TextBox
$textBoxDescription.Location = New-Object System.Drawing.Point(120, 100)
$textBoxDescription.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxDescription)

$labelOffice = New-Object System.Windows.Forms.Label
$labelOffice.Text = "Office:"
$labelOffice.Location = New-Object System.Drawing.Point(20, 130)
$form.Controls.Add($labelOffice)

$textBoxOffice = New-Object System.Windows.Forms.TextBox
$textBoxOffice.Location = New-Object System.Drawing.Point(120, 130)
$textBoxOffice.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxOffice)

$labelPhonenumber = New-Object System.Windows.Forms.Label
$labelPhonenumber.Text = "Telefonnummer:"
$labelPhonenumber.Location = New-Object System.Drawing.Point(20, 160)
$form.Controls.Add($labelPhonenumber)

$textBoxPhonenumber = New-Object System.Windows.Forms.TextBox
$textBoxPhonenumber.Location = New-Object System.Drawing.Point(120, 160)
$textBoxPhonenumber.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxPhonenumber)

$labelJobTitel = New-Object System.Windows.Forms.Label
$labelJobTitel.Text = "Job Titel:"
$labelJobTitel.Location = New-Object System.Drawing.Point(20, 190)
$form.Controls.Add($labelJobTitel)

$textBoxJobTitel = New-Object System.Windows.Forms.TextBox
$textBoxJobTitel.Location = New-Object System.Drawing.Point(120, 190)
$textBoxJobTitel.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxJobTitel)

$labelStreet = New-Object System.Windows.Forms.Label
$labelStreet.Text = "Strasse:"
$labelStreet.Location = New-Object System.Drawing.Point(20, 220)
$form.Controls.Add($labelStreet)

$textBoxStreet = New-Object System.Windows.Forms.TextBox
$textBoxStreet.Location = New-Object System.Drawing.Point(120, 220)
$textBoxStreet.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxStreet)

$labelPLZ = New-Object System.Windows.Forms.Label
$labelPLZ.Text = "PLZ:"
$labelPLZ.Location = New-Object System.Drawing.Point(20, 250)
$form.Controls.Add($labelPLZ)

$textBoxPLZ = New-Object System.Windows.Forms.TextBox
$textBoxPLZ.Location = New-Object System.Drawing.Point(120, 250)
$textBoxPLZ.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxPLZ)

$labelPlace = New-Object System.Windows.Forms.Label
$labelPlace.Text = "Wohnort:"
$labelPlace.Location = New-Object System.Drawing.Point(20, 280)
$form.Controls.Add($labelPlace)

$textBoxPlace = New-Object System.Windows.Forms.TextBox
$textBoxPlace.Location = New-Object System.Drawing.Point(120, 280)
$textBoxPlace.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($textBoxPlace)

$labelEMail = New-Object System.Windows.Forms.Label
$labelEMail.Text = "E-Mail:"
$labelEMail.Location = New-Object System.Drawing.Point(20, 310)
$form.Controls.Add($labelEMail)

$textBoxEMail = New-Object System.Windows.Forms.TextBox
$textBoxEMail.Location = New-Object System.Drawing.Point(120, 310)
$textBoxEMail.Size = New-Object System.Drawing.Size(200, 20)
$textBoxemail.Text = $textBoxfirstname.Text + "." + $textBoxlastname.Text + "@noseryoung.com"
$form.Controls.Add($textBoxEMail)

$labelUsername = New-Object System.Windows.Forms.Label
$labelUsername.Text = "Benutzername:"
$labelUsername.Location = New-Object System.Drawing.Point(20, 340)
$form.Controls.Add($labelUsername)

$textBoxUsername = New-Object System.Windows.Forms.TextBox
$textBoxUsername.Location = New-Object System.Drawing.Point(120, 340)
$textBoxUsername.Size = New-Object System.Drawing.Size(200, 20)
$textBoxUsername.Text = $textBoxfirstname.Text + "." + $textBoxlastname.Text
$form.Controls.Add($textBoxUsername) 

$button = New-Object System.Windows.Forms.Button
$button.Text = "Create"
$button.Location = New-Object System.Drawing.Point(20, 380)
$form.Controls.Add($button)

$button.Add_Click({
    $csvFilePath = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-13\Users.csv"

    $newRow = [PSCustomObject]@{Vorname=$textBoxfirstname.Text; Nachname=$textBoxlastname.Text}

    $existingData = Import-Csv -Path $csvFilePath

    $newData = $existingData + $newRow
    
    # Exportieren der aktualisierten Daten zurück in die CSV-Datei
    $newData | Export-Csv -Path $csvFilePath -NoTypeInformation

    Cancel-Program
})

$button = New-Object System.Windows.Forms.Button
$button.Text = "Abbrechen"
$button.Location = New-Object System.Drawing.Point(110, 380)
$form.Controls.Add($button)

$button.Add_Click({
    Cancel-Program
})
$form.ShowDialog() | Out-Null
