//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by cscoi025 on 2019. 8. 14..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weathers: [Weather] = []
    @IBOutlet var tableView: UITableView!
    var cityLocation: String!
    var cityKor: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: cityLocation) else {
            print("fail to load weather")
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        let jsonData: Data = dataAsset.data
        
        do{
            cities = try decoder.decode(([Weather].self), from: <#T##Data#>)
        }
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
