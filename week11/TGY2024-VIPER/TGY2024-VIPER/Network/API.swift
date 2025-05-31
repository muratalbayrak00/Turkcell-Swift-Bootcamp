//
//  API.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 11.05.2024.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Router {
    case arts
    case home
    case science
    
    var path: String {
        switch self {
        case .arts:
            return "arts.json"
        case .home:
            return "home.json"
        case .science:
            return "science.json"
        }
    }
    
}

final class API {
    
    static let shared: API = {
        let instance = API()
        return instance
    }()
    
    private let apiKey = "fgz3hvgork8dBwK88xtZcE5jNRFSdsyT"
    
    var baseURL = "https://api.nytimes.com/svc/topstories/v2/"
    
    private var service: NetworkService
    
    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
}

extension API {
    func isConnectedToInternet() -> Bool {
        return Reachability.isConnectedToNetwork()
    }
    
    func exequteRequestFor<T: Decodable>(
        router: Router,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        method: RequestMethod = .get,
        completion: @escaping(Result<T, NetworkError>) -> Void
    ) {
        
        if let urlRequest = prepareURLRequestFor(
            router: router,
            parameters: parameters,
            headers: headers,
            method: method
        ) {
            service.execute(urlRequest: urlRequest, completion: completion)
        } else {
            completion(.failure(.invalidRequest))
        }
        
    }
    
    func prepareURLRequestFor(
        router: Router,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        method: RequestMethod = .get
    ) -> URLRequest? {
        let urlString = baseURL + router.path + "?api-key=" + apiKey
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        
        if let params = parameters {
            if method == .get  {
                guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                    return nil
                }
                
                let queryItems = params.map {
                    URLQueryItem(name: $0.key, value: String(describing: $0.value))
                }
                
                urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
                
                guard let newUrl = urlComponents.url else { return nil }
                
                request = URLRequest(url: newUrl)
            } else {
                let jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                request.httpBody = jsonData
            }
        }
        
        request.httpMethod = method.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let requestHeaders = headers {
            for (field, value) in requestHeaders {
                request.setValue(value, forHTTPHeaderField: field)
            }
        }
        
        return request
    }
}
