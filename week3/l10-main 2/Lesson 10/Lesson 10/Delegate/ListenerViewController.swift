

import UIKit

class ListenerViewController: UIViewController, MessageDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func getDataButton(_ sender: UIButton) {
        let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SenderViewController") as! SenderViewController
        
        // TODO: Delegate gelecek.
        senderVC.delegate = self
        
        present(senderVC, animated: true)
    }
    // TODO: Delegate'den gelen mesaj Label'e basilacak.
    
    func sendMessage(_ text: String) {
        
        messageLabel.text = text
    }
    
}
