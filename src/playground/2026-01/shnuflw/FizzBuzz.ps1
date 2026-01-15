for ($i = 1; $i -le 21; $i++){
    switch($i){
        { ($i % 3 -eq 0) -and ($i % 5 -eq 0) } { Write-Host "FizzBuzz"; break }
        { $i % 3 -eq 0 } { Write-Host "Fizz" }
        { $i % 5 -eq 0 } { Write-Host "Buzz" }
        default { Write-Host "$i" }
    }
}