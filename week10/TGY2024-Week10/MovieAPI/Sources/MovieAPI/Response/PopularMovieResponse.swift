//
//  PopularMovieResponse.swift
//
//
//  Created by Kerim Çağlar on 4.05.2024.
//

import Foundation

public struct PopularMovieResponse: Decodable {
    
    public let results: [Movie]
    
    private enum RootCodingKeys: String, CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try container.decode([Movie].self, forKey: .results)
    }
}
