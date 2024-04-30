//
//  UserCell.swift
//  Lesson 10
//
//  Created by Kerem Demir on 12.03.2024.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure(_ user: User) {
        idLabel.text = "\(user.id ?? 0)"
        emailLabel.text = user.email
        nameLabel.text = user.name
        usernameLabel.text = user.username
    }
}
