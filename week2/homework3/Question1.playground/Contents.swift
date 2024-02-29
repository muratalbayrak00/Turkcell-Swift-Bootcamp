import UIKit
import Foundation

// --------------- Murat Albayrak ----------------
// Question: Bir sayinin asal olup olmadigi bulan en optimum kodu yaziniz.

let number = 3

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    if number % 2 == 0 {
        return false
    }
    var i = 3
    while i * i <= number {
        if number % i == 0 {
            return false
        }
        i += 2
    }
    return true
}

isPrime(number)
