//
//  Time.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit
import Foundation

class Time {
    
    var hour: Int
    var minute: Int
    
    init(hour: Int = 0, minute: Int = 0) {
        self.hour = hour
        self.minute = minute
    }
    
    func print(){
        Swift.print("\(self.hour):\(self.minute)")
    }
  
}
