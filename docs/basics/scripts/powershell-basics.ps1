# -------------------------------------
# 1. Kommentare
# -------------------------------------
# einzeiliger Kommentar

<# Dies ist ein
mehrzeiliger Kommentar. #>

# -------------------------------------
# 2. Hello World
# -------------------------------------
Write-Host "Hello World"

# -------------------------------------
# 3. Variablen & Datentypen
# -------------------------------------
# String
$name = "Sascha"

# Integer
$age = 35

# Boolean
$isAdmin = $true

# Array
$colors = @("Rot", "Grün", "Blau")

# Hashtable
$user = @{
    Name = "Sascha"
    Role = "Admin"
}

# Explizite Typdeklaration
[int]$number = 42
[string]$text = "Hallo"

# -------------------------------------
# 4. Ausgabe der Variablen (aus 3.)
# -------------------------------------
Write-Host "-- Variablen Ausgabe --"
Write-Host "Name = $name"
Write-Host "Alter = $age"
Write-Host "isAdmin = $isAdmin"
Write-Host "colors = $colors"
Write-Host "Hashtable = $user"
Write-Host "number = $number"
Write-Host "text = $text"

# -------------------------------------
# 5. Operatoren
# -------------------------------------
# Arithmetische Operatoren
$a = 5 + 3 # Addition
Write-Host "a = $a"

$b = 10 - 2 # Subtraktion
Write-Host "b = $b"

$c = 4 * 2 # Multiplikation
Write-Host "c = $c"

$d = 8 / 2 # Division
Write-Host "d = $d"

$e = 10 % 3 # Modulo (Rest der Division)
Write-Host "e = $e"

# Vergleichsoperatoren
Write-Host "Gleich: $($a -eq $b)" # Gleich
Write-Host "Ungleich: $($a -ne $b)" # Ungleich
Write-Host "Größer als: $($a -gt $b)" # Größer als
Write-Host "Kleiner als: $($a -lt $b)" # Kleiner als

# Logische Operatoren
($a -gt 3) -and ($b -lt 10)
($a -eq 5) -or ($b -eq 8)
-not ($a -eq 5)

# Zuweisungsoperatoren
$x = 10
$x += 5 # x = x + 5
$x -= 3 # x = x - 3
$x *= 2 # x = x * 2
$x /= 4 # x = x / 4
$x %= 3 # x = x % 3
Write-Host "x = $x" # Rest ist 0

# -------------------------------------
# 6. Bedingungen
# -------------------------------------
# If/Else
$age = 18

if ($age -ge 18) {
    Write-Host "Volljährig"
}
else {
    Write-Host "Minderjährig"
}

# If/Else/ElseIf
$score = 85

if ($score -ge 90) {
    Write-Host "Ausgezeichnet"
}
elseif ($score -ge 80) {
    Write-Host "Gut"
}
elseif ($score -ge 70) {
    Write-Host "Befriedigend"
}
elseif ($score -ge 60) {
    Write-Host "Ausreichend"
}
else {
    Write-Host "Ungenügend"
}

# Switch-Statement
$number = 2

switch ($number) {
    1 { Write-Host "Eins" }
    2 { Write-Host "Zwei" }
    3 { Write-Host "Drei" }
    { $_ -gt 10 } { Write-Host "Große Zahl" }
    default { Write-Host "Andere Zahl: $_" }
}

# -------------------------------------
# 7. Schleifen
# -------------------------------------
# For-Schleife
for ($i = 0; $i -lt 5; $i++) {
    Write-Host "Zähler: $i"
}

# While-Schleife (Kopfgesteuert (Abbruchbedingung am Anfang))
$i = 0
while ($i -lt 5) {
    Write-Host "While: $i"
    $i++
}

# Do-While-Schleife (Fußgesteuert (Abbruchbedingung am Ende))
$i = 0
do {
    Write-Host "Do-While: $i"
    $i++
} while ($i -lt 5)

