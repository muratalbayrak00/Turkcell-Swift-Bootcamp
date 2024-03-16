//
//  cityCell.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit

class cityCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
           if let cityName = cityLabel.text { // Şehir adını aldık
               print(cityName)
              
           }
        } else {
        
        }
        
        
        
    }
    
    func configure(_ city: CityModel) {
        cityLabel.text = city.cityName
    }
    
}
