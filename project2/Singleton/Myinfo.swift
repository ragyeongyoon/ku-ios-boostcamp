//
//  Myinfo.swift
//  Singleton
//
//  Created by cscoi025 on 2019. 8. 8..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class Myinfo: NSObject {
    
    var name: String?
    var age: String?
    
    static let shared: Myinfo =  Myinfo()
}