# Foreach-Schleife
$colors = @("Rot", "Grün", "Blau")
foreach ($color in $colors) {
    Write-Host "Farbe: $color"
}

# -------------------------------------
# 8. Ein- und Ausgabe
# -------------------------------------
# Eingabe vom Benutzer
$name = Read-Host "Bitte gib deinen Namen ein"
Write-Host "Hallo, $name!"

# Ausgabe in Datei (mit Prüfung, ob Verzeichnis existiert)
$dir = "C:\temp"

if (-not (Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir | Out-Null
}

"Dies ist ein Test" | Out-File -FilePath "$dir\output.txt"

# Lesen aus Datei
$content = Get-Content -Path "C:\temp\output.txt"
Write-Host "Dateiinhalt: $content"

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

# -------------------------------------
# 10. Funktionen
# -------------------------------------
# Einfache Funktion
function SayHello {
    Write-Host "Hallo aus der Funktion!"
}

# Funktionsaufruf
SayHello

# Funktion mit Parametern
function AddiereZahlen($a, $b) {
    return $a + $b
}

# Funktionsaufruf mit Argumenten
$result = AddiereZahlen 3 5
Write-Host "Summe: $result"

# -------------------------------------
# 11. Pipelines
# -------------------------------------
# Sortieren einer Liste
$zahlen = @(5, 2, 9, 1)
$zahlen = $zahlen | Sort-Object
Write-Host "Sortierte Zahlen: $zahlen"

# Filtern von Zahlen größer als 3
$zahlen = @(1, 4, 2, 7, 3)
$großeZahlen = $zahlen | Where-Object { $_ -gt 3 }
Write-Host "Zahlen größer als 3: $großeZahlen"

# Alle Prozesse nach Namen anzeigen, aber nur die ersten 10
Get-Process | Select-Object -Property ProcessName -First 10

# Datentypen und ihre Spezifika (Grenzwerte, Default-Werte usw.
$accelerators = @{
    'sbyte' = [System.SByte]; 'byte' = [System.Byte]
    'short' = [System.Int16]; 'ushort' = [System.UInt16]
    'int' = [System.Int32]; 'uint' = [System.UInt32]
    'long' = [System.Int64]; 'ulong' = [System.UInt64]
    'float' = [System.Single]; 'double' = [System.Double]; 'decimal' = [System.Decimal]
    'char' = [System.Char]; 'bool' = [System.Boolean]
    'string' = [System.String]; 'array' = [System.Array]; 'object' = [System.Object]
    'datetime' = [System.DateTime]; 'timespan' = [System.TimeSpan]; 'guid' = [System.Guid]
    'hashtable' = [System.Collections.Hashtable]
}

$types = $accelerators.Values

$types | ForEach-Object {
    $t = $_

    $accelerator = ($accelerators.GetEnumerator() | Where-Object { $_.Value -eq $t } | Select-Object -First 1).Key

    $minField = $t.GetField('MinValue','Public,Static')
    $maxField = $t.GetField('MaxValue','Public,Static')

    $size = if ($t.IsValueType) {
        try { [System.Runtime.InteropServices.Marshal]::SizeOf($t) } catch { $null }
    } else { $null }

    $defaultValue = if ($t.IsValueType) { [Activator]::CreateInstance($t) } else { $null }

    [pscustomobject]@{
        TypeAccelerator = $accelerator
        DotNetType      = $t.FullName
        Kind            = if ($t.IsValueType) { 'ValueType' } else { 'ReferenceType' }
        Size_Bytes      = $size
        HasMinValue     = [bool]$minField
        HasMaxValue     = [bool]$maxField
        MinValue        = if ($minField) { $t::MinValue } else { $null }
        MaxValue        = if ($maxField) { $t::MaxValue } else { $null }
        DefaultValue    = $defaultValue
    }
} | Sort-Object Kind, DotNetType | Format-Table -AutoSize
