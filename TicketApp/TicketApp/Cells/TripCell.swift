//
//  TripCell.swift
//  TicketApp
//
//  Created by murat albayrak on 22.03.2024.
//

import UIKit

class TripCell: UITableViewCell {

    
    @IBOutlet weak var tripCellImageView: UIImageView!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureModel(_ model: TripModel){
        tripCellImageView.image = UIImage(named: model.brandImageView)
        timelabel.text = model.timeLabel
        priceLabel.text = model.priceLabel
        fromLabel.text = model.fromLabel
        destinationLabel.text = model.destinationLabel
    }
    

}
