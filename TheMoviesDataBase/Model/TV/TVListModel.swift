//
//  TVListModel.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 04/12/22.
//

import Foundation

// MARK: - TVListModel
struct TVListModel: Decodable {
    let page: Int
    let results: [TVChannelsModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
