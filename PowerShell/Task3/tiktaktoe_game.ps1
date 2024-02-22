$board = @( ('1','2','3'),
            ('4','5','6'),
            ('7','8','9'))
 
 
$playerOneSymbol = 'X'
$playerTwoSymbol = 'O'
 
function Run-Game(){
 Show-Board
}
 
function Get-Winner(){
 
}
 
function Insert-Tile(){
 
}
 
function Show-Board(){
Write-Host "-------------"
Write-Host "|"$board[0][0]"|"$board[0][1]"|"$board[0][2]"|"
Write-Host "-------------"
Write-Host "|"$board[1][0]"|"$board[1][1]"|"$board[1][2]"|"
Write-Host "-------------"
Write-Host "|"$board[2][0]"|"$board[2][1]"|"$board[2][2]"|"
Write-Host "-------------"
}
 
function Switch-Player(){

    for ($i = 0; $i -lt 4; $i++)
    {
        if($i % 2 -eq 1)
        {
            Write-Host "X:" 
        }
        $user = Read-Host "gebe eine Zahl ein um dort dein Feld zu markieren"
        else {
            Write-Host "O" 
        }
        $user = Read-Host "gebe eine Zahl ein um dort dein Feld zu markieren"
    }
}
 
Clear-Host
Run-Game -board $board -startingPlayer $playerOneSymbol

