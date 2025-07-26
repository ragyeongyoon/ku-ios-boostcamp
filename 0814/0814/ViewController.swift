//
//  ViewController.swift
//  0814
//
//  Created by cscoi025 on 2019. 8. 14..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var friends: [Friends] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            print("data asset 가져올 수 없음")
            return
        }
        
        let jsonData: Data = dataAsset.data
        
        do {
            friends = try decoder.decode([Friends].self, from: jsonData)
        } catch {
            print("json decoding fail : " + error.localizedDescription)
        }
        
    print("\(friends.count)명 친구들 목록 불러옴")
        
    tableView.reloadData()
    
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
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendTableViewCell
        
        let friend: Friends = friends[indexPath.row]
//        cell.textLabel?.text = friend.name
        cell.nameLabel.text = friend.name
//        cell.ageLabel.text = friend.age
        cell.mobileLabel.text = friend.mobile
        
        if let age = friend.age{
            cell.ageLabel.text = "\(age)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            friends.remove(at: indexPath.row)
            tableView.reloadSections(IndexSet(indexPath.section...indexPath.section),
                                 with: UITableViewRowAnimation.automatic)
        }
    }
    
}

