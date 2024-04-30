//
//  FirstViewController.swift
//  MapController
//
//  Created by Kerem Demir on 21.03.2024.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarController = UITabBarController()
        tabBarConfigure()
    }
    
    private func tabBarConfigure() {
        guard let tabBar = tabBarController?.tabBar else { return }
        tabBar.backgroundColor = .systemOrange
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .cyan
        
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMaxYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.red.cgColor
        
        // HOMEWORK : .masksToBounds ile clipToBounds kavramlarini arastiriniz, ne zaman kullanilirlar ?
        // HOMEWORK : Tabbar icin orta butonu biraz on plana cikar
        // HOMEWORK : Tablar biraz daha yukarda goster.
    }
}
