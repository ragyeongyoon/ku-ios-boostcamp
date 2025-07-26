//
//  SecondViewController.swift
//  RockPaperScissors
//
//  Created by cscoi025 on 2019. 8. 16..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var results: [Result] = []
    @IBOutlet var tableView: UITableView!
    @IBOutlet var winRateLabel: UILabel!
    
    let formatter: DateFormatter = {
        let dateformatter: DateFormatter = DateFormatter()
        dateformatter.dateStyle = .medium
        return dateformatter
    }()
    
    func loadResultsFromFile() {
        let filePath = try!
        FileManager.default.url(for: .applicationDirectory,
                                in: .userDomainMask,
                                appropriateFor: nil,
                                create: false)
        .appendingPathComponent("Results.json")
        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: filePath)
        } catch {
            print ("fail")
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        do {
            results = try decoder.decode([Result].self, from:jsonData)
            print("불러온 결과 수 : \(results.count)")
            
        } catch {
            print("decode json 실패" + error.localizedDescription)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let result: Result = results[indexPath.row]
        cell.textLabel?.text = result.whoWin
        
       
        if let time = result.time {
            
            let dateString: String = self.formatter.string(from: time)
            cell.detailTextLabel?.text = dateString
        }
        return cell
    }

    @IBAction func touchUpResetButton(_sender: UIButton) {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory,
                                                    in: .userDomainMask,
                                                    appropriateFor: nil,
                                                    create: true)
            .appendingPathComponent("results.json")
        do {
            try FileManager.default.removeItem(at: filePath)
            results.removeAll()
        } catch {
            print("reset 실패" + error.localizedDescription)
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadResultsFromFile()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    


}
