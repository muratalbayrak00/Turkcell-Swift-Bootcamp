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
    var seat: Int
    var numberOfSeat : Int
    
    init(passenger: Passenger, date: Date, time: Time, seat: Int, numberOfSeat: Int) {
        self.passenger = passenger
        self.date = date
        self.time = time
        self.seat = seat
        self.numberOfSeat = numberOfSeat
    }
    

    
 
    func compare() {
    
    }
    
    func reserveSeat() {
        
    }
    
    func addSeatNumber() {
        
    }
    
    func print(){
        Swift.print("ticket print statetment")
    }
  
}
