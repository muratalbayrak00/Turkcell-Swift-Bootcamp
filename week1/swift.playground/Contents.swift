import UIKit

// Question 1
let str = "aaba kouq bux"

for letter in str{
    
    
}


// Question 2

func wordCount(sentence: String) {
    var words = sentence.split(separator: " ")
    
    var wordCount = [String: Int]()
    for word in words {
        wordCount[String(word), default: 0] += 1
    }

    for (word, number) in wordCount {
        print("\(word): \(number) kere")
    }
}

var sentence = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"

wordCount(sentence: sentence)

// Euler project 1

var sum = 0
for i in 1...999{
    if i % 3 == 0 || i % 5 == 0{
        sum += i
    }
}
print(sum)


// Euler project 2

var evenSum=0
var x=1
var y=2

for i in 1...4000000{
    if x % 2 == 0{
        sum += x
    }
    var nextTerm = x+y
    x = y
    y = nextTerm

}
print(sum)

// Euler project 3


/*
 
 1- Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun 
 stringler olsun. Bu stringler içinde bazı harflerin tekrar edeceğini düşünün.
 Mesela 'a' harfi 20 farklı yerde geçiyor olabilir. Bir fonksiyon ile verilen
 parametre değerine eşit ve daha fazla bulunan harfleri siliniz.Sonra geriye kalan
 stringi ekrana yazdırınız.
  
  Örnek string: "aaba kouq bux"
  Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazılmalı
  Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
  tekrar sayısı 4 verildiğinde : hiç bir harf silinmeyip aynı string yazılmalı

 
 2- Elimizde uzun bir cümle olsun. Bazı kelimelerin tekrar ettiği bir cümle düşünün. 
 İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmak.
  String = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
  Merhaba 1 kere, nasılsınız 2 kere iyiyim 2 kere
 
 */
