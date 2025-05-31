//
//  DetailViewController.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 16.05.2024.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    
    func setTitle(_ title: String)
    func setNewsTitle(_ text: String)
    func setNewsAuthor(_ text: String)
    func setNewsDetail(_ text: String)
    func setNewsImage(_ image: UIImage)
    func getSource() -> News?
    
}

final class DetailViewController: BaseViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsDetail: UILabel!
    
    var presenter: DetailPresenterProtocol!
    var source: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }
    
    @IBAction func tapSeeMore(_ sender: UIButton) {
        presenter.tapSeeMore()
    }
    
}

extension DetailViewController: DetailViewControllerProtocol {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setNewsTitle(_ text: String) {
        self.newsTitle.text = text
    }
    
    func setNewsAuthor(_ text: String) {
        self.newsAuthor.text = text
    }
    
    func setNewsDetail(_ text: String) {
        self.newsDetail.text = text
    }
    
    func setNewsImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.newsImageView.image = image
        }
    }
    
    func getSource() -> News? {
        return source
    }
    
    
}
