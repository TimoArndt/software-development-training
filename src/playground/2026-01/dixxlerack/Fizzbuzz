# -------------------------------------
# 9. FizzBuzz in PowerShell
# -------------------------------------
for ($i = 1; $i -le 20; $i++) {
    # Zuerst auf Teilbarkeit durch 3 und 5 prüfen,
    # da diese Bedingung spezieller ist als die einzelnen Teilbarkeiten.
    if (($i % 3 -eq 0) -and ($i % 5 -eq 0)) {
        Write-Host "FizzBuzz"
    }
    elseif ($i % 3 -eq 0) {
        Write-Host "Fizz"
    }
    elseif ($i % 5 -eq 0) {
        Write-Host "Buzz"
    }
    else {
        Write-Host $i
    }
}