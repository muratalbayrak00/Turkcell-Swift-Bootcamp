//
//  ServiceManager.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 11.05.2024.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchNews(completion: @escaping(Result<NewsData, NetworkError>) -> Void)
}

extension API: NewsServiceProtocol {
    
    func fetchNews(completion: @escaping (Result<NewsData, NetworkError>) -> Void) {
        exequteRequestFor(router: .home, completion: completion)
    }
}
