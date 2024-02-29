import UIKit

// --------------- Murat Albayrak ----------------
// Question: Write the code that checks whether a number is palidrome or not.

let number = 1
let stringNumber = String(number)

if stringNumber == String(stringNumber.reversed()) {
    print("This number is a palindrome number")
} else {
    print("This number is not a palindrome number")
}
