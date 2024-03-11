//
//  SearchBarViewController.swift
//  Lesson 10
//
//  Created by Kerem Demir on 8.03.2024.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let userListURL = URL(string: urlString) else { return }
        
        guard let data = try? Data(contentsOf: userListURL) else { return }
        
        let userList = try? JSONDecoder().decode([User].self, from: data)
        
        print(userList?.first)
    }
}
