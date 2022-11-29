//
//  ViewController.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 16/11/22.
//

import UIKit

class ViewControllerMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        title = "Main controller"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "login", style: .done, target: self, action: #selector(nextViewController))
    }

    @objc
    private func nextViewController(){
        let loginView = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginView, animated: true)
    }
}

