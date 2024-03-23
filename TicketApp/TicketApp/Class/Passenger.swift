//
//  File.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import Foundation

class Passenger {
    var name: String
    var surname: String
    var id: Int
  
    init(name: String = "isimsiz", surname: String = "isimsiz", id: Int = 0) {
        self.name = name
        self.surname = surname
        self.id = id
    }
    
    func print(){
        Swift.print("\(self.name) \(self.surname) \(self.id)")
        
    }
}
