//
//  LoginPresenter.swift
//  Coppel
//
//  Created by Charly Cardoso on 15/11/22.
//

import Foundation

@MainActor class LoginPresenter {
    
    var provider: LoginProvider
    
    init(provider: LoginProvider = LoginProvider()) {
        self.provider = provider
    }
    
    func login(username:String, password:String) async -> LoginStatus{
        do{
            let newToken = try await provider.getNewRequestToken()
            if newToken.success {
                let login = try await provider.login(username: username, password: password, requestToken: newToken.requestToken!)
                return LoginStatus(status: login.success, message: login.statusMessage ?? "")
            }else{
                return LoginStatus(status: false, message: "No fue posible generar el token, verifique sus credenciales e inténtelo de nuevo.")
            }
            
        }catch{
            return LoginStatus(status: false, message: "Ha ocurrido un error desconocido, inténtelo de nuevo más tarde")
        }
    }
}

struct LoginStatus{
    let status:Bool
    let message:String
}
