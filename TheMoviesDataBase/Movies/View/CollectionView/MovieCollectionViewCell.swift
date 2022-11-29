//
//  MovieCollectionViewCell.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .lightGray
        
        movieTitle.font = UIFont.boldSystemFont(ofSize: 20)
        movieTitle.textColor = .blue
        
        labelDesc.numberOfLines = 4
        labelDesc.textAlignment = .left
    }

}
