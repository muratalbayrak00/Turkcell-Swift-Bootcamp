//
//  Post.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import Foundation

struct Post: Decodable {
    let id, userId: Int?
    let title, body: String?
}
