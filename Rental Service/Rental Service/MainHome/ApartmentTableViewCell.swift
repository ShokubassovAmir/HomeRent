//
//  ApartmentTableViewCell.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 3/31/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit

class ApartmentTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var isHotImg: UIImageView!
    @IBOutlet weak var datePostedLbl: UILabel!
    @IBOutlet weak var ownerLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var roomsLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var imgLike: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
