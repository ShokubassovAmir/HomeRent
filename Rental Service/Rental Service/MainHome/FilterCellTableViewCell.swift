//
//  FilterCellTableViewCell.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 5/8/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit

class FilterCellTableViewCell: UITableViewCell {

    @IBOutlet weak var actionLbl: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
