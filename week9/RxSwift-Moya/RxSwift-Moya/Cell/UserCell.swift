//
//  UserCell.swift
//  RxSwift-Moya
//
//  Created by Umut on 27.04.2024.
//

import UIKit

final class UserCell: UITableViewCell {
    
    static let reuseIdentifier = "userCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        stackview.spacing = 4
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(_ model: User) {
        nameLabel.text = model.name
        emailLabel.text = model.email
    }
}
