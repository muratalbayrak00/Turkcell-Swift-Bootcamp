//
//  TopCell.swift
//  Week-8
//
//  Created by Kerim Çağlar on 2.04.2024.
//

import UIKit

class TopCell: UICollectionViewCell, EDevletCellProtocol {
    
    static var reuseIdentifier: String = "topCell"
    
    let containerView = UIView()
    let imageView = UIImageView()
    let title = UILabel()
    let seperator = UIView(frame: .zero)
    
    //MARK: Oden super init neden kullanıyoruz?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .red
        containerView.layer.cornerRadius = 30
        
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .gray
        
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.textColor = .black
        title.numberOfLines = 0
        addSubview(containerView)
        
        let stackView = UIStackView(arrangedSubviews: [seperator, imageView, title])
        
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.spacing = 10
        
        containerView.addSubview(stackView)
        
        //AutoLayout
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 1),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        stackView.setCustomSpacing(20, after: seperator)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func configure(with edevlet: EDevlet) {
        title.text = edevlet.name
        imageView.image = UIImage(named: edevlet.image)
    }
    
    
}
