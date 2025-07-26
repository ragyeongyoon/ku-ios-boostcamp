//
//  BookInformationViewController.swift
//  MyBooks
//
//  Created by cscoi025 on 2019. 8. 22..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class BookInformationViewController: UIViewController {

    var titleInfo: String?
    var publisherInfo: String?
    var authorInfo: String?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.titleLable?.text = self.titleInfo
        self.publisherLable?.text = self.publisherInfo
        self.authorLable?.text = self.authorInfo
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
