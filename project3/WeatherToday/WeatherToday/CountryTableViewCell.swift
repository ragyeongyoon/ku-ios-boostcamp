//
//  CountryTableViewCell.swift
//  WeatherToday
//
//  Created by cscoi025 on 2019. 8. 14..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet var countryNameLable: UILabel!
    @IBOutlet var countryFlagImage: UIImageView!
    


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
