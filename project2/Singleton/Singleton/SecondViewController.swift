//
//  SecondViewController.swift
//  Singleton
//
//  Created by cscoi025 on 2019. 8. 8..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = Myinfo.shared.name
        ageField.text = Myinfo.shared.age
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldTextEdited(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
