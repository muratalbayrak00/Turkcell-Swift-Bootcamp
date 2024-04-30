//
//  ViewController.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 4.04.2024.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    func loadMovieListCollectionView()
    func loadMovieListTableView()
}

class ViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    var nowPlayingList = [NowplayingMovieResult]()
    var upcomingList = [UpcomingMovieResult]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MovieLogic.shared.getNowPlayingMovies { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let movies):
                self.nowPlayingList = movies.results ?? [NowplayingMovieResult]()
                self.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        MovieLogic.shared.getUpcomingMovies { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let upcomingMovies):
                guard let upcomingMovies = upcomingMovies.results else { return }
                self.upcomingList = upcomingMovies
                print("fdafd", upcomingMovies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "movieCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nowPlayingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        cell.configure(nowPlaying: nowPlayingList[indexPath.row])
        return cell
    }
    
}
