

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
