//
//  HomePresenter.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 14.05.2024.
//

import Foundation

protocol HomePresenterProtocol: AnyObject  {
    func viewDidLoad()
    func numberOfItems() -> Int
    func news(_ index: Int) -> News?
    func didSelectRowAt(_ index: Int)
}

final class HomePresenter {
    
    unowned var view: HomeViewControllerProtocol!
    let router: HomeRouterProtocol!
    let interactor: HomeInteractorProtocol!
    
    private var news: [News] = []
    
    init(
        view: HomeViewControllerProtocol,
        router: HomeRouterProtocol,
        interactor: HomeInteractorProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        view.setupTableView()
        view.setTitle("NYTimes Top News")
        fetchNews()
    }
    
    func numberOfItems() -> Int {
        return news.count
    }
    
    func news(_ index: Int) -> News? {
        return news[safe: index]
    }
    
    func didSelectRowAt(_ index: Int) {
        //Todo: Navigate to detail
        print("Selected: \(news[index].title ?? "")")
        guard let source = news(index) else { return }
        router.navigate(.detail(source: source))
    }
    
    private func fetchNews() {
        view.showLoadingView()
        interactor.fetchNews()
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func fetchNewsOutput(result: NewsSourcesResult) {
        view.hideLoadingView()
        
        switch result {
        case .success(let response):
            self.news = response.results!
            view.reloadData()
        case .failure(let error):
            view.showError(error.localizedDescription)
        }
        
    }
    
}
