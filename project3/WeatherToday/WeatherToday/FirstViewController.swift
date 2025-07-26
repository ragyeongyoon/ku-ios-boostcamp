//
//  ViewController.swift
//  WeatherToday
//
//  Created by cscoi025 on 2019. 8. 14..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var countries: [Country] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
        print("실패")
        return
        }
        
        let jsonData: Data = dataAsset.data
        
        do {
            countries = try decoder.decode([Country].self, from: jsonData)
        } catch {
            print("json dcoding fail :" + error.localizedDescription)
        }
        
        tableView.reloadData()
        

       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell",
            for: indexPath)
        
        let country: Country = countries[indexPath.row]
        
        cell.textLabel?.text = country.korean_name
        cell.imageView?.image = UIImage(named: "flag_" + country.asset_name)
        
        return cell
    }


}

