//
//  MovieLogicProtocol.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 4.04.2024.
//

import Foundation

protocol MovieLogicProtocol {
    func getUpcomingMovies(completionHandler: @escaping (Result<UpcomingMovie, Error>) -> Void)
    func getNowPlayingMovies(completionHandler: @escaping (Result<NowPlayingMovie, Error>) -> Void)
}
