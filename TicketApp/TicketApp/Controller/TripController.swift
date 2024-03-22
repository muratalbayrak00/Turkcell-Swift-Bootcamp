//
//  TripController.swift
//  TicketApp
//
//  Created by murat albayrak on 22.03.2024.
//

import UIKit

class TripController: UIViewController {

    var times = ["10.15", "12.50", "15.00"]
    var prices = ["300", "400", "650"]
    var images = ["metro","aliosman", "pamukkale"]
    var fromLabels = ["istanbul", "ankara", "izmir"]
    var destinationLabels = ["istanbul", "ankara", "izmir"]
    
    var allTrip = [TripModel]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // allTrip.append(TripModel(brandImageView: "metro", timeLabel: "10.15", priceLabel: "400", fromLabel: "istanbul", destinationLabel: "ankara"))

        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "10.15", priceLabel: "400", fromLabel: "istanbul", destinationLabel: "ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "12.50", priceLabel: "300", fromLabel: "ankara", destinationLabel: "izmir"))
        allTrip.append(TripModel(brandImageView: "aliosman", timeLabel: "15.00", priceLabel: "650", fromLabel: "izmir", destinationLabel: "ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "10.15", priceLabel: "400", fromLabel: "istanbul", destinationLabel: "izmir"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "10.15", priceLabel: "400", fromLabel: "istanbul", destinationLabel: "ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "12.50", priceLabel: "300", fromLabel: "ankara", destinationLabel: "izmir"))
        allTrip.append(TripModel(brandImageView: "aliosman", timeLabel: "15.00", priceLabel: "650", fromLabel: "izmir", destinationLabel: "ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "10.15", priceLabel: "400", fromLabel: "istanbul", destinationLabel: "izmir"))

        tableView.register(UINib(nibName: "TripCell", bundle: nil), forCellReuseIdentifier: "TripCell")
    }
    



}

extension TripController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allTrip.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripCell
        cell.configureModel(allTrip[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrip = allTrip[indexPath.row]
        
        print("Seçilen seyahat bilgileri:")
        print("time: \(selectedTrip.timeLabel)")
        print("price: \(selectedTrip.priceLabel)")
        print("departure: \(selectedTrip.fromLabel)")
        print("arrival: \(selectedTrip.destinationLabel)")
        print("-----------------------:")
        // Kullanıcının tıkladığı hücrenin indeksine göre ilgili TripModel'i alın
        
        // Yönlendirilecek view controller'ı oluşturun
        //let destinationVC = SeatDesign()
        
        // TripModel veya diğer gerekli verileri hedef view controller'a aktarın
       // destinationVC.tripModel = selectedTrip
        
        // Hedef view controller'a yönlendirme işlemini gerçekleştirin
      //  navigationController?.pushViewController(destinationVC, animated: true)
    }
    
   
    
    
}

