//
//  cityCell.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit

class cityCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    var fromText: String = ""
    var toText: String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        if selected {
            if let cityName = cityLabel.text { // Şehir adını aldık
                fromText = cityName
                print(fromText)
            } else {
                print("else")
            }
        } else {
            
        }
    }
    
    
   
    func configure(_ city: CityModel) {
        cityLabel.text = city.cityName
    }
    
}
