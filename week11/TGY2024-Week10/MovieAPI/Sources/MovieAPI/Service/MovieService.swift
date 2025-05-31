//
//  MovieService.swift
//
//
//  Created by Kerim Çağlar on 4.05.2024.
//

import Foundation
import Alamofire

public protocol MovieServiceProtocol {
    func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
}

public class MovieService: MovieServiceProtocol {
    
    public init() {}
    
    public func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=fd2b04342048fa2d5f728561866ad52a&language=en-US&page=1"
        
        AF.request(urlString).responseData { [weak self] response in
            guard let self else { return }
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dateDecoder
                
                do {
                    let response = try decoder.decode(PopularMovieResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print("******* JSON DECODE ERROR ******")
                }
                
            case .failure(let error):
                print("***** Lütfen daha sonra tekrar deneyiniz..****")
            }
            
        }
        
        
    }
    
}
