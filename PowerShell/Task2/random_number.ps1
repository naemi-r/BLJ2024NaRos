$random = Get-Random -Minimum -0 -Maximum 100

do
{
    $user = Read-Host "Bitte geben Sie einen Wert ein"
    if ($user -eq $random)
    {
        Write-Host "Richtig"
        break
    }
    elseif($user -lt $random)
    {
        Write-Host "Falsch zu tief"
    }
    elseif($user -gt $random)
    {
        Write-Host "Falsch zu hoch"
    }
    else
    {
        Write-Host "Error!"
    }
}while($true)