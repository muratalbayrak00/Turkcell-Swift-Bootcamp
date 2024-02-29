import UIKit
import Foundation

// --------------- Murat Albayrak ----------------
// Fonksiyona parametre olarak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yazınız.
// Örneğin 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde olmalıdır

var number: Int = 5

var str = ""
for i in 1...number {
    i % 2 == 0 ? str.append("-") : str.append("+")
}
print(str)
