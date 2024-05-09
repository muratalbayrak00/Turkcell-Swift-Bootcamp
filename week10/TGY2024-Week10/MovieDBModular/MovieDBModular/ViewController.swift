//
//  ViewController.swift
//  MovieDBModular
//
//  Created by Kerim Çağlar on 4.05.2024.
//

import UIKit
import MovieAPI

extension ViewController {
    
    fileprivate enum Constants {
        static let cellTitleHeight: CGFloat = 50
        static let cellPosterImageRatio: CGFloat = 1/2
        static let cellLeftPadding: CGFloat = 16
        static let cellRightPadding: CGFloat = 16
    }
    
}

class ViewController: UIViewController, LoadingShowable {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let service: MovieServiceProtocol = MovieService()
    var movies = [Movie]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.register(UINib(nibName: "PopularMovieCell", bundle: nil), forCellWithReuseIdentifier: "PopularMovieCell")
        collectionView.register(cellType: PopularMovieCell.self)

    }

    fileprivate func fetchMovies() {
        showLoading()
        service.fetchPopularMovies { [weak self] response in
            
            guard let self else { return }
            
            switch response {
            case .success(let movies):
                hideLoading()
                
                DispatchQueue.main.async {
                    self.movies = movies
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row].title ?? "")
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellType: PopularMovieCell.self, indexPath: indexPath)
        cell.configure(movie: movies[indexPath.row])
        return cell
        
    }
    
    private func calculateHeight() -> CGFloat {
        let cellWidth = collectionView.frame.size.width - (Constants.cellLeftPadding + Constants.cellRightPadding)
        let posterImageHeight = cellWidth * Constants.cellPosterImageRatio
        return Constants.cellTitleHeight + posterImageHeight
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        .init(width: collectionView.frame.size.width - (Constants.cellLeftPadding + Constants.cellRightPadding), height: calculateHeight())
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: Constants.cellLeftPadding, bottom: 0, right: Constants.cellRightPadding)
    }
    
}

