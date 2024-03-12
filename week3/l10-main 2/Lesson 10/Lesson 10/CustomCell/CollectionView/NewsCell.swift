

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var newsDetailLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    func configureModel(_ model: NewsModel) {
        newsImageView.image = model.newsImage
        newsTitleLabel.text = model.title
        newsDetailLabel.text = model.detail
    }
}
