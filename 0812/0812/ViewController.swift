//
//  ViewController.swift
//  0812
//
//  Created by cscoi025 on 2019. 8. 12..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let defaultCellIdentifier = "cell"
    let model: ContactModel = ContactModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return "전화번호부"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView (_ tableView: UITableView,
                    numberOfRowsInSection section: Int) -> Int {
//        if section % 2 == 0 {
//            return 0 }
//        else {
//            return 10}
        
        return model.friends.count
    }
    
    // 특정 section에 해당하는 row의 값을 return
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier,
                                                 for: indexPath)
        
//        cell.textLabel?.text = "\(indexPath.section) section"
//        cell.detailTextLabel?.text = "\(indexPath.row) row"
        let friend: Person = model.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.mobile
        
        return cell
    }
}

