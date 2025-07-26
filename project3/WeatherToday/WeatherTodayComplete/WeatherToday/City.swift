//
//  City.swift
//  WeatherToday
//
//  Created by cscoi029 on 2019. 8. 20..
//  Copyright © 2019년 ziggle. All rights reserved.
//

import UIKit

class City: NSObject, Codable {
    var city_name : String?
    var state : Int?
    var celsius : Double?
    var rainfall_probability : Int?
}
