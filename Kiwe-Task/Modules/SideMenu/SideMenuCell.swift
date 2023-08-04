//
//  SideMenuCell.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 04/08/2023.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelItemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
