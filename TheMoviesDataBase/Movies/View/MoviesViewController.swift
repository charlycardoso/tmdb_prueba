//
//  MoviesViewController.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 20/11/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var presenter = MoviesPresenter(delegate: self)
    private let cellWidthSize = UIScreen.main.bounds.width * 0.42
    
    var moviesArray: [CardMovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(
                nibName: "MovieCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "mycell"
        )
        
        loadPopularMovies()
    }
    
    
    @IBAction func mostrarPantallas(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                loadPopularMovies()
            case 1:
                //cargar top rated
                loadTopRatedMovies()
            case 2:
                //cargar on tv
                loadOnTV()
            case 3:
                //cargar airing today
                loadAiringToday()
            default:
                loadPopularMovies()
        }
        
    }
    
    private func loadPopularMovies(){
        Task {
            await presenter.popularMovies()
        }
    }
    
    private func loadTopRatedMovies(){
        Task{
            await presenter.topRated()
        }
    }
    
    private func loadOnTV(){
        Task{
            await presenter.onTV()
        }
    }
    
    private func loadAiringToday(){
        Task{
            await presenter.airingToday()
        }
    }
    
    @objc private func onTap(_ sender: UITapGestureRecognizer){
        
        //desplegar detalles
        let vc = storyboard?.instantiateViewController(identifier: "MoviePreviewViewController") as? MoviePreviewViewController

        navigationController?.present(vc!, animated: true)
        
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
        
//        cell!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap(_:))))
        
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
