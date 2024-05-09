//
//  Comment.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import Foundation

struct Comment: Decodable {
    let id, postId: Int?
    let name, email, body: String?
}
