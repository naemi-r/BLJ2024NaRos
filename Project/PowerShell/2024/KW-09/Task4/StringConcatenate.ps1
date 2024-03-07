Write-Host "Welcom to the string concatenate game!"
Write-Host "Rules"
Write-Host "You get a word, now write in a word that starts with the letter the word ended with before."
$oldInput = "Hello"
Write-Host $oldInput

$dateipfad = "C:\Users\naemi\BLJ2024NaRos\PowerShell\Task4\wordlist.txt"
$inhaltDerDatei = Get-Content -Path $dateipfad #liest den Inhalt der Datei


$counter = 0

do
{
$newInput = Read-Host "Your turn"

if ($newInput[0] -eq $oldInput[-1])
{
    $inputIsValid = $false

    foreach ($wort in $inhaltDerDatei)
    {
        if ($newInput -eq $wort)
        {
            $inputIsValid = $true
            break
        }
    }
    if ($inputIsValid)
    {
        Write-Host "Good :)"
        $oldInput = $newInput
        $counter = $counter +1
    } else
    {
        Write-Host "The word is not on the list"
        $counter = 0
    }

}
else
{
    Write-Host "You have entered a word that is not comfortable (read the rules)"
    $counter = 0
}


} while ($counter -lt 20)

Write-Host "Congratulations, you are the winner!"