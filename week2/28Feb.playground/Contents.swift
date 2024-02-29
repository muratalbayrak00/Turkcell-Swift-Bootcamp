import UIKit
import Foundation
// SET(UNORDERED)
/* Array ve Set arasındaki farklar:
 1- Set'lerde mükerrer(tekrarlı) eleman bulunmaz, array'lerde bulunabilir.
 2- Array'ler sıralıdır Set'ler sırasızdır.
 3- Set'ler "Hashable" protokolüne sahiptir.
 */

var colors = Set<String>() // Elemanları "String" olan boş bir set(küme).
var myColors: Set<String> = ["Yeşil", "Siyah", "Mavi", "Turkuaz", "Kırmızı"]
myColors.count

var animals: Set<String> = ["Çakıl", "Karabaş", "Luna", "Tony", "Maviş", "Çimen", "Ercüü", "Atiba", "Maya", "Beyaz", "Albino", "Kara"]



var myCars: Set<String> = ["Clio", "Corolla", "Tesla", "BMW", "Kartal", "Doğan", "Şahin", "Serçe"]
var wildBirds: Set<String> = ["Kartal", "Şahin", "Akbaba", "Baykuş", "Doğan", "Atmaca", "Martı"]

// kesişim kümesi bulma
var intersection1 = myCars.intersection(wildBirds)
var intersection2 = myCars.intersection(animals)

// bileşim kümesi bulma
var union1 = myCars.union(wildBirds)
var union2 = myCars.union(animals)

/* Question:
 Bir sınıfta en az bir yazılım dili bilenlerin sayısı 24, sadece Swift bilenler 12, sadece Kotlin bilenler 8 olduğuna göre her iki dili bilen kaç kişi vardır?
 Symmetric difference: Fark
 Substracting: Altküme
*/



/* Dictionary: Sözlük işlemleri - Unordered
1- Key-value formatlı veri yapısıdır.
 */


var dict1: Dictionary<String, String> = Dictionary<String, String>()
var dict2 = [String: String]()
var dict3: [String: String] = [:]


var animals2: [String: String] = ["Çakıl": "Kedi", "Zilli": "Köpek", "Beyaz": "Sibirya Kurdu"]
print(animals2)
animals2["Cakil"]
animals2.keys
animals2.values
animals2["Cakil"] = "kus"
print(animals2)
animals2.updateValue("kus 2", forKey: "cakil")
print(animals2)

var plates: [Int: String] = [31: "Hatay", 34: "istanbul", 35: "izmir"]
var testDict1 = [String: Any]()


for animal in animals2.keys {
    print(animal)
}

// ---------Fonksiyonlar ---------------

func sayhi() {
    print("Hello World")
}

func sayHi2(name: String) {
    print("hello")
}

func greeting(name: String) -> String {
    return "hello \(name)"
}
print(greeting(name: "Kerim Hoca"))

func greeting(name: String, age: Int) -> String {
    return("my names is \(name) and i am \(age)")
}
print(greeting(name: "murat", age: 21))
    
// -----------------------------------------------------------------

/*
 Closure - Block, Lamda , Arroc Functioan
 
 ismi olmayan, parametre alip geriye deger dondurebilen bir degiskene
 atanabilen bir fonksiyona parametre olarak verilebilen kod bloguna denir.
 */
    
// () -> ()


let selamver: () -> () = {
    print("selam ver")
}
    
print(selamver)
    

let selamver2: (String) -> () = { name in
    print("selam \(name)")
}
selamver2("Murat")
    
// birden fazla parametre alan ve donus tipi olan closure tanimlayalim


let compare: (Int, Int) -> Bool = {x, y in
    return x < y
}
compare(4, 3)

// iki sayinin toplamini donen bir closure yaziniz

let sum: (Int, Int) -> (Int) = {x, y in
    return x + y
}
sum(3, 4)

let names = ["Murat", "Osman", "Cem", "Yusuf", "Ayca"]

// bunlarin hepsi alfabetik olarak siralama yapar.
let sortedNames = names.sorted { (x: String, y: String) -> Bool in
   return x < y
}

let sortedNames2 = names.sorted { (x, y) -> Bool in
    return x < y
}

let sortedNames3 = names.sorted { (x, y) in
    return x < y
}

let sortedNames4 = names.sorted {
    $0 < $1
}

// Hocanin tercihi budur
let sortedNames5 = names.sorted(by: <)

print(sortedNames5)


/* Complasion Handler
 1- Muhtemelen en fazla kullanacagimiz closure tipitir.
 2- HTTP istegi gibi uzun bir islem yaptigimizi varsayalim. Istegin tamamlanmasinin
 hemen ardindan bir seyler yapmak isteyelim. Ancak surecin devam edip etmedigini kontrol
 etmek bizin icin maliyetli olacaktir. Bu durumda isimizi goren comlasion handler bu is
 tamamlanir tamamlanmaz hemen geri cagirilan bir closure dur.
 
 */


// Odev bir sayinin asal olup olmadigi anlayacagimiz en optimum kod
// palidrom olup olmadigini kontrol eden bir kod yaz
// euler project 6

