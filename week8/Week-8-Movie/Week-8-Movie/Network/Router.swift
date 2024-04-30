//
//  Router.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 4.04.2024.
//

import Alamofire
import Foundation

enum Router: URLRequestConvertible {

    
    case upcoming
    case nowPlaying
    case detail(movieId: String) //Int olabilir
    case search(query: String)
    
    var method: HTTPMethod {
        switch self {
        case .upcoming, .nowPlaying, .detail, .search:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .upcoming, .nowPlaying, .detail, .search:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        JSONEncoding.default
    }
    
    var url: URL {
        switch self {
        case .upcoming:
            let url = URL(string: Constant.upcomingURL)
            return url!
        case .nowPlaying:
            let url = URL(string: Constant.nowPlayingURL)
            return url!
        case .detail: //parametre almalı
            let url = URL(string: Constant.movieDetailURL)
            return url!
        case .search: // query almalı
            let url = URL(string: Constant.searchMovieURL)
            return url!
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
