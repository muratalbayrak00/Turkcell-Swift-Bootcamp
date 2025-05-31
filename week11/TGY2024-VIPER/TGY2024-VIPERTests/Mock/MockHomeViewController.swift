//
//  MockHomeViewController.swift
//  TGY2024-VIPERTests
//
//  Created by Kerim Çağlar on 18.05.2024.
//

import Foundation
@testable import TGY2024_VIPER

final class MockHomeViewController: HomeViewControllerProtocol {
    
    var isInvokedShowLoading = false
    var invokedShowLoadingCount = 0
    
    func showLoadingView() {
        isInvokedShowLoading = true
        invokedShowLoadingCount += 1
    }
    
    var isInvokedHideLoading = false
    var invokedHideLoadingCount = 0
    
    func hideLoadingView() {
        isInvokedHideLoading = true
        invokedHideLoadingCount += 1
    }
    
    func reloadData() {
        
    }
    
    func setupTableView() {
        
    }
    
    func showError(_ message: String) {
        
    }
    
    var invokedSetTitle = false
    var invokedSetTitleCount = 0
    var invokedSetTitleParameters: (title: String, Void)?
    
    func setTitle(_ title: String) {
        invokedSetTitle = true
        invokedSetTitleCount += 1
        invokedSetTitleParameters = (title, ())
    }
    
}
