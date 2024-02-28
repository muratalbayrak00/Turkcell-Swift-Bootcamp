import Foundation
// ------------------------   Week2 Homework 2 -----------------------------

/* => Project Euler 4

 A palindromic number reads the same both ways. The largest palindrome
 made from the product of two 2-digit numbers is 9009 = 91 × 99.

 Find the largest palindrome made from the product of two n-digit numbers.
 
 */


var n = 2
var nDigit = Int(pow(10, Double(n))-1)
var largestNumber = 0
for i in (0...nDigit).reversed() {
    
    for j in (0...nDigit).reversed() {
        var product = i * j
        
        if isPalindrome(product) && product > largestNumber {
            largestNumber = product
            
            
        }
        if i == 0 {
            break
        }
    }
}
print(largestNumber)


func isPalindrome(_ product: Int) -> Bool {
    let numberString = String(product)
    return numberString == String(numberString.reversed())
}



/* =>  Project Euler 5

 2520 is the smallest number that can be divided by each of the 
 numbers from 1 to 10 without any remainder.

 What is the smallest positive number that is evenly divisible 
 by all of the numbers from 1 to n? */


var number = 20

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    
    while b != 0 {
        let temp = b
        b = a % b
        a = temp
    }
    
    return a
    
}


func lcm(_ a: Int, _ b: Int) -> Int {
    return a / gcd(a,b) * b
}


func smallestMultiple(_ n: Int) -> Int {
    var result = 1
    for i in 2...n {
        result = lcm(result, i)
    }
    return result
}

smallestMultiple(number)
