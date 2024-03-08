$user = Read-Host "1 for Sign up"

if ($user -eq 1) {
    $createusername = Read-Host "Create username"
    $createPassword = Read-Host "Create password"
    
    # Erstelle einen MemoryStream aus dem Passwort
    $mystream = [IO.MemoryStream]::new([System.Text.Encoding]::UTF8.GetBytes($createPassword))
    
    # Berechne den Hash des Passworts
    $hash = Get-FileHash -InputStream $mystream -Algorithm SHA256
    
    Write-Host "Account created for user: $createusername with password hash: $($hash.Hash)"
    
    # Existing CSV file path
    $csvFilePath = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-10\Hashing\DB.csv"
    
    # New data to append
    $newRow = [PSCustomObject]@{user=$createusername; hash=$hash.Hash;} # Änderung hier
    
    # Import existing data
    $existingData = Import-Csv -Path $csvFilePath
    
    # Add the new row to the existing data
    $existingData += $newRow
    
    # Export the updated data back to the CSV file
    $existingData | Export-Csv -Path $csvFilePath -NoTypeInformation

} else {
    $username = Read-Host "Error"
    
    # Hier würden Sie den Passworthash des eingegebenen Passworts mit dem gespeicherten Hash vergleichen
    # und entsprechende Aktionen durchführen.
}
