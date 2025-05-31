//
//  MockInteractor.swift
//  TGY2024-VIPERTests
//
//  Created by Kerim Çağlar on 18.05.2024.
//

import Foundation
@testable import TGY2024_VIPER

final class MockHomeInteractor: HomeInteractorProtocol {
    
    var isInvokedFetchNews = false
    var invokedFetchNewsCount = 0
    
    func fetchNews() {
        isInvokedFetchNews = true
        invokedFetchNewsCount += 1
    }
    
    
}
