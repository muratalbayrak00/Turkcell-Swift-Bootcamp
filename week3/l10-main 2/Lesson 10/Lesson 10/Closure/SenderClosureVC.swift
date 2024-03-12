

import UIKit

class SenderClosureVC: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    
    var callBack: ((String?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func sendMessageButtonAction(_ sender: Any) {
        
        let message = messageTextField.text
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListenerClosureVC")
        callBack?(message ?? "Merhaba Swift")
//        present(vc, animated: true)
        dismiss(animated: true, completion: nil)
    }
}
