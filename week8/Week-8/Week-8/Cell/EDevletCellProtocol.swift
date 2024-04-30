//
//  EDevletCellProtocol.swift
//  Week-8
//
//  Created by Kerim Çağlar on 2.04.2024.
//

import Foundation

protocol EDevletCellProtocol {
    static var reuseIdentifier: String { get }
    func configure(with edevlet: EDevlet)
}
