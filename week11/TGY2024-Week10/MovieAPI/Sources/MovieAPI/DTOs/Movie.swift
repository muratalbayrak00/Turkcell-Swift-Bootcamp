//
//  Movie.swift
//
//
//  Created by Kerim Çağlar on 4.05.2024.
//

import Foundation

public struct MovieResult: Decodable {
    public let results: [Movie]?
    public let page, totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

public struct Movie: Decodable {
    
    public let id: Int?
    public let title: String?
    public let overview: String?
    public let posterPath: String?
    public let releaseDate: String?
    public let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    
}
