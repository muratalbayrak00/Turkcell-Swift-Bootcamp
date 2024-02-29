import UIKit

// --------------- Murat Albayrak ----------------
/* Project Euler 6: Find the difference between the sum of the squares of the
 first n natural numbers and the square of the sum. */

let n = 100

func sumOfSquare(_ number: Int) -> Int {
    var sumOfSquare = 0
    for i in 1...n {
        sumOfSquare += i * i
    }
    return sumOfSquare
}

func squareOfSum(_ number: Int) -> Int {
    var sum = 0
    for i in 1...n {
        sum += i
    }
    return sum * sum
}

let difference = squareOfSum(n) - sumOfSquare(n)
print(difference)

