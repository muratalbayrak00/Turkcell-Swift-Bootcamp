//
//  TableViewCell.swift
//  Lesson 10
//
//  Created by Kerem Demir on 5.03.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var famousImageView: UIImageView!
    @IBOutlet weak var famousThingsName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureModel(_ model: CityModel) {
        famousImageView.image = UIImage(named: model.famousImageView)
        cityName.text = model.cityName
        famousThingsName.text = model.famousThingsName
    }
    
}
