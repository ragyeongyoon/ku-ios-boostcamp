//
//  main.swift
//  0726
//
//  Created by cscoi025 on 2019. 7. 26..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

print("Hello, World!")

//: Playground - noun: a place where people can play

class Tiger {
    // tiger 공장
    var age:Int = 3
    var name: String = "호랑이"
    func sleeping() {
        print("쿨쿨")
    }
    init() {
    }
}

let kitty = Tiger.init()
kitty.sleeping()
kitty.age = 1
kitty.name = "호랭이"
let tigger = Tiger.init()
tigger.sleeping()
let kutiger = Tiger.init()

class Human {
    // human 공장
    var age: Int = 0
    var name: String = "사람"
    func selfintroduction() {
        print("저는 \(age)살 \(name) 사람입니다")
    }
    func sing() {
        print("랄랄라")
    }
    init() {
    }
}

let ragyeong = Human.init()
ragyeong.age = 22
ragyeong.name = "윤라경"
ragyeong.selfintroduction()
let teacher = Human.init()
teacher.age = 30
teacher.name = "yagom"
teacher.selfintroduction()

class Dog {
    
    var age: Int = 10
    var name = "멍멍이"
    var sound = "찡찡"
    func bark() {
        print("\(name)는 \(sound) 짖어요")
    }
    func housekeeping() {
        print("집을 지켜요")
    }
    init() {
    }
}
let snoopy = Dog.init()
snoopy.name = "스누피"
snoopy.sound = "멍멍"
snoopy.bark()
let goopy = Dog.init()
goopy.name = "구피"
goopy.sound = "왈왈"
goopy.bark()

class Cat {
    var age = 3
    var name = "고얌미"
    var sound = "냥냥"
    func bark() {
        print("\(name)는 \(age)살이다 \(sound)")
    }
    init() {
    }
}
let catty = Cat.init()
catty.bark()
catty.age = 5
catty.name = "Kitty"
catty.bark()

