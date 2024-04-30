//
//  MovieLogic.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 4.04.2024.
//

import Foundation

final class MovieLogic: MovieLogicProtocol {
    
    static let shared: MovieLogic = {
       let instance = MovieLogic()
        return instance
    }()
    
    private init() {}
    
    func getUpcomingMovies(completionHandler: @escaping (Result<UpcomingMovie, Error>) -> Void) {
        Webservice.shared.request(request: Router.upcoming, decodeToType: UpcomingMovie.self, completionHandler: completionHandler)
    }
    
    func getNowPlayingMovies(completionHandler: @escaping (Result<NowPlayingMovie, Error>) -> Void) {
        Webservice.shared.request(request: Router.nowPlaying, decodeToType: NowPlayingMovie.self, completionHandler: completionHandler)
    }
    
}
