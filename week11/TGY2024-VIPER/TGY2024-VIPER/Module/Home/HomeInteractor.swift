//
//  HomeInteractor.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 14.05.2024.
//

import Foundation


typealias NewsSourcesResult = Result<NewsData, NetworkError>

fileprivate var newsService: NewsServiceProtocol = API()

protocol HomeInteractorProtocol: AnyObject {
    func fetchNews()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func fetchNewsOutput(result: NewsSourcesResult)
}

final class HomeInteractor {
    var output: HomeInteractorOutputProtocol?
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func fetchNews() {
        newsService.fetchNews { [weak self] result in
            guard let self else { return }
            self.output?.fetchNewsOutput(result: result)
        }
    }
    
}
