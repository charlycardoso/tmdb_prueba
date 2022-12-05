//
//  PopularMoviesListModel.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 17/11/22.
//

import Foundation

// MARK: - PopularMoviesListModel
struct PopularMoviesListModel: Decodable {
    let page: Int
    let results: [PopularMovieModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
