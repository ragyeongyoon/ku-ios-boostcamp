//
//  main.swift
//  0806
//
//  Created by cscoi025 on 2019. 8. 6..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

print("Hello, World!")

class Person {
    var name: String
    var weight: Double?
    var room: Apartment?
    
    init(name: String) {
        self.name = name
    }
}
    
class Apartment {
    var resident: Person?
    var roomNumber: Int
    init(room: Int){
        self.roomNumber = room
    }
}
    
let yagom: Person = Person(name: "YAGOM")
let mine: Person = Person(name: "MINA")
    
let towerPalace: Apartment = Apartment(room: 101)

yagom.room = towerPalace
towerPalace.resident = yagom

if let room = yagom.room {
    print("\(yagom.name)의 집은 \(room.roomNumber)호입니다")
} else {
    print("집 없음")
}

let weight: Double? =
yagom.room?.resident?.weight

let name: String? =
yagom.room?.resident?.name
print(weight)
print(name)



yagom.room = nil
towerPalace.resident = nil

