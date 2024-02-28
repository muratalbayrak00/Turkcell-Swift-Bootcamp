import Foundation

/*
 Oluşturacağınız script dosyasında, en az 5 şehirden oluşan bir array olsun.
 Klavyeden girdiğiniz şehrin array in kaçıncı elemanı olduğunu dönen bir script yazın
 */


var cities = ["Istanbul", "New York", "Ankara", "Berlin", "Paris"]

print("Please enter a city name")

if let input = readLine() {
    for i in 0..<cities.count {
        if input.lowercased() == cities[i].lowercased() {
            print("City found at index \(i)")
        }
    }
   
} else {
    print("Invalid input")
}
