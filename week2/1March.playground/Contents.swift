// MARK : Lesson 7
// MARK : 1 Mart 2024

import UIKit

// --------------------------
// MARK : Extension
// Int, Color, String, Struct standartta olmayan bir ozellik eklemeye yarar.
// --------------------------

var a = 2.0
var b = 685.0

var c = a / b // yuvarlar

// 0,1253 => 0,13   ..... 12,53
// 0,1253 => 0,125
// 0,1253 => 0,1253

// Virgulden sonra 2 basamak icin 100 ile carp (10 uzeri 2)
// 0,1253 => 12,53
// Sayiyi Yuvarla
// 12,53 => 13
// Carptigin sayiya bol ( 10 uzeri 2 )
// 13 => 0,13

// Yukaridaki c sayisini virgulden sonra 3 basamak yuvarlama ( 10^3 )
var d = ( c * 1000 )
d = d.rounded()
d /= 1000
print(d)

extension Double {
    func sayiyiYuvarla(_ basamak: Int) -> Double {
        let carpan = pow(10.0, Double(basamak))
        return (self * carpan).rounded() / carpan
    }
}

var e = 0.002919543243
e.sayiyiYuvarla(3)



extension Int {
    func sayininKupu() -> Int {
        self * self * self // tek satir oldugu icin return yazmaya gerek yok
    }
    
    mutating func kareAl() {
        self = self * self
    }
}
6.sayininKupu()

var x = 4
x = x * x

var num = 4
num.kareAl()


// Cift Tek Kontrolu
extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
    
    func isOdd() -> Bool {
        return !isEven()
    }
}



// --------------------
// GENERICS
// Tipten bagimsiz sekilde kullanima izin veren yapilar.
// --------------------

let cities = [nil ,"Alanya", "Konya", "Denizli"]
let numbers = [1, 2, 3]
let doubleNumber = [3.14, 5.2, 6.3]

func myCities(cities: [String]) {
    for city in cities {
//        print(city)
    }
}

func myNumbers(numbers: [Int]) {
    for number in numbers {
//        print(number)
    }
}

func myDoubleNumbers(doubleNumbers: [Double]) {
    for doubleNumber in doubleNumbers {
//        print(doubleNumber)
    }
}

func anyArray<T>(_ array: [T]) {
    array.map {
        print($0)
    }
}

anyArray(cities)
anyArray(numbers)
anyArray(doubleNumber)

// Gerneric ifade kullanarak 2 sayinin toplamini donen bir fonksiyon yaziniz


func sum<T: Numeric>(_ num1: T, _ num2: T) -> T{
    return num1 + num2
}
//var a: Int = 3
//var b: Double = 4.2
//sum(a, b)


// Ankara ["X","Y","Ankara","Z"]
func findIndex<T: Equatable>( foundItem: T, in items: [T]) -> Int? { // Arrayde bulamazsa ne olcak
    
    for ( index, item ) in items.enumerated() {
        if item == foundItem {
            return index
        }
    }
    print("YOK")
    return nil
}

if let result = findIndex(foundItem: "Alanya", in: cities) {
    print(result)
}

if let result = findIndex(foundItem: "Izmir", in: cities) {
    print(result)
}


// ODEV
// 2 PARAMETRELI VE FARKLI TIPLI BIR GENERIC ORNEGI YAPINIZ
// PROJECT EULER 7
