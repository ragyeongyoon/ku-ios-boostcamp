//
//  ViewController.swift
//  MyDatePicker
//
//  Created by cscoi025 on 2019. 8. 7..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy//MM/dd hh:ss"
        return formatter
        } ()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value changed")
        
        let date: Date = self.datepicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.datepicker.addTarget(self,
                                  action: #selector(self.didDatePickerValueChanged(_:)),
                                  for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

