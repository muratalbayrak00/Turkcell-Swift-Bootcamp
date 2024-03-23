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
    
    var dateClass: DateClass?
    var time: Time?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.minimumDate = Date()
        NotificationCenter.default.addObserver(self, selector: #selector(handleSelectedCityDestination(_:)), name: .selectedCityNotificationto, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleSelectedCityStart(_:)), name: .selectedCityNotificationStart, object: nil)

    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        
        let selectedDate = datePicker.date
        
        let calender = Calendar.current
        let components = calender.dateComponents([.day, .month, .year], from: selectedDate)
        guard let day = components.day, let month = components.month, let year = components.year else {
            return
        }
        dateClass = DateClass(day: day, month: month, year: year)
        
        
        UserDefaults.standard.set(fromLabel.text, forKey: "fromLabel")
        UserDefaults.standard.set(toLabel.text, forKey: "toLabel")
        UserDefaults.standard.set(day, forKey: "day")
        UserDefaults.standard.set(month, forKey: "month")
        UserDefaults.standard.set(year, forKey: "year")
        
                
    }
    

    
    @objc func handleSelectedCityDestination(_ notification: Notification) {
           if let selectedCityto = notification.object as? CityModel {
               toLabel.text = selectedCityto.cityName
               
           }
    }
    @objc func handleSelectedCityStart(_ notification: Notification) {
           if let selectedCityfrom = notification.object as? CityModel {
               fromLabel.text = selectedCityfrom.cityName
               
           }
    }
    


}
