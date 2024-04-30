//
//  Section.swift
//  Week-8
//
//  Created by Kerim Çağlar on 2.04.2024.
//

import Foundation

struct Section: Decodable, Hashable {
    let id: Int
    let type, title, subtitle: String
    let items: [EDevlet]
}
