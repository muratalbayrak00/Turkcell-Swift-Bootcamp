//
//  DetailsPage.swift
//  TicketApp
//
//  Created by murat albayrak on 19.03.2024.
//

import UIKit

class DetailsPage: UIViewController {

    var fromCity: String = ""
    var toCity: String = ""
    var timeLabel: String = ""
    var price: String = ""
    var selectedSeats = [String]()
    var selectedSeatsInt = [Int]()
    
    var timeLabell = UserDefaults.standard.string(forKey: "time") ?? ""
    var day = UserDefaults.standard.integer(forKey: "day")
    var month = UserDefaults.standard.integer(forKey: "month")
    var year = UserDefaults.standard.integer(forKey: "year")
    
    
    var passengerName = ""
    var passengerSurname = ""
    var passengerId = 0
    
    var time: Time?
    var date: DateClass?
    var passenger: Passenger?
    var ticket: Ticket?
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var passengerLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var seatNumbersLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var backMenuButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSelectedSeats()
        getSelectedTrip()
        getDateandTime()
        getNameSurnameId()
        
       
        
        let components = timeLabell.components(separatedBy: ".")
        if components.count == 2, let hour = Int(components[0]), let minute = Int(components[1]) {
            time = Time(hour: hour, minute: minute)
        } else {
            print("Invalid time format")
        }
        
        date = DateClass(day: Int(day),month: Int(month),year: Int(year))

        passenger = Passenger(name: passengerName, surname: passengerSurname, id: passengerId)
        ticket = Ticket(passenger!, date!, time!, selectedSeatsInt, selectedSeats.count)
        
        date!.print()
        time?.print()
        passenger?.print()
        ticket?.print()
        
        backMenuButton.addTarget(self, action: #selector(restartApp), for: .touchUpInside)

    }

    func getSelectedSeats() {
        if let retrievedArray = UserDefaults.standard.array(forKey: "selectedSeats") as? [String] {
            print("detailspageselectedseatss")
            selectedSeats = retrievedArray
            seatNumbersLabel.text = "\(selectedSeats)"
            for seat in selectedSeats {
                if let seatInt = Int(seat) {
                    selectedSeatsInt.append(seatInt)
                }
            }
            print(retrievedArray)
        }
    }
    @objc func restartApp() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            window.makeKeyAndVisible()
        }
    }
    func getSelectedTrip() {
        fromCity = UserDefaults.standard.string(forKey: "fromCity") ?? ""
        toCity = UserDefaults.standard.string(forKey: "toCity") ?? ""
        
        companyLabel.text = UserDefaults.standard.string(forKey: "company") ?? ""
        companyLabel.text = companyLabel.text?.uppercased()
        var price = UserDefaults.standard.string(forKey: "price")
        price?.removeFirst()
        let calculatedPrice = selectedSeats.count*(Int(price ?? "") ?? 0)
        var temp  = "\(calculatedPrice)"
        temp = "\u{20BA}" + temp
        
        priceLabel.text = temp

        fromLabel.text = fromCity
        toLabel.text = toCity
       
        
    }
    
    func getNameSurnameId() {
        passengerName = UserDefaults.standard.string(forKey: "passengerName") ?? ""
        passengerSurname = UserDefaults.standard.string(forKey: "passengerSurname") ?? ""
        passengerId = UserDefaults.standard.integer(forKey: "passengerId") ?? 0
        
        passengerLabel.text = "\(passengerName) \(passengerSurname)"
        print(passengerName )
        print(passengerSurname )
        print(passengerId )
    }
    
    func getDateandTime() {
        var timeLabell = UserDefaults.standard.string(forKey: "time") ?? ""
        var day = UserDefaults.standard.integer(forKey: "day")
        var month = UserDefaults.standard.integer(forKey: "month")
        var year = UserDefaults.standard.integer(forKey: "year")
        
        
        dateLabel.text = "\(day)/\(month)/\(year)    " + timeLabell
    }
    

    
}
