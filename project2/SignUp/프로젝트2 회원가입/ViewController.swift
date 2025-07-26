//
//  ViewController.swift
//  프로젝트2 회원가입
//
//  Created by cscoi025 on 2019. 8. 8..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idField: UITextField!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tapGesture: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.idField.text = UserInformation.shared.name
    }
    


}
