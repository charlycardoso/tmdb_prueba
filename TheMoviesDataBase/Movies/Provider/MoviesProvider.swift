//
//  MoviesProvider.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import Foundation

protocol MoviesProviderProtocol {
    func getPopularMovies() async throws -> PopularMoviesListModel
    func getTopRated() async throws -> PopularMoviesListModel
    func getOnTV() async throws -> TVListModel
    func airingToday() async throws -> TVListModel
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
    
    func getTopRated() async throws -> PopularMoviesListModel {
        let queryParams = [
            "language":"es",
            "page":"1"
        ]
        let requestModel = RequestModel(endpoint: .topRated, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel, PopularMoviesListModel.self)
            return model
        }catch{
            throw error
        }
    }
    
    func getOnTV() async throws -> TVListModel {
        let queryParams = [
            "language":"es",
            "page":"1"
        ]
        let requestModel = RequestModel(endpoint: .onTV, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, TVListModel.self)
            return model
        }catch{
            throw error
        }
    }
    
    func airingToday() async throws -> TVListModel {
        let queryParams = [
            "language":"es",
            "page":"1"
        ]
        let requestModel = RequestModel(endpoint: .airingToday, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, TVListModel.self)
            return model
        }catch{
            throw error
        }
    }
    
    
}
