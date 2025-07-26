//
//  SecondViewController.swift
//  tableView
//
//  Created by cscoi025 on 2019. 8. 13..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Lable: UILabel!

    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.Lable.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
