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
    var images = ["metro","ali-osman-ulusoy", "pamukkale", "varan", "kamil-koç"]
    var fromLabels = ["istanbul", "ankara", "izmir", "antalya", "sivas", "mersin", "konya"]
    var destinationLabels = ["istanbul", "ankara", "izmir", "antalya", "sivas", "mersin", "konya"]
    var allTrip = [TripModel]()
    var filteredTrip = [TripModel]()
    var selectedTrip = TripModel(brandImageView: "", timeLabel: "", priceLabel: "", fromLabel: "", destinationLabel: "")
    
    var selectedIndexPaths = [IndexPath]()

    var selectedIndexPath: IndexPath?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    
    @IBAction func continueButton(_ sender: UIButton) {

        var fromCity = selectedTrip.fromLabel
        var toCity = selectedTrip.destinationLabel
        var time = selectedTrip.timeLabel
        var price = selectedTrip.priceLabel
        var company = selectedTrip.brandImageView
        
        UserDefaults.standard.set(fromCity, forKey: "fromCity")
        UserDefaults.standard.set(toCity, forKey: "toCity")
        UserDefaults.standard.set(time, forKey: "time")
        UserDefaults.standard.set(price, forKey: "price")
        UserDefaults.standard.set(company, forKey: "company")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerLabel.text = "Lütfen sefer seçiniz"
        headerLabel.textAlignment = .center
        headerLabel.backgroundColor = .lightGray

        tableView.tableHeaderView = headerLabel
        
        


        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "10.15", priceLabel: "₺400", fromLabel: "İstanbul", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "10.15", priceLabel: "₺400", fromLabel: "İstanbul", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "12.50", priceLabel: "₺300", fromLabel: "Ankara", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "15.00", priceLabel: "₺650", fromLabel: "İzmir", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "19.50", priceLabel: "₺300", fromLabel: "Ankara", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "02.00", priceLabel: "₺400", fromLabel: "İstanbul", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "12.15", priceLabel: "₺400", fromLabel: "İstanbul", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "12.15", priceLabel: "₺400", fromLabel: "İstanbul", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "14.50", priceLabel: "₺300", fromLabel: "Ankara", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "14.50", priceLabel: "₺300", fromLabel: "Ankara", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "14.50", priceLabel: "₺300", fromLabel: "Ankara", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "14.50", priceLabel: "₺300", fromLabel: "Ankara", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "14.50", priceLabel: "₺300", fromLabel: "Ankara", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "İzmir", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "İzmir", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "İzmir", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "İzmir", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "19.15", priceLabel: "₺400", fromLabel: "İstanbul", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "21.15", priceLabel: "₺400", fromLabel: "İstanbul", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "23.50", priceLabel: "₺449", fromLabel: "Ankara", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "23.50", priceLabel: "₺449", fromLabel: "Ankara", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "23.50", priceLabel: "₺449", fromLabel: "Ankara", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "23.50", priceLabel: "₺449", fromLabel: "Ankara", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "İzmir", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "İzmir", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "İzmir", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "İzmir", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "İzmir", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "03.15", priceLabel: "₺299", fromLabel: "İstanbul", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "03.15", priceLabel: "₺299", fromLabel: "İstanbul", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "08.20", priceLabel: "₺280", fromLabel: "Antalya", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "11.45", priceLabel: "₺550", fromLabel: "İstanbul", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "14.30", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "İzmir", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "İzmir", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "İzmir", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "İzmir", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "İzmir", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "20.00", priceLabel: "₺700", fromLabel: "İstanbul", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "20.00", priceLabel: "₺700", fromLabel: "İstanbul", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "09.30", priceLabel: "₺280", fromLabel: "İzmir", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "09.30", priceLabel: "₺280", fromLabel: "İzmir", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "09.30", priceLabel: "₺280", fromLabel: "İzmir", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "09.30", priceLabel: "₺280", fromLabel: "İzmir", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "12.20", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "14.50", priceLabel: "₺220", fromLabel: "İstanbul", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "18.40", priceLabel: "₺350", fromLabel: "Ankara", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "18.40", priceLabel: "₺350", fromLabel: "Ankara", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "18.40", priceLabel: "₺350", fromLabel: "Ankara", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "22.15", priceLabel: "₺600", fromLabel: "İstanbul", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "22.15", priceLabel: "₺600", fromLabel: "İstanbul", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "05.45", priceLabel: "₺280", fromLabel: "Antalya", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "08.30", priceLabel: "₺220", fromLabel: "Ankara", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "11.20", priceLabel: "₺350", fromLabel: "İstanbul", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "15.10", priceLabel: "₺600", fromLabel: "Antalya", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "15.10", priceLabel: "₺600", fromLabel: "Antalya", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "19.30", priceLabel: "₺280", fromLabel: "İstanbul", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "19.30", priceLabel: "₺280", fromLabel: "İstanbul", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "22.45", priceLabel: "₺220", fromLabel: "İstanbul", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "22.45", priceLabel: "₺220", fromLabel: "İstanbul", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "10.15", priceLabel: "₺400", fromLabel: "Mersin", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "12.50", priceLabel: "₺300", fromLabel: "Konya", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "15.00", priceLabel: "₺650", fromLabel: "Sivas", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "19.50", priceLabel: "₺300", fromLabel: "Konya", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "02.00", priceLabel: "₺400", fromLabel: "Mersin", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "12.15", priceLabel: "₺400", fromLabel: "Mersin", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "14.50", priceLabel: "₺300", fromLabel: "Konya", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "14.50", priceLabel: "₺300", fromLabel: "Konya", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "Sivas", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "Sivas", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "Sivas", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "17.00", priceLabel: "₺850", fromLabel: "Sivas", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "19.15", priceLabel: "₺400", fromLabel: "Mersin", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "19.15", priceLabel: "₺400", fromLabel: "Mersin", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "21.15", priceLabel: "₺400", fromLabel: "Mersin", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "23.50", priceLabel: "₺449", fromLabel: "Konya", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "Sivas", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "Sivas", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "Sivas", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "Sivas", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "18.00", priceLabel: "₺799", fromLabel: "Sivas", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "03.15", priceLabel: "₺299", fromLabel: "Mersin", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "08.20", priceLabel: "₺280", fromLabel: "Konya", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "11.45", priceLabel: "₺550", fromLabel: "Mersin", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "11.45", priceLabel: "₺550", fromLabel: "Mersin", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "11.45", priceLabel: "₺550", fromLabel: "Mersin", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "11.45", priceLabel: "₺550", fromLabel: "Mersin", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "14.30", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "14.30", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "14.30", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "Sivas", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "Sivas", destinationLabel: "İstanbul"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "Sivas", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "Sivas", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "16.10", priceLabel: "₺200", fromLabel: "Sivas", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "20.00", priceLabel: "₺700", fromLabel: "Mersin", destinationLabel: "Sivas"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "20.00", priceLabel: "₺700", fromLabel: "Mersin", destinationLabel: "İzmir"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "20.00", priceLabel: "₺700", fromLabel: "Mersin", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "20.00", priceLabel: "₺700", fromLabel: "Mersin", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "09.30", priceLabel: "₺280", fromLabel: "Sivas", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "12.20", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "12.20", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "Ankara"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "12.20", priceLabel: "₺320", fromLabel: "Antalya", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "14.50", priceLabel: "₺220", fromLabel: "Mersin", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "18.40", priceLabel: "₺350", fromLabel: "Konya", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "22.15", priceLabel: "₺600", fromLabel: "Mersin", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "05.45", priceLabel: "₺280", fromLabel: "Antalya", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "05.45", priceLabel: "₺280", fromLabel: "Antalya", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "ali-osman-ulusoy", timeLabel: "08.30", priceLabel: "₺220", fromLabel: "Konya", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "11.20", priceLabel: "₺350", fromLabel: "Mersin", destinationLabel: "Konya"))
        allTrip.append(TripModel(brandImageView: "varan", timeLabel: "11.20", priceLabel: "₺350", fromLabel: "Mersin", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "kamil-koç", timeLabel: "15.10", priceLabel: "₺600", fromLabel: "Antalya", destinationLabel: "Mersin"))
        allTrip.append(TripModel(brandImageView: "metro", timeLabel: "19.30", priceLabel: "₺280", fromLabel: "Mersin", destinationLabel: "Antalya"))
        allTrip.append(TripModel(brandImageView: "pamukkale", timeLabel: "22.45", priceLabel: "₺220", fromLabel: "Mersin", destinationLabel: "Konya"))

        let from = UserDefaults.standard.string(forKey: "fromLabel") ?? ""
        let to = UserDefaults.standard.string(forKey: "toLabel") ?? ""
        tripFilter(from, to)
        tableView.register(UINib(nibName: "TripCell", bundle: nil), forCellReuseIdentifier: "TripCell")
    }
    func tripFilter(_ from: String,_ to: String) {
        filteredTrip = allTrip.filter { trip in
            return trip.fromLabel == from && trip.destinationLabel == to
        }
        
        tableView.reloadData()

    }


}

extension TripController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredTrip.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripCell
        cell.configureModel(filteredTrip[indexPath.row])
        
        
        if let selectedIndexPath = selectedIndexPath, selectedIndexPath == indexPath {
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.green.cgColor
        } else {
            cell.layer.borderWidth = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedTrip.destinationLabel != "" {
            buttonLabel.isEnabled = true
        } else {
            buttonLabel.isEnabled = true
        }
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }

        tableView.reloadData()
        
        
        
        let selected = filteredTrip[indexPath.row]
        selectedTrip = selected
       
    }
    

    
    
}
