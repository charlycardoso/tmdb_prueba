//
//  MoviesProvider.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import Foundation

protocol MoviesProviderProtocol {
    func getPopularMovies() async throws -> PopularMoviesListModel
    func getTopRated()
    func getOnTV()
    func airingToday()
}

class MoviesProvider : MoviesProviderProtocol {
    
    func getPopularMovies() async throws -> PopularMoviesListModel {
        let queryParams = [
            "language":"es",
            "page":"1"
        ]
        let requestModel = RequestModel(endpoint: .popularMovies, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel, PopularMoviesListModel.self)
            return model
        }catch{
            throw error
        }
    }
    
    func getTopRated() {
        print("algo")
    }
    
    func getOnTV() {
        print("algo")
    }
    
    func airingToday() {
        print("algo")
    }
    
    
}
