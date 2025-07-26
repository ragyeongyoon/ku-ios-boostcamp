//
//  ContactModal.swift
//  0812
//
//  Created by cscoi025 on 2019. 8. 12..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var mobile: String
    
    init(name: String, mobile: String) {
        self.name = name
        self.mobile = mobile
    }
}

class ContactModel: NSObject {
    
    var friends: [Person] = []
    
    override init() {
        super.init()
        
        friends.append(Person.init(name:"독수리", mobile:"01011112222"))
        friends.append(Person.init(name:"고영아", mobile:"01011112222"))
        friends.append(Person.init(name:"미영", mobile:"010111333222"))
        friends.append(Person.init(name:"나라", mobile:"010111124422"))
        friends.append(Person.init(name:"슬기", mobile:"010111122552"))
        friends.append(Person.init(name:"둘리", mobile:"01011112255"))
        friends.append(Person.init(name:"뚜비", mobile:"01011112444"))
        friends.append(Person.init(name:"나나", mobile:"01011113333"))
        friends.append(Person.init(name:"효영", mobile:"01011112777"))
        friends.append(Person.init(name:"재덕", mobile:"01078912222"))
        friends.append(Person.init(name:"수영", mobile:"01011947222"))
        friends.append(Person.init(name:"나비", mobile:"01011112444"))
        friends.append(Person.init(name:"재철", mobile:"01011112444"))
        friends.append(Person.init(name:"효정", mobile:"01011112444"))
        friends.append(Person.init(name:"민정", mobile:"01011112444"))
        
    
    }
}
