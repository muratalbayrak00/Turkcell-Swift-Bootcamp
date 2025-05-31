//
//  ViewController.swift
//  MovieDBModular
//
//  Created by Kerim Çağlar on 4.05.2024.
//

import UIKit



class ViewController: UIViewController, LoadingShowable {

    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel: ViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetchMovies()
        viewModel.load()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.register(UINib(nibName: "PopularMovieCell", bundle: nil), forCellWithReuseIdentifier: "PopularMovieCell")
        collectionView.register(cellType: PopularMovieCell.self)

    }


}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(movies[indexPath.row].title ?? "")
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellType: PopularMovieCell.self, indexPath: indexPath)
        if let movie = viewModel.movie(index: indexPath.row) {
            cell.configure(movie: movie)
        }
        return cell
        
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        .init(width: collectionView.frame.size.width - (viewModel.cellPadding + viewModel.cellPadding), height: viewModel.calculateCellHeight(collectionViewWidth: collectionView.frame.size.width))
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: viewModel.cellPadding, bottom: 0, right: viewModel.cellPadding)
    }
    
}

extension ViewController: ViewModelDelegate {
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}
