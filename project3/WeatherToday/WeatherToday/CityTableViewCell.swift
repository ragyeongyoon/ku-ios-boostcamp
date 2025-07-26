//
//  CityTableViewCell.swift
//  WeatherToday
//
//  Created by cscoi025 on 2019. 8. 14..
//  Copyright © 2019년 rcr. All rights reserved.


import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet var city_nameLable: UILabel
    @IBOutlet var stateLable: UILabel
    @IBOutlet var celsiusLable: UILabel
    @IBOutlet var rainfall_possibilityLable: UILabel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

