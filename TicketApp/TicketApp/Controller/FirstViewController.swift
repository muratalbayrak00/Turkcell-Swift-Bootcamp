//
//  FirstViewController.swift
//  TicketApp
//
//  Created by murat albayrak on 19.03.2024.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var buttonNextPage: UIButton!
    override func viewDidLoad() {
        let image = UIImage(named: "bus") 
        imageView.image = image
        super.viewDidLoad()
        buttonNextPage.addTarget(self, action: #selector(goToSecondPage), for: .touchUpInside)
      
    }
    
    @objc func goToSecondPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "DateController") as! DateController
            
        navigationController?.pushViewController(secondVC, animated: true)
    }
   

}
