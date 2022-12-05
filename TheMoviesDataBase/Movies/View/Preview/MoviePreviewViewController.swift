//
//  MoviePreviewViewController.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 05/12/22.
//

import UIKit

class MoviePreviewViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    var cardMovie: CardMovieModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styles()
    }
    
    private func styles(){
        
        movieTitle.font = .preferredFont(forTextStyle: .largeTitle)
        movieDesc.font = .systemFont(ofSize: 40, weight: .semibold)
        
    }
}
