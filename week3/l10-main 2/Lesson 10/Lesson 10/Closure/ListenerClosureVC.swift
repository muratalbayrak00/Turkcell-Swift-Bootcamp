

import UIKit

class ListenerClosureVC: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SenderClosureVC") as! SenderClosureVC
        
        //TODO: Closure
        vc.callBack = { text in
            if let text = text {
                print("Gelen Data : \(text)")
            }
        }
        present(vc, animated: true)
    }
}

// HOMEWORK : BURASI DUZGUN CALISMIYOR ! DUZELT!
