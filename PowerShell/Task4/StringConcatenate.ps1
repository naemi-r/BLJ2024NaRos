Write-Host "Welcom to the string concatenate game!"
Write-Host "Rules"
Write-Host "You get a word, now write in a word that starts with the letter the word ended with before."
$starterString = "Hello"
Write-Host "$starterString"


#$randomIndex = Get-Random -Minimum 0 -Maximum $inhaltDerDatei.Count #wird eine Nummer ausgewählt (von der Nummer dann der String ausgeben)
#$randomString = $inhaltDerDatei[$randomIndex] #wird jetzt random String ausgeben
#Write-Host "Random string from the file: $randomString" #wird jetzt geprintet


$bedingung = $false


    $dateipfad = "C:\Users\naemi\BLJ2024NaRos\PowerShell\Task4\wordlist.txt"
    $inhaltDerDatei = Get-Content -Path $dateipfad #liest den Inhalt der Datei
    $userInput = Read-Host "Your turn"
    $userFirstLetter = $userInput[0]
    $starterLastLetter = $starterString[-1]
    if ($starterLastLetter -eq $userFirstLetter)
    {
        $inputIsValid = $false
        foreach ($wort in $inhaltDerDatei) { #damit jedes Wort in Datei verglichen wird mit userInpurt
            if ($userInput -eq $wort) {
                $inputIsValid = $true
                break
            }
        }
        if ($inputIsValid) {
            Write-Host "Good :)"
        } else {
            Write-Host "Invalid input :("
        }
    }
    else
    {
        Write-Host "Not good :("
    }
do
{
    $userInputAgain = Read-Host "Your turn"
    $userAgainFirstLetter = $userInputAgain[0]
    $userLastLetter = $userInput[-1]
    if ($userAgainFirstLetter -eq $userLastLetter)
    {
        $inputIsValid = $false
        foreach ($wort in $inhaltDerDatei) { #damit jedes Wort in Datei verglichen wird mit userInpurt
            if ($userInputAgain -eq $wort) {
                $inputIsValid = $true
                break
            }
        }
        if ($inputIsValid) {
            Write-Host "Good :)"
        } else {
            Write-Host "Invalid input :("
        }
    }
    else
    {
        Write-Host "Not good :("
    }
    
    #$randomLastLetter = $randomString[-1]
    #$userInput = Read-Host "Your turn"
    #$userFirstLetter = $userInput[0]
    #$userLastLetter = $userInput[-1]
    
    #if ($randomLastLetter -eq $userFirstLetter)
    #{
    #    Write-Host "Good :)"
    #}
    #else
    #{
    #    Write-Host "Not good :("
    #}

    #$inhaltDerDatei = Get-Content -Path $dateipfad #liest den Inhalt der Datei
    #$randomIndex = Get-Random -Minimum 0 -Maximum $inhaltDerDatei.Count #wird eine Nummer ausgewählt (von der Nummer dann der String ausgeben)
    #$randomString = $inhaltDerDatei[$randomIndex] #wird jetzt random String ausgeben
    #$randomFirstLetter = $randomString[0]
    
}while (-not $bedingung)