//
//  Constants.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 4.04.2024.
//

import Foundation

struct Constant {
    // eski apikey 4e28d55297bdf1431d184c5c5096c538
    // yenisi 29f2b8e6dc4f8bae38a0cac876b994a7
    static let apiKey: String = "29f2b8e6dc4f8bae38a0cac876b994a7"
    static let baseURL: String = "https://api.themoviedb.org/3/movie/"
    static let imageBaseURL: String = "https://image.tmdb.org/t/p/w500/"
    static let upcomingURL: String = baseURL + "upcoming?api_key=" + apiKey + "&language=en-US&page=1"
   // static let upcomingURL: String = "https://api.rawg.io/api/games?key=611c10bfc91f46ec98465ba3b7d208ec&page=3"
    static let nowPlayingURL: String = baseURL + "now_playing?api_key=" + apiKey + "&language=en-US&page=1"
   // static let nowPlayingURL: String = "https://api.rawg.io/api/games?key=611c10bfc91f46ec98465ba3b7d208ec&page=3"
    static let searchMovieURL: String = baseURL + "search/movie?api_key=" + apiKey + "&language=en-US&page=1&query="
    static let movieDetailURL: String = baseURL + "?api_key=" + apiKey + "&language=en-US&page=1"
}
