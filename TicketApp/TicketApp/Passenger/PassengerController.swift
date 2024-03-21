//
//  PassengerController.swift
//  TicketApp
//
//  Created by murat albayrak on 19.03.2024.
//

import UIKit

class PassengerController: UIViewController {

    
    @IBOutlet weak var passengerName: UITextField!
    @IBOutlet weak var passengerSurname: UITextField!

    @IBOutlet weak var passengerId: UITextField!
    

    var passenger: Passenger?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let name = passengerName.text, !name.isEmpty else {
            // Kullanıcı adı girilmedi, hata mesajı gösterilebilir.
            return
        }
            
        guard let surname = passengerSurname.text, !surname.isEmpty else {
            // Kullanıcı soyadı girilmedi, hata mesajı gösterilebilir.
            return
        }
                
        guard let idText = passengerId.text, let id = Int(idText) else {
            // Geçersiz kimlik numarası, hata mesajı gösterilebilir.
            return
        }
                
        // Yukarıdaki koşulları geçtikten sonra Passenger sınıfından bir örnek oluşturabiliriz.
        passenger = Passenger(name: name, surname: surname, id: id)
                
        // Artık passenger örneği oluşturuldu, istediğiniz işlemleri yapabilirsiniz.
        // Örneğin, print fonksiyonunu çağırabiliriz:
       
        passenger?.print()
      //  updatePassengerInfo()
    }
    
//    func updatePassengerInfo() {
//        guard let name = passengerName.text, !name.isEmpty,
//              let surname = passengerSurname.text, !surname.isEmpty else {
//            return
//        }
//        
//        passenger = Passenger(name: name, surname: surname, id: 0)
//        performSegue(withIdentifier: "showDetailsSegue", sender: self)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetailsSegue" {
//            if let destinationVC = segue.destination as? DetailsPage {
//                destinationVC.passenger = self.passenger
//            }
//        }
//    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
