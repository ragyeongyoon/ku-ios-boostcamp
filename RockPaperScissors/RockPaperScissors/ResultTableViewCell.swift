//
//  ResultTableViewCell.swift
//  RockPaperScissors
//
//  Created by cscoi025 on 2019. 8. 16..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet var resultLable: UILabel!
    @IBOutlet var dateLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
