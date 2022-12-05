//
//  MoviesPresenter.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

protocol MoviesProtocol : AnyObject {
    func getMovies(movies: [CardMovieModel])
}

import Foundation
class MoviesPresenter {
    
    var provider: MoviesProvider
    weak var delegate: MoviesProtocol?
    var moviesArray: [CardMovieModel] = []
    
    init(delegate: MoviesProtocol, provider: MoviesProvider = MoviesProvider()) {
        self.delegate = delegate
        self.provider = provider
    }
    
    @MainActor 
    func popularMovies() async {
        moviesArray.removeAll()
        
        do{
            let movies = try await provider.getPopularMovies()
            
            for result in movies.results {
                let movie = CardMovieModel(id: result.id, image: result.backdropPath ?? "", title: result.title, date: result.releaseDate, rating: "\(result.voteAverage)", description: result.overview)
                moviesArray.append(movie)
            }
            
            delegate?.getMovies(movies: moviesArray)
            
        }catch let err{
            print("error: ", err)
        }
    }
    
}
