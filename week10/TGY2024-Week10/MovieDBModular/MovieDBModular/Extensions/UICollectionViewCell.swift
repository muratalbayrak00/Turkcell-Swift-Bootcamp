//
//  UICollectionViewCell.swift
//  MovieDBModular
//
//  Created by Kerim Çağlar on 4.05.2024.
//

import UIKit

//MARK: self vs Self?? search

extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
