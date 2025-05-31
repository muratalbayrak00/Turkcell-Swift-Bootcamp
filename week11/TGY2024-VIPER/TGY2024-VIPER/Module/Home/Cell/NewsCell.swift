//
//  NewsCell.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 14.05.2024.
//

import UIKit

protocol NewsCellProtocol: AnyObject {
    func setImage(_ image: UIImage)
    func setTitleLabel(_ text: String)
    func setAuthorLabel(_ text: String)
}

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    
    var cellPresenter: NewsCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform.identity
        }
        
    }
    
}

extension NewsCell: NewsCellProtocol {
    
    func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.newsImage.image = image
        }
    }
    
    func setTitleLabel(_ text: String) {
        self.newsTitle.text = text
    }
    
    func setAuthorLabel(_ text: String) {
        self.newsAuthor.text = text
    }
    
}
