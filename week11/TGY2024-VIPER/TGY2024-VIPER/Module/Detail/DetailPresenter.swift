//
//  DetailPresenter.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 16.05.2024.
//

import Foundation
import UIKit

extension DetailPresenter {
    fileprivate enum Constants {
        static let pageTitle: String = "Detail"
    }
}

protocol DetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func tapSeeMore()
}

final class DetailPresenter {
    
    unowned var view: DetailViewControllerProtocol?
    let router: DetailRouterProtocol!
    
    init(
        view: DetailViewControllerProtocol,
        router: DetailRouterProtocol!
    ) {
        self.view = view
        self.router = router
    }
    
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func viewDidLoad() {
        
        guard let news = view?.getSource() else { return }
        
        ImageDownloader.shared.image(news: news, format: .superJumbo) { [weak self] data, error in
            guard let self else { return }
            
            guard let data, error == nil else { return }
            guard let image = UIImage(data: data) else { return }
            self.view?.setNewsImage(image)
        }
        
        view?.setTitle(Constants.pageTitle)
        view?.setNewsTitle(news.title ?? "")
        view?.setNewsAuthor(news.byline ?? "")
        view?.setNewsDetail(news.abstract ?? "")
        
    }
    
    func tapSeeMore() {
        guard let urlString = view?.getSource()?.url else { return }
        guard let url = URL(string: urlString) else { return }
        router.navigate(.openURL(url: url))
    }
    
    
}
