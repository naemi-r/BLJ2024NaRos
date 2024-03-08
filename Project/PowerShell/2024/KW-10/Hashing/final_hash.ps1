# Function to hash password
function Hash-Password {
    param([string]$password)
    $hashBytes = [System.Text.Encoding]::UTF8.GetBytes($password)
    $hash = Get-FileHash -InputStream ([System.IO.MemoryStream]::new($hashBytes)) -Algorithm SHA256
    return $hash.Hash
}

# Function to sign up a new user
function New-User {
    param(
        [string]$username,
        [string]$password
    )
    $hashedPassword = Hash-Password -password $password
    $csvFilePath = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-10\Hashing\DB.csv"
    $existingData = @(Import-Csv -Path $csvFilePath -ErrorAction SilentlyContinue)
    $newRow = [PSCustomObject]@{
        User = $username
        Hash = $hashedPassword
    }
    $existingData += $newRow
    $existingData | Export-Csv -Path $csvFilePath -NoTypeInformation -Force
    Write-Host "User '$username' signed up successfully."
    $loginChoice = Read-Host "Do you want to log in now? (Y/N)"
    if ($loginChoice -eq "Y" -or $loginChoice -eq "y") {
        Login-User
    }
}

# Function to authenticate user
function Authenticate-User {
    param(
        [string]$username,
        [string]$password
    )
    $csvFilePath = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-10\Hashing\DB.csv"
    $users = Import-Csv -Path $csvFilePath -ErrorAction SilentlyContinue
    $user = $users | Where-Object { $_.User -eq $username }
    if ($user) {
        $storedHash = $user.Hash
        $enteredHash = Hash-Password -password $password
        if ($storedHash -eq $enteredHash) {
            Write-Host "User '$username' logged in successfully."
        } else {
            Write-Host "Incorrect password for user '$username'."
        }
    } else {
        Write-Host "User '$username' not found."
        $tryAgain = Read-Host "Would you like to try again? (Y/N)"
        if ($tryAgain -eq "Y" -or $tryAgain -eq "y") {
            Login-User
        } else {
            Write-Host "Goodbye."
        }
    }
}

# Function for user login
function Login-User {
    $username = Read-Host "Enter your username:"
    $password = Read-Host "Enter your password:" -AsSecureString
    $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    Authenticate-User -username $username -password $password
}

# Prompt user for action
$action = Read-Host "Would you like to (1) Sign Up or (2) Login?"

if ($action -eq "1") {
    $username = Read-Host "Enter a username:"
    $password = Read-Host "Enter a password:" -AsSecureString
    $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    New-User -username $username -password $password
} elseif ($action -eq "2") {
    Login-User
} else {
    Write-Host "Invalid choice."
}