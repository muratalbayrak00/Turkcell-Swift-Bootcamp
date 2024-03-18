//
//  DateController.swift
//  TicketApp
//
//  Created by murat albayrak on 18.03.2024.
//

import UIKit

class DateController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSelectedCityDestination(_:)), name: .selectedCityNotificationto, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleSelectedCityStart(_:)), name: .selectedCityNotificationStart, object: nil)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateAndTime(_ sender: Any) {
        let selectedDate = datePicker.date
        
        // Seçilen tarihi kullanarak istediğiniz işlemi yapabilirsiniz
        print("Seçilen Tarih: \(selectedDate)")
    }
    
    @objc func handleSelectedCityDestination(_ notification: Notification) {
           if let selectedCityto = notification.object as? CityModel {
               // Seçilen şehri kullanabiliriz
               toLabel.text = selectedCityto.cityName
               print("Seçilen şehir: \(selectedCityto.cityName)")
               
               // Burada seçilen şehri istediğiniz şekilde kullanabilirsiniz
           }
    }
    @objc func handleSelectedCityStart(_ notification: Notification) {
           if let selectedCityfrom = notification.object as? CityModel {
               // Seçilen şehri kullanabiliriz
               fromLabel.text = selectedCityfrom.cityName
               print("Seçilen şehir: \(selectedCityfrom.cityName)")
               
               // Burada seçilen şehri istediğiniz şekilde kullanabilirsiniz
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
