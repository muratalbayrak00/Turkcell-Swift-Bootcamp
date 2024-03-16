//
//  Time.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit
import Foundation

class Time {
    
    var hour: String = "00"
    var minute: String = "00"
    
    init(hour: String, minute: String) {
        self.hour = hour
        self.minute = minute
    }
    
    func print(){
        Swift.print("time print statetment")
    }
  
}
