//
//  Date.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import Foundation

class Date {
    
    var day: Int = 0
    var month: Int = 0
    var year: Int
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func print(){
        Swift.print("date print statetment")
    }
  
}
