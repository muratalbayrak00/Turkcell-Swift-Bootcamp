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
            return
        }
            
        guard let surname = passengerSurname.text, !surname.isEmpty else {
            return
        }
                
        guard let idText = passengerId.text, let id = Int(idText) else {
            return
        }
                
        passenger = Passenger(name: name, surname: surname, id: id)
                
        UserDefaults.standard.set(name, forKey: "passengerName")
        UserDefaults.standard.set(surname, forKey: "passengerSurname")
        UserDefaults.standard.set(Int(idText), forKey: "passengerId")
        
        passenger?.print()
    }
    

    


}
