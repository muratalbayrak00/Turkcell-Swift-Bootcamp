//
//  SearchViewController.swift
//  Lesson 10
//
//  Created by Kerem Demir on 8.03.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var users = [User]()
    lazy var filteredUsers = [User]()
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        tableView.delegate = self
        tableView.dataSource = self
        configure()
    }
    
    private func configure(){
        configureTableView()
        configureSearchController()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        
        // Main Thread : UI Islemleri yapilir. (Mulakatta cikabilir.)
        
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let userListURL = URL(string: urlString) else { return }
        
        //            guard let data = try? Data(contentsOf: userListURL) else { return }
        
        //            let users = try? JSONDecoder().decode([User].self, from: data)
        let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userListURL))
        guard let users else { return }
        self.users = users
    }
    
    func filterContextForSearchtext(_ searchText: String) {
        filteredUsers = users.filter({ user -> Bool in
            return user.username?.lowercased().contains(searchText.lowercased()) ?? false
        })
        
        tableView.reloadData()
    }
    
    private func configureSearchController() {
        searchController.searchBar.placeholder = "Search User"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        // definesPresentationContext = true // ODEV NE ISE YARIYOR.
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        let user: User
        
        if isFiltering {
            cell.configure(filteredUsers[indexPath.row])
        } else {
            cell.configure(users[indexPath.row])
        }
        
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchtext(searchBar.text!)
    }
}
