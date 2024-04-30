//
//  Item.swift
//  Week-9-SwiftUI
//
//  Created by Kerim Çağlar on 18.04.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
