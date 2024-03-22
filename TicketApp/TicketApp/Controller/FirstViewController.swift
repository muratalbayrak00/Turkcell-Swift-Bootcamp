//
//  FirstViewController.swift
//  TicketApp
//
//  Created by murat albayrak on 19.03.2024.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var buttonNextPage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonNextPage.addTarget(self, action: #selector(goToSecondPage), for: .touchUpInside)
      
    }
    
    @objc func goToSecondPage() {
            // İkinci sayfayı storyboard'dan al
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(withIdentifier: "DateController") as! DateController
            
            // Geçiş işlemini gerçekleştir
            navigationController?.pushViewController(secondVC, animated: true)
            //present(secondVC, animated: true, completion: nil)
        // veya:
            // present(secondVC, animated: true, completion: nil)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
