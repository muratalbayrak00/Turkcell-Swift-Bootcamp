//
//  ViewController.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let userVM = UserViewModel()
    
    private lazy var userList: UserListPresenter = {
       return UserListPresenter(users: [], filteredUsers: [])
    }()
    
    let disposeBag = DisposeBag()
    
    private let tableView = UITableView()
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search User"
        return searchController
    }()
    
    var isSearchBarEmpty: Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func configureProperties() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = userList
        navigationItem.title = "Users"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
    }
    
    private func configureLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseIdentifier)
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userVM.fetchUsers().subscribe { users in
            
            self.userList.users = users
            self.tableView.reloadData()
        } onError: { error in
            print(error.localizedDescription)
        } onCompleted: {
            print("Completed")
        } onDisposed: {
            print("on disposed")
        }.disposed(by: disposeBag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureProperties()
        configureLayout()
        
    }

    func filterContentForSearchText(_ searchText: String) {
        userList.filteredUsers = userList.users.filter({ (user: User) -> Bool in
            userList.isFiltered = searchController.isActive && !isSearchBarEmpty
            guard let name = user.name else { return false }
            return name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: show posts page
    }
}


extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        filterContentForSearchText(searchText ?? "")
    }
    
}
