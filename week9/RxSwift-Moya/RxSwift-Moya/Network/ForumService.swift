//
//  ForumService.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import Foundation

enum ForumService {
    case getUsers
    case getPosts(_ userId: Int)
    case getComments(_ postId: Int)
}
