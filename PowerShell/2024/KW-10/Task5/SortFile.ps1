Get-ChildItem C:\Users\naemi
Get-ChildItem -Path ".\TestingPurpose" -Recurse -File |  
    ForEach-Object
    {
        $zahl = ($_.Name -replace '\D','').Trim()
        if ($i = $zahl % 2)
        {
            Move-Item -path C:\Users\naemi\BLJ2024NaRos\PowerShell\Task5\TestingPurpose\SubFolder2\$i.txt -Destination .\TestingPurpose\SubFolder1
        }
        else
        {
            Move-Item  -path C:\Users\naemi\BLJ2024NaRos\PowerShell\Task5\TestingPurpose\SubFolder1\$i.txt -Destination .\TestingPurpose\SubFolder2
        }    

        consol.log
    }
 