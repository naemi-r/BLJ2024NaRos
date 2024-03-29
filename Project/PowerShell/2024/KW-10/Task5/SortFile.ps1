# Erstellen Sie einen Ordner TestingPurpose mit 2 Unterordner SubFolder1 und SubFolder2
New-Item -ItemType Directory -Path "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose\SubFolder1" -Force
New-Item -ItemType Directory -Path "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose\SubFolder2" -Force

# Erstellen Sie einige Testdateien in diesen Ordnern:
# 	TypeATest1.txt, TypeATest2.txt ... TypeATest50.txt in SubFolder1
# 	TypeBTest51.txt, TypeBTest52.txt ... TypeBTest100 in SubFolder2 
for ($i = 1; $i -le 50; $i++) {
    $fileName = "TypeATest$i.txt"
    $filePath = "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose\SubFolder1\$fileName"

    New-Item -ItemType File -Path $filePath -Force
}

for ($i = 51; $i -le 100; $i++) {
    $fileName = "TypeBTest$i.txt"
    $filePath = "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose\SubFolder2\$fileName"

    New-Item -ItemType File -Path $filePath -Force
}


# Verschiebe alle Dateien, die eine ungerade Zahl im Namen haben, in SubFolder2.
# Verschiebe alle Dateien, die eine gerade Zahl im Namen haben, in SubFolder1.
$path = "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose"

ls C:\Users\ninab
Get-ChildItem -Path $path -Recurse -File |  
    ForEach-Object {
        $zahl = ($_.Name -replace '\D','').Trim() 
        $name = $_.Name
        if ($zahl % 2 -eq 0) {
            Move-Item -path $path\SubFolder2\$name -Destination $path\SubFolder1
        }else {
            Move-Item -path $path\SubFolder1\$name -Destination $path\SubFolder2
        }    
    }

#Benenne den Ordner SubFolder1 in EvenFilesContainer und SubFolder2 in OddFilesContainer um.
Rename-Item -Path "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose\SubFolder1" -NewName "FilesContainer" -Force
Rename-Item -Path "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose\SubFolder2" -NewName "OddFilesContainer" -Force

# Erstellen Sie eine Liste aller Dateien, die sich derzeit im Ordner TestingPurpose befinden.
Get-ChildItem -Path $path -Recurse -File | Select-Object @{Name="Date"; Expression={$_.LastWriteTime.ToString("yyyyMMdd")}}, Name
#      Beispiel: MasterFile.txt:
# 		Ab JJJJMMTT HH: MM befinden sich folgende Dateien in TestingPurpose:
# 		C:\TestingPurpose\EvenFilesContainer\TypeBTest2.txt
# 		.
# 		.
# 		C:\TestingPurpose\OddFilesContainer\TypeATest99.txt

# Löschen Sie alle Dateien, die mit TypeA beginnen
Remove-Item -Path "C:\Users\naemi\BLJ2024NaRos\PowerShell\2024\KW-10\Task5\TestingPurpose\FilesContainer\TypeA*.txt" -Confirm
