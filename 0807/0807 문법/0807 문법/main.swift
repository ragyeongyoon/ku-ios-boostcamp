//
//  main.swift
//  0807 문법
//
//  Created by cscoi025 on 2019. 8. 7..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

// Collection



// Array - 배열, (리스트)
let myAge: Int = 0
 // 같은 타입을 한줄로 줄세워 놓는 타입
var favoriteNumbers: [Int] = [1, 3, 4]
if favoriteNumbers.count > 3 {
    let third: Int = favoriteNumbers[3]
}

favoriteNumbers.append(5)
print(favoriteNumbers.count)
print(favoriteNumbers[0])

//배열에 있는 요소 바꾸기
favoriteNumbers[0] = 100
print(favoriteNumbers[0])

//중간에 제거
favoriteNumbers.remove(at: 0)
print(favoriteNumbers)

//빈 기차
favoriteNumbers.removeAll()
favoriteNumbers = []

print(favoriteNumbers.first)
favoriteNumbers.last
if let first: Int = favoriteNumbers.first {
    print(first)
} else {
    print("empty")
}

if favoriteNumbers.count > 0 {
    let zeroIndex: Int = favoriteNumbers[0]
}

class Person {
    var name: String?
}

var friends: [Person] = []
let yagom: Person = Person()
friends.append(yagom)
friends.append(Person())
friends.append(Person())

friends.removeLast()
let firstName = friends[1].name
for friend in friends {
    print(friend.name)
}


// Dictionary key:value
var contacts: [String:String] =
    ["길동":"01022223333",
     "춘향":"01044445555",
     "둘리":"01033432344"]

if let 길동연락처: String = contacts["길동"] {
    print(길동연락처)
}
    
contacts["야곰"] = "01022234443"

var classmates: [Int:String] = [1:"길동",
                                2:"춘향",
                                3:"둘리"]

classmates.removeValue(forKey: 1)
classmates[1] = nil


//Any 타입 확인
var any: Any = 0
any = "abc"
any = 1.0
any = 1

var another: Any = "aaa"
another = 1.5
another = 2

if let value: Int = any as? Int,
    let aValue: Int = another as? Int {
    let result: Int = value + aValue
    print(result)
}

var anys: [Any] = [1, 3.5, "abc", 6]
if let value = anys[2] as? String {
    print(value)
}

//
var anyValues: [String:Any] = ["길동":123,
                               "춘향":101.3432,
                               "둘리":"020442"]
if let value: Int = anyValues["길동"] as? Int {
    print(value * 100)
} else {
    print("계산이 되지 않습니다")
}

if let value: String = anyValues["둘리"] as? String {
    print(value)
}
