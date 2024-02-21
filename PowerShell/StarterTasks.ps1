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
# Benutzereingabe abfragen
$zahl = Read-Host "Gib eine Zahl ein"

# Die eingegebene Zahl überprüfen
if ($zahl -eq 0) {
    Write-Host "Die Zahl ist nicht gülltig"
} elseif ($zahl -ne 0) {
    Write-Host "Die Zahl ist gültig"
} else {
    Write-Host "Du musst eien positive Zahl eingeben"
}


#Switch
Switch (<test-expression>)
{
    <result1-to-be-matched> {<action>}
    <result2-to-be-matched> {<action>}
}

# Wie vergleiche ich Dinge -> Operators (AND, OR, NOT, ==, <, >, <=, >=)

# ---Bash like tasks---
# Display the current date and time
# Display a list of all the files in the current directory
# Display a list of all the files in a specific directory
# Display the contents of a file
# Create a new folder
# Create a new file
# Copy a file to a different location
# Rename a file
# Delete a file
# Create a new text file and append some text to it

