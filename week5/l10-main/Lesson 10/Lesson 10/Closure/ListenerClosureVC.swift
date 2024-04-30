//
//  ListenerClosureVC.swift
//  Lesson 10
//
//  Created by Kerem Demir on 8.03.2024.
//

import UIKit

class ListenerClosureVC: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SenderClosureVC") as! SenderClosureVC
        
        // Geri çağrı işlevini ayarla
        vc.callBack = { text in
            if let text = text {
                print("Gelen Data : \(text)")
                self.messageLabel.text = text // Gelen veriyi etikete yerleştir
            }
        }
        present(vc, animated: true)
    }
}

// HOMEWORK : BURASI DUZGUN CALISMIYOR ! DUZELT!
