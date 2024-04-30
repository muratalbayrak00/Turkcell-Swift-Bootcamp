//
//  NowPlayingMovie.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 4.04.2024.
//

import Foundation

struct NowPlayingMovie: Decodable {
    let results: [NowplayingMovieResult]?
    let page, totalPages, totalResults: Int
    let dates: NowplayingDates
    
    enum CodingKeys: String, CodingKey {
        case results, page, dates
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}


struct NowplayingDates: Decodable {
    let minimum, maximum: String
}

struct NowplayingMovieResult: Decodable {
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let title: String?
    let posterPath: String?
    let overview: String?
    let releaseDate: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, title, adult, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
