//
//  MoviesViewController.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var presenter = MoviesPresenter()
    private let cellWidthSize = UIScreen.main.bounds.width / 2
    
    var movies: [CardMovieModel] = []
    
    override func viewDidLoad() {
        
        Task(priority: .high) {
            await loadData()
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(
                nibName: "MovieCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "mycell"
        )
        
        print("movies: \(movies)")
    }
    
    private func loadData() async {
        movies = await presenter.popularMovies()
    }
}


extension MoviesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? MovieCollectionViewCell
        
        cell!.movieTitle.text = movies[indexPath.row].title
        
        cell!.labelDate.text = movies[indexPath.row].date
        cell!.labelRating.text = movies[indexPath.row].rating
        cell!.labelDesc.text = movies[indexPath.row].description
        
        return cell!
    }
}


extension MoviesViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidthSize, height: 600)
    }
}
