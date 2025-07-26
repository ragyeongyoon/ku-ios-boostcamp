//
//  ViewController.swift
//  tableView
//
//  Created by cscoi025 on 2019. 8. 13..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    let defaultCellIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.section).\(indexPath.row)"
        
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat{
    if indexPath.section % 2 == 0 {
    return 50
    } else {
    return 150
    }
        
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPink" || segue.identifier == "showBlue" {
            guard let nextViewController = segue.destination as? SecondViewController else {
                print("다음 화면ㅇ이 Second 가 아님")
                return
            }
            guard let senderCell = sender as? UITableViewCell else {
                print("sender가 cell 이 아님")
                return
            }
            
            nextViewController.text = senderCell.textLabel?.text
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)의 \(indexPath.row)의 Row를 사용자가 선택함")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
      
        if indexPath.row % 2 == 0 {
            self.performSegue(withIdentifier: "showPink",
                              sender: cell)
        } else {
            self.performSegue(withIdentifier: "showBlue",
                              sender: cell)
        }
    }
    
    
}
