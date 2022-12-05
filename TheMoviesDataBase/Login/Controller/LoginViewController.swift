//
//  LoginViewController.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 16/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var presenter = LoginPresenter()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styles()
    }
    
    @IBAction func login(_ sender: Any) {
        errorLabel.isHidden = true
        
        if usernameTextField.isNotBlank() && passwordTextField.isNotBlank() {
            Task{
                let login = await presenter.login(username:  usernameTextField.text!,password: passwordTextField.text!)
                
                errorLabel.isHidden = login.status
                errorLabel.text = login.message
                
                if login.status {
                    //ir a movies
                    let vc = storyboard?.instantiateViewController(identifier: "MoviesViewController") as? MoviesViewController
                    
                    navigationController?.show(vc!, sender: nil)
                }
            }
        }else{
            errorLabel.isHidden = false
            errorLabel.text = "Por favor ingrese sus credenciales"
        }
    }
}

//se colocan todos los estilos a cargar
extension LoginViewController {
    
    func styles(){
        //background
        backgroundImage.tintColor = .black
        backgroundImage.alpha = 0.9
        
        //error label
        errorLabel.numberOfLines = 2
        errorLabel.isHidden = true
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.text = ""
        
        //button
        loginButton.tintColor = .lightGray
        
        //textfields
        usernameTextField.textContentType = .username
        passwordTextField.textContentType = .password
        
    }
}
