//
//  ForumService + Extension.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import Foundation
import Moya

extension ForumService: TargetType {
    
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getPosts(let userId):
            return "/users/\(userId)/posts"
        case .getComments(let postId):
            return "/posts/\(postId)/comments"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUsers, .getPosts, .getComments:
            return .get
        }
    }
    
    var task: Moya.Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
    
    
}
