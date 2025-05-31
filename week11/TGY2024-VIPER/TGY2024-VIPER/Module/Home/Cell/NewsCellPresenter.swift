//
//  NewsCellPresenter.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 16.05.2024.
//

import Foundation
import UIKit

protocol NewsCellPresenterProtocol: AnyObject {
    func load()
}

final class NewsCellPresenter {
    
    weak var view: NewsCellProtocol?
    private let news: News
    
    init(
        view: NewsCellProtocol?,
        news: News
    ) {
        self.view = view
        self.news = news
    }
}

extension NewsCellPresenter: NewsCellPresenterProtocol {
    
    func load() {
        
        ImageDownloader.shared.image(news: news, format: .largeThumbnail) { data, error in
            if let data {
                guard let img = UIImage(data: data) else { return }
                self.view?.setImage(img)
            }
        }
        view?.setTitleLabel(news.title ?? "")
        view?.setAuthorLabel(news.byline ?? "")
    }
    
}
