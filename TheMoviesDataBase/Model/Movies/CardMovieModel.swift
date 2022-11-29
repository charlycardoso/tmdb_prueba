//
//  CardMovieModel.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import Foundation

struct CardMovieModel : Identifiable {
    var id:Int
    var image: String
    var title:String
    var date:String
    var rating:String
    var description: String
}
