import UIKit

// --------------- Murat Albayrak ----------------
// ------- PROJECT EULER 7 ------------
/*
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the nth prime number?
 
 */

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

func nthPrime(_ number: Int) -> Int{
    var count = 0
    var prime = 2
    var ntPrime = 2
    while count < (number - 1) {
        if isPrime(prime) {
            ntPrime = prime
            count += 1
        }
        prime += 1
    }
    return ntPrime
}

let n = 10001
let result = nthPrime(n)
print("The \(n)th prime number is \(result)")

