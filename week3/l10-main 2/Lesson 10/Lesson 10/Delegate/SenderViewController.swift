

import UIKit

protocol MessageDelegate: AnyObject {
    func sendMessage(_ text: String)
}

class SenderViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    weak var delegate: MessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        
        guard let text = messageTextField.text else {
            return
        }
        delegate?.sendMessage(text)
        
        // ACILAN SAYFAYI KAPATMAK ICIN
        dismiss(animated: true)
    }
}
