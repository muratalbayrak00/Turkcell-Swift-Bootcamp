//
//  SearchBarViewController.swift
//  Lesson 10
//
//  Created by Kerem Demir on 8.03.2024.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        
        // Main Thread : UI Islemleri yapilir. (Mulakatta cikabilir.)
        
        
            let urlString = "https://jsonplaceholder.typicode.com/users"
            
            guard let userListURL = URL(string: urlString) else { return }
            
//            guard let data = try? Data(contentsOf: userListURL) else { return }
            
//            let users = try? JSONDecoder().decode([User].self, from: data)
            let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userListURL))
            guard let users else { return }
            self.users = users
        
        // Networking
        // URLSession
        // Alamofire
        // Kingfisher, SDWebImage, AlamofireImage (Resimler icin kullanilir.)
        // Async Await
    }
}

// MARK: Tableview Extension Methods
extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource {
    
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
            //user = filteredUsers[indexPath.row]
            cell.configure(filteredUsers[indexPath.row])
        } else {
//            user = users[indexPath.row]
            cell.configure(users[indexPath.row])
        }
        
//        cell.configure(users[indexPath.row])
//        cell.configure(user)
        
        return cell
    }
}

// MARK: SearchBar Extension Methods
extension SearchBarViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
        filteredUsers = users.filter({ user -> Bool in
            return user.username?.lowercased().contains(searchText.lowercased()) ?? false
        })
        
        isFiltering = true
        tableview.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        filteredUsers = [User]()
        self.tableview.reloadData()
    }
}

// HOMEWORK : " b" baslarsa nasil sonuc alabiliriz ?
// HOMEWORK : searcbar'i geri geri silerken tamamen sildigimizde liste tamamen gelmiyor. Onu yap.
// HOMEWORK : Eğer veri bulunamıyorsa custom empty view oluşturarak kullanıcıya onu göstermelisiniz
