//
//  MyApsTableViewCell.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit

class MyApsTableViewCell: UITableViewCell {

  
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var imgIsHot: UIImageView!
    @IBOutlet weak var datePosted: UILabel!
    @IBOutlet weak var ownerLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var roomLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var manageBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.manageBtn.layer.cornerRadius = 10
        self.manageBtn.layer.borderWidth = 0.5
        self.manageBtn.layer.borderColor = UIColor(rgb: 0x08B0E8).cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
