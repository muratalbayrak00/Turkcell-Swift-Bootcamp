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
    
    
    //    @IBAction func updetePassengerInfo(_ sender: UIButton) {
//        updatePassengerInfo()
//    
//
//    }
    var passenger : Passenger?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        updatePassengerInfo()
    }
    
    func updatePassengerInfo() {
        guard let name = passengerName.text, !name.isEmpty,
              let surname = passengerSurname.text, !surname.isEmpty else {
            return
        }
        
        passenger = Passenger(name: name, surname: surname, id: 0)
        performSegue(withIdentifier: "showDetailsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsSegue" {
            if let destinationVC = segue.destination as? DetailsPage {
                destinationVC.passenger = self.passenger
            }
        }
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
