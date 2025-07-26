//
//  Result.swift
//  RockPaperScissors
//
//  Created by cscoi025 on 2019. 8. 16..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class Result: NSObject, Codable {
    
    var whoWin: String?
    var time: Date?
    var winRate: String?
    var winTimes: Int?
    var gameTimes: Int?
}
