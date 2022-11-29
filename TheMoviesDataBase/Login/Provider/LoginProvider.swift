//
//  LoginProvider.swift
//  Coppel
//
//  Created by Charly Cardoso on 15/11/22.
//

import Foundation

protocol LoginProviderProtocol {
    func getNewRequestToken() async throws -> NewTokenResponse
    func login(username: String, password: String, requestToken: String) async throws -> LoginResponse
}

class LoginProvider : LoginProviderProtocol {
    
    func getNewRequestToken() async throws -> NewTokenResponse {
        //generar el token
        let requestModel = RequestModel(endpoint: .requestToken)
        do{
            let model = try await ServiceLayer.callService(requestModel, NewTokenResponse.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    func login(username: String, password: String, requestToken: String) async throws -> LoginResponse {
        //hacer login
        let queryParams : [String:String] = ["username": username, "password": password, "request_token": requestToken]
        let requestModel = RequestModel(endpoint: .login, queryItems: queryParams, httpMethod: .POST)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, LoginResponse.self)
            return model
        }catch{
            print("hubo un error: \(error.localizedDescription)")
            throw error
        }
    }
    
    
}
