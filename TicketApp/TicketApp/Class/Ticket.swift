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
    var date: DateClass
    var time: Time
    
    var seats: [Int] = []
    var numberOfSeat : Int
    
    init(_ passenger: Passenger,_ date: DateClass,_ time: Time,_ seats: [Int],_ numberOfSeat: Int) {
        self.passenger = passenger
        self.date = date
        self.time = time
        self.seats = seats
        self.numberOfSeat = numberOfSeat
    }
    
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
    func reserveSeat(numberSeats: Int) {
        guard numberSeats >= 1 && numberSeats <= 5 else {
            Swift.print("Hata: Koltuk sayısı 1 ile 5 arasında olmalıdır.")
            return
        }
        
        if numberOfSeat == 0 {
            numberOfSeat = numberSeats
            seats = Array(1...numberSeats)
            Swift.print("\(numberSeats) koltuk başarıyla ayrıldı.")
        } else {
            Swift.print("Hata: Koltuklar zaten ayrılmış.")
        }
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
        Swift.print("\(passenger.print())\(date.print())\(time.print())\(self.seats)")
    }
  
}
