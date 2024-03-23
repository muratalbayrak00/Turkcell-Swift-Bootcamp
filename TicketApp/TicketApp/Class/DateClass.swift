//
//  Date.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import Foundation

class DateClass {
    
    var day: Int
    var month: Int
    var year: Int
    
    init(day: Int = 1, month: Int = 1, year: Int = 2023) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func print(){
        Swift.print("\(self.day)/\(self.month)/\(self.year)")
    }
  
}
