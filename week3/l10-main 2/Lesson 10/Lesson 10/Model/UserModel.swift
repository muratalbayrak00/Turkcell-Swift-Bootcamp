//
//  UserModel.swift
//  Lesson 10
//
//  Created by Kerem Demir on 8.03.2024.
//

import Foundation

// MARK: Codable = Decodable & Encodable !!! MULAKAT SORUSUDUR !!!

struct User: Decodable{
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
}


// https://jsonplaceholder.typicode.com/users // Modelledigimiz JSON'larin sitesi.
