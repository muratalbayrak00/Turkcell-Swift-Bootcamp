//
//  HomeViewController.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 14.05.2024.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func setupTableView()
    func showError(_ message: String)
    func setTitle(_ title: String)
}

final class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }

}

extension HomeViewController: HomeViewControllerProtocol {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: NewsCell.self)
    }
    
    func showError(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(indexPath.row)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(with: NewsCell.self, for: indexPath)
        if let news = presenter.news(indexPath.row) {
            cell.cellPresenter = NewsCellPresenter(view: cell, news: news)
        }
        return cell
    }
    
}
