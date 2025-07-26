//
//  CityViewController.swift
//  WeatherToday
//
//  Created by cscoi029 on 2019. 8. 14..
//  Copyright © 2019년 ziggle. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView : UITableView!
    var cityLocation: String!
    var cityKor : String!
    var cities : [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset : NSDataAsset = NSDataAsset(name : cityLocation) else{
            print("fail to load city")
            return
        }
        
        let jsonData : Data = dataAsset.data
        let decoder : JSONDecoder = JSONDecoder()
        
        do{
            cities = try decoder.decode([City].self, from: jsonData)
        } catch{
            print("json decode failed" + error.localizedDescription)
        }
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = cityKor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityCellTableViewCell
        
        let city : City = cities[indexPath.row]
        cell.cityName?.text = city.city_name
        
        if let temp : Double = city.celsius{
            cell.celsiusLabel?.text = "섭씨 \(temp)도 / 화씨 \(temp * (9.0 / 5.0) + 32)도"
        }
        
        if let prob : Int = city.rainfall_probability{
            cell.rainLabel?.text = "강수확률 \(prob)%"
        }
        
        if city.state == 10{
            cell.weatherImage.image = #imageLiteral(resourceName: "sunny")
        }
        else if city.state == 11{
            cell.weatherImage.image = #imageLiteral(resourceName: "cloudy")
        }
        else if city.state == 12{
            cell.weatherImage.image = #imageLiteral(resourceName: "rainy")
        }
        else if city.state == 13{
            cell.weatherImage.image = #imageLiteral(resourceName: "snowy")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? CityCellTableViewCell else{
            print("sender가 cell이 아님")
            return
        }
        
        guard let nextViewController = segue.destination as? DetailViewController else{
            print("목적지가 DetailViewController가 아닙니다")
            return
        }
        
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        let info: City = self.cities[index.row]
        
        nextViewController.cityName = cell.cityName.text
        nextViewController.weather = cell.weatherImage.image
        nextViewController.probName = cell.rainLabel.text
        nextViewController.tempName = cell.celsiusLabel.text
        nextViewController.state = info.state
    }
    
    

}
