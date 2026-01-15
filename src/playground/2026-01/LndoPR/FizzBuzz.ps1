
$zahlen = @()
$i = 1
$j = 21

while ($i -le $j) {
    $zahlen += $i
    $i++
}

foreach ($zahl in $zahlen) {
    if (($zahl % 3 -eq 0) -and ($zahl % 5 -eq 0)) {
        Write-Host "$zahl FizzBuzz"
    }
    elseif ($zahl % 5 -eq 0) {
        Write-Host "$zahl Buzz"
    }
    elseif ($zahl % 3 -eq 0) {
        Write-Host "$zahl Fizz"
    }
    else {
        Write-Host $zahl
    }
}