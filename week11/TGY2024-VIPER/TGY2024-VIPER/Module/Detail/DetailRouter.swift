//
//  DetailRouter.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 16.05.2024.
//

import Foundation
import SafariServices

enum DetailRoutes {
    case openURL(url: URL)
}

protocol DetailRouterProtocol: AnyObject {
    func navigate(_ route: DetailRoutes)
}

final class DetailRouter {
    weak var viewController: DetailViewController?
    
    static func createModule() -> DetailViewController {
        let view = DetailViewController()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}


extension DetailRouter: DetailRouterProtocol {
    
    func navigate(_ route: DetailRoutes) {
        switch route {
         
        case .openURL(let url):
            let safariVC = SFSafariViewController(url: url)
            viewController?.present(safariVC, animated: true)
            
        }
    }
    
}

