//
//  Movie.swift
//  Movies
//
//  Created by Yernar Masujima on 8/7/22.
//

import Foundation

struct Movie: Codable {
    let backdropPath: String
    let id: Int
    let overview: String
    let title: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case overview
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
