//
//  File.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import Foundation

class Passenger {
    var name: String = "isimsiz"
    var surname: String = "isimsiz"
    var id: Int = 0
    
    init(name: String, surname: String, id: Int) {
        self.name = name
        self.surname = surname
        self.id = id
    }
    
    func print(){
        Swift.print("passenger print statetment")
    }
}
