//
//  ServiceLayer.swift
//  Coppel
//
//  Created by Charly Cardoso on 15/11/22.
//

import Foundation
import UIKit

@MainActor
class ServiceLayer {
    
    static func callService<T: Decodable>(_ requestModel: RequestModel, _ modelType: T.Type) async throws -> T {
        
        //GET query params
        var serviceURL = URLComponents(string: requestModel.getURL())
        serviceURL?.queryItems = buildQueryItems(params: requestModel.queryItems ?? [:])
        serviceURL?.queryItems?.append(URLQueryItem(name: "api_key", value: Constants.apiKey))
        
        //Unwrap URL
        guard let componentURL = serviceURL?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: componentURL)
        request.httpMethod = requestModel.httpMethod.rawValue
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else{
                throw NetworkError.httpResponseError
            }
            
            if (httpResponse.statusCode > 299){
                //se evalúa si el error es por desautorización para mandar los avisos correspondientes al usuario
                if httpResponse.statusCode != 401 {
                    throw NetworkError.statusCodeError
                }
            }
            
            let decoder = JSONDecoder()
            do{
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            }catch{
                throw NetworkError.couldNotDecodeData
            }
        }catch{
            throw NetworkError.generic
        }
    }
    
    static func buildQueryItems(params: [String:String]) -> [URLQueryItem]{
        let items = params.map({URLQueryItem(name: $0, value: $1)})
        return items
    }
}
