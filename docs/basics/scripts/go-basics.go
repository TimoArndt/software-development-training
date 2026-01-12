package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
)

func main() {
	// -------------------------------------
	// 1. Kommentare
	// -------------------------------------
	// Einzeiliger Kommentar

	/*
	   Mehrzeiliger
	   Kommentar
	*/

	// -------------------------------------
	// 2. Hello World
	// -------------------------------------
	fmt.Println("Hello World")

	// -------------------------------------
	// 3. Variablen & Datentypen
	// -------------------------------------
	name := "Sascha" // string
	age := 35        // int
	isAdmin := true  // bool
	colors := []string{"Rot", "Grün", "Blau"}
	user := map[string]string{"Name": "Sascha", "Role": "Admin"}

	// Explizite Typdeklaration
	var number int = 42
	var text string = "Hallo"

	// -------------------------------------
	// 4. Ausgabe der Variablen
	// -------------------------------------
	fmt.Println("-- Variablen Ausgabe --")
	fmt.Println("Name =", name)
	fmt.Println("Alter =", age)
	fmt.Println("isAdmin =", isAdmin)
	fmt.Println("colors =", colors)
	fmt.Println("Hashtable Name =", user["Name"])
	fmt.Println("number =", number)
	fmt.Println("text =", text)

	// -------------------------------------
	// 5. Operatoren
	// -------------------------------------
	a := 5 + 3
	fmt.Println("a =", a)

	b := 10 - 2
	fmt.Println("b =", b)

	c := 4 * 2
	fmt.Println("c =", c)

	d := 8 / 2
	fmt.Println("d =", d)

	e := 10 % 3
	fmt.Println("e =", e)

	// Vergleichsoperatoren
	fmt.Println("Gleich:", a == b)
	fmt.Println("Ungleich:", a != b)
	fmt.Println("Größer als:", a > b)
	fmt.Println("Kleiner als:", a < b)

	// Logische Operatoren
	if a > 3 && b < 10 {
		fmt.Println("Logisch AND")
	}

	if a == 5 || b == 8 {
		fmt.Println("Logisch OR")
	}

	// Zuweisungsoperatoren
	x := 10
	x += 5
	x -= 3
	x *= 2
	x /= 4
	x %= 3
	fmt.Println(x) // Rest ist 0

	// -------------------------------------
	// 6. Bedingungen
	// -------------------------------------
	// If/Else
	age = 18

	if age >= 18 {
		fmt.Println("Volljährig")
	} else {
		fmt.Println("Minderjährig")
	}

	// If/Else/ElseIf
	score := 85

	if score >= 90 {
		fmt.Println("Ausgezeichnet")
	} else if score >= 80 {
		fmt.Println("Gut")
	} else if score >= 70 {
		fmt.Println("Befriedigend")
	} else if score >= 60 {
		fmt.Println("Ausreichend")
	} else {
		fmt.Println("Ungenügend")
	}

	// Switch-Statement
	number = 2

	switch number {
	case 1:
		fmt.Println("Eins")
	case 2:
		fmt.Println("Zwei")
	case 3:
		fmt.Println("Drei")
	default:
		fmt.Println("Andere Zahl:", number)
	}

	// -------------------------------------
	// 7. Schleifen
	// -------------------------------------
	// For-Schleife
	for i := 0; i < 5; i++ {
		fmt.Println("Zähler:", i)
	}

	// While-Schleife (in Go gibt es keine eigene While-Schleife, sondern nur For)
	i := 0
	for i < 5 {
		fmt.Println("While:", i)
		i++
	}

	// For-Each Schleife (in Go über range)
	for _, color := range colors {
		fmt.Println("Farbe:", color)
	}

	// -------------------------------------
	// 8. Ein- und Ausgabe
	// -------------------------------------
	// Eingabe vom Benutzer
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Bitte gib deinen Namen ein: ")
	name, _ = reader.ReadString('\n')
	name = strings.TrimSpace(name)
	fmt.Println("Hallo,", name+"!")

	// Ausgabe in Datei (mit Prüfung, ob Verzeichnis existiert)
	dir := "c:/temp"
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		os.Mkdir(dir, 0755)
	}

	f, _ := os.Create(dir + "/output.txt")
	f.WriteString("Dies ist ein Test")
	f.Close()

	// Lesen aus Datei
	content, _ := os.ReadFile(dir + "/output.txt")
	fmt.Println("Dateiinhalt:", string(content))

	// -------------------------------------
	// 9. FizzBuzz
	// -------------------------------------
	for i := 1; i <= 20; i++ {
		if i%3 == 0 && i%5 == 0 {
			fmt.Println("FizzBuzz")
		} else if i%3 == 0 {
			fmt.Println("Fizz")
		} else if i%5 == 0 {
			fmt.Println("Buzz")
		} else {
			fmt.Println(i)
		}
	}

	// -------------------------------------
	// 10. Funktionen
	// -------------------------------------
	// Funktionsaufruf
	SayHello()

	// Funktion mit Parametern
	result := AddiereZahlen(3, 5)
	fmt.Println("Summe:", result)

	// -------------------------------------
	// 11. Sortieren und Filtern
	// -------------------------------------
	zahlen := []int{5, 2, 9, 1}
	sort.Ints(zahlen)
	fmt.Println("Sortierte Zahlen:", zahlen)

	zahlen2 := []int{1, 4, 2, 7, 3}
	großeZahlen := []int{}
	for _, n := range zahlen2 {
		if n > 3 {
			großeZahlen = append(großeZahlen, n)
		}
	}
	fmt.Println("Zahlen größer als 3:", großeZahlen)

	// Prozesse anzeigen (Go hat kein direktes Pendant zu Get-Process)
	fmt.Println("Prozesse anzeigen ist in Go nicht direkt ohne externe Pakete möglich.")
}

// Einfache Funktion
func SayHello() {
	fmt.Println("Hallo aus der Funktion!")
}

// Funktion mit Parametern
func AddiereZahlen(a int, b int) int {
	return a + b
}
