//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by cscoi025 on 2019. 8. 8..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        override func viewDidLoad() {
        super.viewDidLoad()
            
    let tapRecognizer = UITapGestureRecognizer
        (target: self, action: #selector(tapView(gestureRecognizer:)))
    self.view.addGestureRecognizer(tapRecognizer)
            
    }
        
        @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
            print(Tapped)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    @IBAction func tapview(_ sender: UITapGestureRecognizer)
        self.view.endEditing(true)
    }
    
}
