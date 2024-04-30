//
//  UpcomingMovie.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 4.04.2024.
//

import Foundation

struct UpcomingMovie: Decodable {
    let results: [UpcomingMovieResult]?
    let page, totalPages, totalResults: Int
    let dates: UpcomingDates
    
    enum CodingKeys: String, CodingKey {
        case results, page, dates
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct UpcomingDates: Decodable {
    let minimum, maximum: String
}

struct UpcomingMovieResult: Decodable {
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
