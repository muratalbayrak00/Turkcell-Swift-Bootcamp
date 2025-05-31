//
//  LoadingShowable.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 14.05.2024.
//

import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }

    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}
