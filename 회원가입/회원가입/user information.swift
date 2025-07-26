//
//  user information.swift
//  회원가입
//
//  Created by cscoi025 on 2019. 8. 7..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
