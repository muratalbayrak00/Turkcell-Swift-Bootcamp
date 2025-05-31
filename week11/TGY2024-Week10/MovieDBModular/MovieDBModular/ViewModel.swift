//
//  ViewModel.swift
//  MovieDBModular
//
//  Created by Kerim Çağlar on 7.05.2024.
//

import Foundation
import MovieAPI

extension ViewModel {
    fileprivate enum Constants {
        static let cellTitleHeight: Double = 50
        static let cellPosterImageRatio: Double = 1/2
        static let cellLeftPadding: Double = 16
        static let cellRightPadding: Double = 16
    }
}

protocol ViewModelProtocol {
    var delegate: ViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    
    var cellPadding: Double { get }
    func load()
    func movie(index: Int) -> Movie?
    func calculateCellHeight(collectionViewWidth: Double) -> Double
}

protocol ViewModelDelegate: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
}

final class ViewModel {
    
    private var movies = [Movie]()
    let service: MovieServiceProtocol
    weak var delegate: ViewModelDelegate?
    
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
    fileprivate func fetchMovies() {
        self.delegate?.showLoadingView() // Loading Göster haberini VC a verir
        service.fetchPopularMovies { [weak self] response in
            
            guard let self else { return }
            
            switch response {
            case .success(let movies):
                self.delegate?.hideLoadingView() // Loading Gizle haberini VC a verir
                DispatchQueue.main.async {
                    self.movies = movies
                    self.delegate?.reloadData() // Collectionview Reload et haberini VC a verir
                }
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
    }
    
}

extension ViewModel: ViewModelProtocol {
    
    var numberOfItems: Int {
        movies.count
    }
    
    var cellPadding: Double {
        Constants.cellLeftPadding
    }
    
    func load() {
        fetchMovies()
    }
    
    func movie(index: Int) -> MovieAPI.Movie? {
        movies[index]
    }
    
    func calculateCellHeight(collectionViewWidth: Double) -> Double {
        let cellWidth = collectionViewWidth - (cellPadding * 2)
        let posterImageHeight = cellWidth * Constants.cellPosterImageRatio
        return Constants.cellTitleHeight + posterImageHeight
    }
    
    
}
