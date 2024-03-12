

import UIKit

class NewsViewController: UIViewController {
    
    var news = [NewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK : newsImage için => #imageLiteral()
        let news1 = NewsModel(newsImage: #imageLiteral(resourceName: "suthelvasi"), title: "Title 1", detail: "Detail 1")
        let news2 = NewsModel(newsImage: #imageLiteral(resourceName: "cagkebap"), title: "Title 2", detail: "Detail 2")
        let news3 = NewsModel(newsImage: #imageLiteral(resourceName: "kangal"), title: "Title 3", detail: "Detail 3")
        
        news = [news1, news2, news3]
        
    }
}

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        cell.configureModel(news[indexPath.row])
        
        return cell
    }
    
    
}
