//
//  MovieApiResponse.swift
//  Movies
//
//  Created by Yernar Masujima on 8/7/22.
//

import Foundation

struct Popular: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum Popular: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
