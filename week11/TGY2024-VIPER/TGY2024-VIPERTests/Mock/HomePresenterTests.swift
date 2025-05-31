//
//  HomePresenterTests.swift
//  TGY2024-VIPERTests
//
//  Created by Kerim Çağlar on 18.05.2024.
//

import XCTest
@testable import TGY2024_VIPER

final class HomePresenterTests: XCTestCase {

    var presenter: HomePresenter!
    var view: MockHomeViewController!
    var interactor: MockHomeInteractor!
    var router: MockRouter!
    
    override func setUp() {
        super.setUp()
        
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(view: view, router: router, interactor: interactor)
        
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        interactor = nil
        router = nil
        presenter = nil
    }
    
    func test_viewDidLoad_InvokesRequiredViewMethods() {
        XCTAssertFalse(view.invokedSetTitle)
        XCTAssertNil(view.invokedSetTitleParameters)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedSetTitle)
        XCTAssertEqual(view.invokedSetTitleParameters?.title, "NYTimes Top News")
        
    }
    
    func test_fetchNewsOutput() {
        XCTAssertFalse(view.isInvokedHideLoading)
        XCTAssertEqual(presenter.numberOfItems(), 0)
        
        presenter.fetchNewsOutput(result: .success(.response))
        
        XCTAssertTrue(view.isInvokedHideLoading)
        XCTAssertEqual(presenter.numberOfItems(), 27)
        
    }
    
}

extension NewsData {
    
    static var response: NewsData {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "News", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let response = try! JSONDecoder().decode(NewsData.self, from: data)
        return response
    }
    
}
