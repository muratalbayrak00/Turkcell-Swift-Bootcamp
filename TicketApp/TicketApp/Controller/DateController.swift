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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSelectedCityDestination(_:)), name: .selectedCityNotificationto, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleSelectedCityStart(_:)), name: .selectedCityNotificationStart, object: nil)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        
        let selectedDate = datePicker.date
        
        let calender = Calendar.current
        let components = calender.dateComponents([.day, .month, .year], from: selectedDate)
        guard let day = components.day, let month = components.month, let year = components.year else {
            return
        }
        dateClass = DateClass(day: day, month: month, year: year)
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH"
//        let hour = dateFormatter.string(from: selectedDate)
//        dateFormatter.dateFormat = "mm"
//        let minute = dateFormatter.string(from: selectedDate)
//        
//        time = Time(hour: hour, minute: minute)
        
        print("DateClass: Day \(dateClass?.day), Month \(dateClass?.month), Year \(dateClass?.year)")
      //  print("Time: Hour \(String(describing: time?.hour)), Minute \(time?.minute)")
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
               fromLabel.text = selectedCityfrom.cityName
               print("Seçilen şehir: \(selectedCityfrom.cityName)")
               
           }
    }
    


}
