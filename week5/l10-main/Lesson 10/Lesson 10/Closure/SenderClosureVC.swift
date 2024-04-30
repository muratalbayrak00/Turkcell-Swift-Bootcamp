//
//  SenderClosureVC.swift
//  Lesson 10
//
//  Created by Kerem Demir on 8.03.2024.
//

import UIKit

class SenderClosureVC: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    
    var callBack: ((String?) -> ())?
        
        override func viewDidLoad() {
            super.viewDidLoad()

        }
        
        @IBAction func sendMessageButtonAction(_ sender: Any) {
            
            let message = messageTextField.text
            
            callBack?(message ?? "Merhaba Swift") // Geri çağrıyı çağır
            dismiss(animated: true, completion: nil)
        }}
