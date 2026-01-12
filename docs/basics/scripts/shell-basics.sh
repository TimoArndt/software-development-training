#!/bin/bash

# -------------------------------------
# 1. Kommentare
# -------------------------------------
# Einzeiliger Kommentar

: '
Mehrzeiliger
Kommentar
'

# -------------------------------------
# 2. Hello World
# -------------------------------------
echo "Hello World"

# -------------------------------------
# 3. Variablen & Datentypen
# -------------------------------------
name="Sascha"
age=35
isAdmin=true
colors=("Rot" "Grün" "Blau")
declare -A user
user[Name]="Sascha"
user[Role]="Admin"
number=42
text="Hallo"

# -------------------------------------
# 4. Ausgabe der Variablen
# -------------------------------------
echo "-- Variablen Ausgabe --"
echo "Name = $name"
echo "Alter = $age"
echo "isAdmin = $isAdmin"
echo "colors = ${colors[*]}"
echo "Hashtable Name = ${user[Name]}"
echo "number = $number"
echo "text = $text"

# -------------------------------------
# 5. Operatoren
# -------------------------------------
# 5.1 Arithmetische Operatoren
a=$((5 + 3))
echo "a = $a"
b=$((10 - 2))
echo "b = $b"
c=$((4 * 2))
echo "c = $c"
d=$((8 / 2))
echo "d = $d"
e=$((10 % 3))
echo "e = $e"

# Vergleichsoperatoren
if [ "$a" -eq "$b" ]; then echo "Gleich"; fi
if [ "$a" -ne "$b" ]; then echo "Ungleich"; fi
if [ "$a" -gt "$b" ]; then echo "Größer als"; fi
if [ "$a" -lt "$b" ]; then echo "Kleiner als"; fi

# Logische Operatoren
if [ "$a" -gt 3 ] && [ "$b" -lt 10 ]; then echo "Logisch AND"; fi
if [ "$a" -eq 5 ] || [ "$b" -eq 8 ]; then echo "Logisch OR"; fi

# Zuweisungsoperatoren
x=10
x=$((x + 5))
x=$((x - 3))
x=$((x * 2))
x=$((x / 4))
x=$((x % 3))
echo "x = $x" # Rest ist 0

# -------------------------------------
# 6. Bedingungen
# -------------------------------------
# If/Else
age=18

if [ "$age" -ge 18 ]; then
    echo "Volljährig"
else
    echo "Minderjährig"
fi

# If/Else/ElseIf
score=85

if [ "$score" -ge 90 ]; then
    echo "Ausgezeichnet"
elif [ "$score" -ge 80 ]; then
    echo "Gut"
elif [ "$score" -ge 70 ]; then
    echo "Befriedigend"
elif [ "$score" -ge 60 ]; then
    echo "Ausreichend"
else
    echo "Ungenügend"
fi

# Switch-Statement
number=2

case $number in
    1) echo "Eins" ;;
    2) echo "Zwei" ;;
    3) echo "Drei" ;;
    *) echo "Andere Zahl: $number" ;;
esac

# -------------------------------------
# 7. Schleifen
# -------------------------------------
# For-Schleife
for ((i=0; i<5; i++)); do
    echo "Zähler: $i"
done

# While-Schleife (Kopfgesteuert (Abbruchbedingung am Anfang))
i=0
while [ $i -lt 5 ]; do
    echo "While: $i"
    ((i++))
done

# Until-Schleife (Fußgesteuert (Abbruchbedingung am Ende))
for color in "${colors[@]}"; do
    echo "Farbe: $color"
done

# -------------------------------------
# 8. Ein- und Ausgabe
# -------------------------------------
# Eingabe vom Benutzer
read -p "Bitte gib deinen Namen ein: " name
echo "Hallo, $name!"

# Ausgabe in Datei (mit Prüfung, ob Verzeichnis existiert)
dir="/c/temp"
if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
fi

echo "Dies ist ein Test" > "$dir/output.txt"

# Lesen aus Datei
content=$(cat "$dir/output.txt")
echo "Dateiinhalt: $content"

# -------------------------------------
# 9. FizzBuzz
# -------------------------------------
for ((i=1; i<=20; i++)); do
    # Zuerst auf Teilbarkeit durch 3 und 5 prüfen,
    # da diese Bedingung spezieller ist als die einzelnen Teilbarkeiten.
    if ((i % 3 == 0 && i % 5 == 0)); then
        echo "FizzBuzz"
    elif ((i % 3 == 0)); then
        echo "Fizz"
    elif ((i % 5 == 0)); then
        echo "Buzz"
    else
        echo "$i"
    fi
done

# -------------------------------------
# 10. Funktionen
# -------------------------------------
# Einfache Funktion
say_hello() {
    echo "Hallo aus der Funktion!"
}

# Funktionsaufruf
say_hello

# Funktion mit Parametern
addiere_zahlen() {
    echo $(( $1 + $2 ))
}

# Funktionsaufruf mit Argumenten
result=$(addiere_zahlen 3 5)
echo "Summe: $result"

# -------------------------------------
# 11. Sortieren und Filtern
# -------------------------------------
# Sortieren
zahlen=(5 2 9 1)
sorted=($(for n in "${zahlen[@]}"; do echo $n; done | sort -n))
echo "Sortierte Zahlen: ${sorted[*]}"

# Filtern
zahlen=(1 4 2 7 3)
grosse_zahlen=()
for z in "${zahlen[@]}"; do
  if (( z > 3 )); then
    grosse_zahlen+=("$z")
  fi
done
echo "Zahlen größer als 3: ${grosse_zahlen[*]}"
