//
//  SecondViewController.swift
//  KUFileIOBasic
//
//  Created by cscoi025 on 2019. 8. 16..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var contacts: [ContactInfo] = []
    @IBOutlet var tableView: UITableView!
    let formatter: DateFormatter = {
        let dateformatter: DateFormatter = DateFormatter()
        dateformatter.dateFormat = "MMMM, dd, yyyy"
        return dateformatter
    }()

    
    
    func loadContactsFromFile() {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory,
                                                    in: .userDomainMask,
                                                    appropriateFor: nil,
                                                    create: false)
            .appendingPathComponent("Contacts.json")
        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: filePath)
        } catch {
            print("load data 실패" + error.localizedDescription)
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        do{
            contacts = try decoder.decode([ContactInfo].self, from: jsonData)
            print("파일에서 불러온 친구 수 : \(contacts.count)")
        } catch {
            print("decode json 실패" + error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadContactsFromFile()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        
        let contact: ContactInfo = contacts[indexPath.row]
        cell.nameLable.text = contact.name
        cell.mobileLable.text = contact.mobile
        
        if let created = contact.created {
            let dateString: String = self.formatter.string(from: created)
            cell.dateLable.text = dateString
        }
        
        return cell
    }
}
