import UIKit

// --------------- Murat Albayrak ----------------
// Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını yanına koyunuz.
// Örneğin parametre 0 için çıktı 50 olmalıdır. Parametre 28 için 528, parametre 920 için 9520 olmalıdır

// 0 -> 50 , 28 -> 528,

let number: Int = 5527
var index: Int = 0
func addFive(_ number: Int) -> Int {
    var numberString = String(number)
    var str = ""
    var foundFive = false
    for char in numberString {
        if char <= "5" && !foundFive {
            str.append("5")
            str.append(char)
            foundFive = true
        } else {
            str.append(char)
        }
    }
    return Int(str)!
}

print(addFive(number))


