//
//  NewTokenResponse.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 17/11/22.
//

import Foundation
// MARK: - NewTokenResponse
struct NewTokenResponse: Codable {
    let success: Bool
    let expiresAt, requestToken: String?
    
    //respuestas de error
    let statusCode:Int?
    let statusMessage:String?
    //let success:Bool?

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        
        //respuestas de error
        case statusCode = "status_code"
        case statusMessage = "status_message"
        //case success
    }
}
