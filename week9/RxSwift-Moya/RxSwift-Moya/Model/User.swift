//
//  User.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let name, username, email: String?
}
