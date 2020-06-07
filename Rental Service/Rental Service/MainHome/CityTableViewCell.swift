//
//  CityTableViewCell.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 5/9/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
