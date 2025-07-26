//
//  UserInformation.swift
//  프로젝트2 회원가입
//
//  Created by cscoi025 on 2019. 8. 8..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var password: String?
    var selfIntroduction: String?
    var checkPassword: String?
    var phoneNumber: String?
    var birthday: String?
}
