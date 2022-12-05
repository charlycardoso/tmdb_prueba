//
//  RequestModel.swift
//  Coppel
//
//  Created by Charly Cardoso on 15/11/22.
//

import Foundation
struct RequestModel {
    let endpoint: Endpoints
    var queryItems: [String:String]?
    var httpMethod: HttpMethod = .GET
    var baseURL: URLBase = .movieDatabase
    
    func getURL()->String{
        return baseURL.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod : String {
        case GET
        case POST
    }
    
    enum Endpoints : String {
        case login = "authentication/token/validate_with_login"
        case requestToken = "authentication/token/new"
        case popularMovies = "/movie/popular"
        case topRated = "/movie/top_rated"
        case onTV = "/tv/popular"
        case airingToday = "/tv/airing_today"
    }
    
    enum URLBase : String {
        case movieDatabase = "https://api.themoviedb.org/3/"
    }
}
