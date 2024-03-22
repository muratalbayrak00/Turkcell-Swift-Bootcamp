//
//  Ticket.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit
import Foundation

class Ticket {
    
   
    
    var passenger: Passenger
    var date: Date
    var time: Time
    
    var seats: [Int] = []
    var numberOfSeat : Int
    
    init(passenger: Passenger, date: Date, time: Time, seats: [Int], numberOfSeat: Int) {
        self.passenger = passenger
        self.date = date
        self.time = time
        self.seats = seats
        self.numberOfSeat = numberOfSeat
    }
    

    /*
     func karsilastir(bilet: Bilet) -> Bool {
         for koltukNo in koltuk {
             if bilet.koltuk.contains(koltukNo) {
                 print("Hata: Bir veya daha fazla koltuk zaten satılmış.")
                 return true
             }
         }
         return false
     }
     */
 
    func compare(ticket: Ticket) -> Bool {
        for seatNo in seats {
            if ticket.seats.contains(seatNo) {
                Swift.print("bir yada daha fazla koltuk zaten satilmis.")
                return true
            }
        }
        return false
    }
    
    /*
     Parametre “koltukSayisi”, 1 ile 5 arasında değer alabilir. Eğer koltukSayisi
     bu fonksiyon çağrılmadan önce sıfırdan büyük ise, hiçbir işlem yapılmaz. Eğer
     sıfır ise, koltukSayisi değişkenine, verilen parametre değeri atanır. Ayrıca,
     bu değer büyüklüğünde koltuk dizisi oluşturulur.
     */
    func reserveSeat() {
        
    }
    
    // Parametre olarak verilen numara 1 ile 45 arasında olabilir. Parametre değeri, koltuk dizisine kaydedilir.
    func addSeatNumber(_ number: Int) {
        guard number >= 1 && number <= 45 else {
            Swift.print("Hata: Koltuk numarası 1 ile 45 arasında olmalıdır.")
                return
            }
            
            if !seats.contains(number) {
                seats.append(number)
                Swift.print("Koltuk numarası \(number) başarıyla eklendi.")
            } else {
                Swift.print("Hata: Bu koltuk numarası zaten mevcut.")
            }
    }
    
    func removeSeatNumber(_ number: Int) {
        guard number >= 1 && number <= 45 else {
            Swift.print("Hata: Koltuk numarası 1 ile 45 arasında olmalıdır.")
            return
        }
        
        if let index = seats.firstIndex(of: number) {
            seats.remove(at: index)
            Swift.print("Koltuk numarası \(number) başarıyla kaldırıldı.")
        } else {
            Swift.print("Hata: Bu koltuk numarası mevcut değil.")
        }
    }
    
    func print(){
        Swift.print("ticket print statetment")
    }
  
}
/*
 class Yolcu {
     var adi: String
     var soyadi: String
     var id: Int
     
     init(adi: String = "İsimsiz", soyadi: String = "İsimsiz", id: Int = 0) {
         self.adi = adi
         self.soyadi = soyadi
         self.id = id
     }
     
     func yazdir() {
         print("\(adi) \(soyadi) \(id)")
     }
 }

 class Tarih {
     var gun: Int
     var ay: Int
     var yil: Int
     
     init(gun: Int = 1, ay: Int = 1, yil: Int = 2021) {
         self.gun = gun
         self.ay = ay
         self.yil = yil
     }
     
     func yazdir() {
         print("\(gun)/\(ay)/\(yil)")
     }
 }

 class Saat {
     var saat: Int
     var dakika: Int
     
     init(saat: Int = 0, dakika: Int = 0) {
         self.saat = saat
         self.dakika = dakika
     }
     
     func yazdir() {
         print("\(saat):\(dakika)")
     }
 }

 class Bilet {
     var yolcu: Yolcu
     var tarih: Tarih
     var saat: Saat
     var koltuk: [Int]
     var koltukSayisi: Int
     
     init(yolcu: Yolcu, tarih: Tarih, saat: Saat, koltukSayisi: Int = 0) {
         self.yolcu = yolcu
         self.tarih = tarih
         self.saat = saat
         self.koltuk = []
         self.koltukSayisi = koltukSayisi
     }
     
     func yazdir() {
         print("\(yolcu.adi) \(yolcu.soyadi) \(yolcu.id), ", terminator: "")
         tarih.yazdir()
         print(", ", terminator: "")
         saat.yazdir()
         print(" |", terminator: "")
         for koltukNo in koltuk {
             print(" \(koltukNo)", terminator: "")
         }
         print()
     }
     
     func karsilastir(bilet: Bilet) -> Bool {
         for koltukNo in koltuk {
             if bilet.koltuk.contains(koltukNo) {
                 print("Hata: Bir veya daha fazla koltuk zaten satılmış.")
                 return true
             }
         }
         return false
     }
     
     func koltukAyir(koltukSayisi: Int) {
         guard koltukSayisi >= 1 && koltukSayisi <= 5 else {
             print("Hata: Koltuk sayısı 1 ile 5 arasında olmalıdır.")
             return
         }
         
         if self.koltukSayisi == 0 {
             self.koltukSayisi = koltukSayisi
             self.koltuk = Array(1...koltukSayisi)
         }
     }
     
     func koltukNoEkle(numara: Int) {
         guard numara >= 1 && numara <= 45 else {
             print("Hata: Koltuk numarası 1 ile 45 arasında olmalıdır.")
             return
         }
         
         if !koltuk.contains(numara) {
             koltuk.append(numara)
         } else {
             print("Hata: Bu koltuk numarası zaten mevcut.")
         }
     }
 }

 // Örnek kullanım:
 let yolcu1 = Yolcu(adi: "Ahmet", soyadi: "Yılmaz", id: 123)
 let tarih1 = Tarih(gun: 15, ay: 3, yil: 2024)
 let saat1 = Saat(saat: 14, dakika: 30)
 let bilet1 = Bilet(yolcu: yolcu1, tarih: tarih1, saat: saat1)

 bilet1.koltukAyir(koltukSayisi: 3)
 bilet1.koltukNoEkle(numara: 5)
 bilet1.koltukNoEkle(numara: 10)
 bilet1.koltukNoEkle(numara: 5) // Hata: Bu koltuk numarası zaten mevcut.
 bilet1.yazdir() // Ahmet Yılmaz 123, 15/3/2024, 14:30 | 1 2 3 5 10

 */
