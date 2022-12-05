//
//  MoviesViewController.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var presenter = MoviesPresenter(delegate: self)
    private let cellWidthSize = UIScreen.main.bounds.width * 0.42
    
    var moviesArray: [CardMovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(
                nibName: "MovieCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "mycell"
        )
        
        Task {
            await presenter.popularMovies()
        }
    }
    
}


extension MoviesViewController: UICollectionViewDataSource, MoviesProtocol {
    
    func getMovies(movies: [CardMovieModel]) {
        moviesArray = movies
        collectionView.reloadData()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? MovieCollectionViewCell
        
        cell?.movieImage.loadFrom(URLAddress: "https://image.tmdb.org/t/p/original/\(moviesArray[indexPath.row].image)")
        
        cell!.movieTitle.text = moviesArray[indexPath.row].title
        
        cell!.labelDate.text = moviesArray[indexPath.row].date
        cell!.labelRating.text = moviesArray[indexPath.row].rating
        cell!.labelDesc.text = moviesArray[indexPath.row].description
        
        return cell!
    }
}


extension MoviesViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidthSize, height: 370)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
