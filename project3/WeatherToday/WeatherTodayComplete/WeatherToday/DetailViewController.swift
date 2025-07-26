//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by cscoi029 on 2019. 8. 20..
//  Copyright © 2019년 ziggle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var weatherImage : UIImageView!
    @IBOutlet var weatherLabel : UILabel!
    @IBOutlet var tempLabel : UILabel!
    @IBOutlet var probLabel : UILabel!
    
    var cityName : String!
    var state : Int!
    var weather : UIImage!
    var tempName : String!
    var probName : String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = cityName
        weatherImage.image = weather
        tempLabel.text = tempName
        probLabel.text = probName
        if state == 10{
            weatherLabel.text = "맑음"
        }
        else if state == 11{
            weatherLabel.text = "구름"
        }
        else if state == 12{
            weatherLabel.text = "비"
        }
        else if state == 13{
            weatherLabel.text = "눈"
        }
    }

}
