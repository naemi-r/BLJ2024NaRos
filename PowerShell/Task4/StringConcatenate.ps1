Write-Host "Welcom to the string concatenate game!"
Write-Host "Rules"
Write-Host "You get a word, now write in a word that starts with the letter the word ended with before."
$starterString = "Hello"
Write-Host "$starterString"


    $dateipfad = "C:\Users\naemi\BLJ2024NaRos\PowerShell\Task4\wordlist.txt"
    $inhaltDerDatei = Get-Content -Path $dateipfad #liest den Inhalt der Datei
    $userInput = Read-Host "Your turn"
    $userFirstLetter = $userInput[0]
    $userLastLetter = $userInput[-1]
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



    $userInput1 = Read-Host "Your turn"
    $user1FirstLetter = $userInput1[0]
    $userLastLetter = $userInput[-1]

    if ($user1FirstLetter -eq $userLastLetter)
    {
        $inputIsValid = $false

        foreach ($wort in $inhaltDerDatei)
        {
            if ($userInputAgain -eq $wort)
            {
                $inputIsValid = $true
                break
            }
        }
#es ist so das beim zweiten durchgang if nicht mehr erfüllt wird und dann auf else geht und deswegen not good schreibt

        if ($inputIsValid)
        {
            Write-Host "Good :)"
        } else
        {
            Write-Host "Invalid input :("
        }

    }
    else
    {
        Write-Host "Not good :("
    }
    $inputIsValid = $false

$bedingung = $false

do
{
    $inputIsValid = $false
    $inputIsValid = $null
    $userInput2 = $null
    $user2FirstLetter = $null
    $user1LastLetter = $null
    $bedingung = $false
    $userInput2 = Read-Host "Your turn"
    $user2FirstLetter = $userInput2[0]
    $user1LastLetter = $userInput1[-1]

    if ($user2FirstLetter -eq $user1LastLetter)
    {
        $inputIsValid = $false

        foreach ($wort in $inhaltDerDatei)
        {
            if ($userInputAgain -eq $wort)
            {
                $inputIsValid = $true
                break
            }
        }
#es ist so das beim zweiten durchgang if nicht mehr erfüllt wird und dann auf else geht und deswegen not good schreibt

        if ($inputIsValid)
        {
            Write-Host "Good :)"
        } else
        {
            Write-Host "Invalid input :("
        }

    }
    else
    {
        Write-Host "Not good :("
    }
    $userInput1 = $userInput2
$bedingung = $false
} while (-not $bedingung)
