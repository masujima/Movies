//
//  MoviesService.swift
//  Movies
//
//  Created by Yernar Masujima on 8/7/22.
//

import Foundation

protocol MoviesServiceable {
    func getPopular() async -> Result<Popular, RequestError>
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError>
}

struct MoviesService: HTTPClient, MoviesServiceable {
    func getPopular() async -> Result<Popular, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.popular, responseModel: Popular.self)
    }
    
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
    }
}
