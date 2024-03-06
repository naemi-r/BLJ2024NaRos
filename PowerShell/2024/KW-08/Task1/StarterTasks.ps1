# ---C/Java like tasks---
# Wie erstelle ich eine neue Variable?
$var = 5
$string = "5"
...

# Wie erstelle ich ein Array?
$myArray = @(64,"Hello",3.5,"World")

# Wie erstelle ich ein Mehrdimensionales Array?
$dreidimensionalesArray = @(
    @(
        @(1, 2, 3),
        @(4, 5, 6),
        @(7, 8, 9)
    ),
    @(
        @(10, 11, 12),
        @(13, 14, 15),
        @(16, 17, 18)
    ),
    @(
        @(19, 20, 21),
        @(22, 23, 24),
        @(25, 26, 27)
    )
)

# Wie funktionieren bekannte Kontrollstrukturen? (If/Else, Switch, While, DoWhile, For, ForEach)

#If/Else

$zahl = Read-Host "Gib eine Zahl ein"

if ($zahl -eq 0) {
    Write-Host "Die Zahl ist nicht gülltig"
} elseif ($zahl -ne 0) {
    Write-Host "Die Zahl ist gültig"
} else {
    Write-Host "Du musst eien positive Zahl eingeben"
}


#Switch
$zahl = 3
Switch ($zahl)
{
    3 {"Hallo Welt!"}
    Default {"Wert unbekannt"}
}

#While
$var = 0
while($var -lt 30)
 {
    Write-Host "Nummer: $var"
    $var++
 }

#DoWhile
$var = 35
do
 {
    Write-Host "Nummer: $var"
    $var++
 }while($var -lt 30)

#For
for($i=1000; $i -lt 2000; $i++)
{
    $i
}

#ForEach
$farben = @("Rot", "Grün", "Blau", "Gelb")

foreach ($farbe in $farben) {
    Write-Host "Die aktuelle Farbe ist: $farbe"
}

# Wie vergleiche ich Dinge -> Operators (AND, OR, NOT, ==, <, >, <=, >=)
AND --> -and
OR --> -or
NOT --> -ne
== --> -eq
< --> -gt
> --> -lt
<= --> -ge
>= --> -le

# ---Bash like tasks---
# Display the current date and time
Get-Date

# Display a list of all the files in the current directory
ls

# Display a list of all the files in a specific directory
ls C:\Users\naemi\BLJ2024NaRos\PowerShell

# Display the contents of a file
cat C:\Users\naemi\BLJ2024NaRos\PowerShell\Hallo_Welt.txt

# Create a new folder
mkdir foldername

# Create a new file
New-Item -Name "filename.txt" -ItemType File
 
# Copy a file to a different location
Copy-Item -Path .\filename.txt -Destination .\foldername\
 
# Rename a file
Rename-Item -Path .\filename.txt -NewName "file_name.txt"
 
# Delete a file
Remove-Item -Path .\file_name.txt
 
# Create a new text file and append some text to it
echo "text" >> file_name.txt