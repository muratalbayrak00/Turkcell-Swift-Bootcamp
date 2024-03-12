

import Foundation

// MARK: Codable = Decodable & Encodable !!! MULAKAT SORUSUDUR !!!

struct User: Decodable{
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
}


// https://jsonplaceholder.typicode.com/users // Modelledigimiz JSON'larin sitesi.
