//
//  MoviesEndpoint.swift
//  Movies
//
//  Created by Yernar Masujima on 8/7/22.
//

import Foundation

public enum MoviesEndpoint {
    case popular
    case movieDetail(id: Int)
}

extension MoviesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .popular:
            return "/3/movie/popular"
        case .movieDetail(let id):
            return "/3/movie/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .popular, .movieDetail:
            return .get
        }
    }
    
    var header: [String : String]? {
        let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjhlMzkwMjE3NmYyOWY2ZWRiYmUyMjE1ODc1NzIxNSIsInN1YiI6IjYyZTg5YzM4MWM2MzViMDA1ZDVhYzk0ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UObQjjYonww8rLMeuIK56unAPnJd07pQZbM69zJsjnk"
        switch self {
        case .popular, .movieDetail:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .popular, .movieDetail:
            return nil
        }
    }
}
