//
//  ForumNetworkManager.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import RxSwift //Combine
import Moya
import RxMoya

struct ForumNetworkManager {
    
    static let shared = ForumNetworkManager()
    private init() { }
    
    private let provider = MoyaProvider<ForumService>()
    
    func getUsers() -> Single<[User]> {
        return provider.rx
            .request(.getUsers)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([User].self)
    }
    
    func getUserPosts(for userId: Int) -> Single<[Post]> {
        return provider.rx
            .request(.getPosts(userId))
            .filterSuccessfulStatusCodes()
            .map([Post].self)
    }
    
    func getPostComments(for postId: Int) -> Single<[Comment]> {
        return provider.rx
            .request(.getComments(postId))
            .filterSuccessfulStatusCodes()
            .map([Comment].self)
    }
}
