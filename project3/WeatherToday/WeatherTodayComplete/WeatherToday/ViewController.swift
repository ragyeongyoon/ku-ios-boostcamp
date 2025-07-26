//
//  ViewController.swift
//  WeatherToday
//
//  Created by cscoi029 on 2019. 8. 14..
//  Copyright © 2019년 ziggle. All rights reserved.
//

import UIKit

//첫번째화면, 국가 보여줌
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    var countries : [Country] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = "세계 날씨"
       
        //self.navigationController?.navigationBar.barTintColor = UIColor.cyan
        //self.navigationController?.navigationBar.tintColor = UIColor.white
    
        
        guard let dataAsset : NSDataAsset = NSDataAsset(name : "countries") else{
            print("fail to load country")
            return
        }
        
        let jsonData : Data = dataAsset.data
        let decoder : JSONDecoder = JSONDecoder()
        
        do{
            countries = try decoder.decode([Country].self, from: jsonData)
        } catch{
            print("json decode failed" + error.localizedDescription)
        }
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country : Country = countries[indexPath.row]
        cell.textLabel?.text = country.korean_name
        if let countryName : String = country.asset_name {
            cell.imageView?.image = UIImage(named : "flag_"+countryName)
        }
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell else{
            print("sender가 cell이 아님")
            return
        }
        
        guard let nextViewController = segue.destination as? CityViewController else{
            print("목적지가 CityViewController가 아닙니다")
            return
        }
        
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        let info: Country = self.countries[index.row]
        
        nextViewController.cityLocation = info.asset_name
        nextViewController.cityKor = info.korean_name
    }


}

