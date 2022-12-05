//
//  MovieCollectionViewCell.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styles()
    }

    private func styles(){
        
        container.backgroundColor = .gray
        container.layer.cornerRadius = 24
        container.layoutMargins.bottom = 15
        
        movieImage.layer.cornerRadius = 24
        
        movieTitle.font = .systemFont(ofSize: 15, weight: .bold)
        movieTitle.textColor = .systemGreen
        
        labelDesc.numberOfLines = 4
        labelDesc.font = .systemFont(ofSize: 10, weight: .semibold)
        labelDesc.textAlignment = .left
        labelDesc.textColor = .systemGreen
    }
    
    
}
