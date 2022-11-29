//
//  LoginResponse.swift
//  Coppel
//
//  Created by Charly Cardoso on 28/10/22.
//

import Foundation
struct LoginResponse: Decodable {
    let success: Bool
    let expiresAt, requestToken: String?
    
    //respuestas de error
    let statusCode:Int?
    let statusMessage:String?

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        
        //respuestas de error
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
