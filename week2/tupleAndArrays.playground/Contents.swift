import UIKit

// Tuple


let tuple = (404, "Not found")

print(tuple)
print(tuple.0)
print(tuple.1)


// Isimli Tuple

var namesTuple = (first: 1, middle: 2, last: 3)
print(namesTuple.first)

// Sonradan deger belirlenen tuple

var numbertuple: (optionalFirst: Int?, middle: String, last: Int)?
numbertuple = (nil, "cemalhan", last: 21)
numbertuple?.last

// Soru: Merkezi (0,0) olan ve yaricapi bir olan bir cember tanimlayiniz.

typealias Circle = (center: (x: CGFloat, y: CGFloat), radius: CGFloat)
var unitCircle: Circle = ((0.0, 0.0), 1)

var a1 = 3
var b1 = 4
// swap yapma

var temp = a1
a1 = b1
b1 = temp

// kisa yollu swap islemi(tuple kullanilmali
(a1, b1) = (b1, a1)

// Tuples in switch
let switchTuple = (firstCase: true, secondCase: false)

switch switchTuple{
case (true, true):
    print("ikiside dogru")
case (true, false)
    print("birincisi dogru ikincisi yanlis")
case (false, true):
    print("birincisi yanlis ikincisi dogru")
case (false, false):
    print("ikiside yanlis")
}


//------------------------------------------------------------------------------------------------------------------

// Array - Dizi
// Ayni veri turunde olan degerleri tutar ancak istenirse farkli turleride tutabiliriz.
//kullanmak icin as [Any] kullanilmali
var cars = ["Dacia", 3] as [Any]

var cities: [String] = []  // Bos string array
var cities2: Array<String> = Array() // Bos string array
var cities3 = Array<String>() // bos string array
var cities4 = [String]() // bos string array

// Arraye eleman ekleme ve indis kavrami

cities.append("Malatya")
cities.append("Sinop")
cities.append("Bursa")
cities.append("Baku")
cities.append("Kahramanmaras")
cities.append("Denizli")
cities.append("Cannekkale")
cities.append("Tekirdag")
cities.append("Hatay")

cities.first
cities[0]
cities.endIndex
cities.last
cities[cities.endIndex - 1]
cities[cities.count - 1]

var stringArray = Array(repeating: "Malatya", count: 4)

// Array icinde array

let matrix = [["a", "b", "c"], [1, 2, 3]]
matrix[0][2]

matrix.first?.last

// Numerik Diziler

var numberArray = [1, 2, 3]
numberArray.max()
numberArray.min()

for city in cities {
    print(city)
}








