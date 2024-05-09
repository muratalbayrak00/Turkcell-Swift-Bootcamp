//
//  UserListPresenter.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import Foundation
import UIKit

class UserListPresenter: NSObject, UITableViewDataSource {
    
    var users: [User]
    var filteredUsers: [User]
    var isFiltered: Bool = false
    
    init(
        users: [User],
        filteredUsers: [User]
    ) {
        self.users = users
        self.filteredUsers = filteredUsers
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltered {
            return filteredUsers.count
        }
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier, for: indexPath) as? UserCell
        else {
            return UITableViewCell()
        }
        //cell.configure(isFiltered ? filteredUsers[indexPath.row]: users[indexPath.row])
        cell.configure(users[indexPath.row]) //Kerem Demir
        return cell
    }
    
    func getUserId(for indexPath: IndexPath) -> Int {
        let index = indexPath.row
        
        if isFiltered {
            users = filteredUsers
        }
        
        guard index < users.count else { return 0 }
        return users[index].id ?? 0
    }
    
}
