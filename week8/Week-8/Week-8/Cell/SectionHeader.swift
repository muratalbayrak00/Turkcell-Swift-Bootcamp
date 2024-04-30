//
//  SectionHeader.swift
//  Week-8
//
//  Created by Kerim Çağlar on 2.04.2024.
//

import UIKit

class SectionHeader: UICollectionReusableView {
        
    static let reuseIdentifier = "sectionHeader"
    
    let title = UILabel()
    let seperator = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        seperator.backgroundColor = .lightGray
        seperator.translatesAutoresizingMaskIntoConstraints = false
     
        title.textColor = .label
        title.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 18, weight: .bold))
        
        let stackView = UIStackView(arrangedSubviews: [seperator, title])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
