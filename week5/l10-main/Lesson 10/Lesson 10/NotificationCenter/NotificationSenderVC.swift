//
//  NotificationSenderVC.swift
//  Lesson 10
//
//  Created by Kerem Demir on 8.03.2024.
//

import UIKit

class NotificationSenderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func sendNotificationAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .sendDataNotification, object: nil)
        dismiss(animated: true)
    }
}
