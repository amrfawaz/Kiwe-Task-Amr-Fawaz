//
//  VenueCell.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 04/08/2023.
//

import UIKit

class VenueCell: UITableViewCell {

    @IBOutlet weak var labelVenueName: UILabel!
    @IBOutlet weak var labelVenueCategory: UILabel!
    @IBOutlet weak var labelVenueAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func confiure(name: String, category: String, address: String) {
        labelVenueName.text = name
        labelVenueCategory.text = category
        labelVenueAddress.text = address
    }
}
