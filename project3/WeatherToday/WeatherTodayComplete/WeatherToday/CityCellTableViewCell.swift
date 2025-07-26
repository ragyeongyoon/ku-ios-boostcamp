//
//  CityCellTableViewCell.swift
//  WeatherToday
//
//  Created by cscoi029 on 2019. 8. 20..
//  Copyright © 2019년 ziggle. All rights reserved.
//

import UIKit

class CityCellTableViewCell: UITableViewCell {

    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var rainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
