//
//  DetailsPage.swift
//  TicketApp
//
//  Created by murat albayrak on 19.03.2024.
//

import UIKit

class DetailsPage: UIViewController {

    
    @IBOutlet weak var nameSurname: UILabel!
    
    
    var passenger: Passenger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let passenger = passenger {
            nameSurname.text = "\(passenger.name) \(passenger.surname)"
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
