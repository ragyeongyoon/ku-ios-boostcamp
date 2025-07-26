//
//  main.swift
//  0729
//
//  Created by cscoi025 on 2019. 7. 29..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

//값을 저장할 공간 변수와 상수 - var, let
var name: String = "yagom"
name = "라경"
var age: Int = 50
age = 22

print(name)
print(age)
print("제 이름은 \(name)이고요 나이는 \(age)입니다")

//상수
let pi: Double = 3.141592
var radius: Double = 4.0
var 넓이 = pi * radius * radius
print(넓이)

radius = 6.5
넓이 = pi * radius * radius
print(넓이)

class Human {
    var name = "human"
    var age = 10
    
    func selfintroduction() {
        print("\(name) is \(age) years old")
    }
}
let minji: Human = Human.init()
minji.name = "minji"
minji.selfintroduction()

//이름짓기
//영어
//카멜케이스
//변수이름, 함수이름, 상수이름 - 소문자
//smallLetterCameCase

//타입 이름 - 대문자
//BigLetterCamelCase

//연산자
// <
// >
// !=
// ==
// <=
// >=

var a: Int = 100
var b: Int = 200
if a < b {
    print("a는 b보다 작아요")
} else if  a == b {
    print("a는 b랑 같아요")
} else {
    print("a는 b보다 커요")
}

b = 30
if a < b {
    print("b is bigger than a")
} else if a == b {
    print("a and b are same")
} else {
    print("a is bigger than b")
}

var c = 23.5
var d = 53.542
if c < d {
    print("\(c * d)")
} else if c > d {
    print("\(c + d)")
} else {
    print("\(b)")
}

class Person {
    var age: Int = 10
    var name: String = "yoon"
    init() {
    }
}
let yoon = Person.init()
yoon.age = 15
let hana = Person.init()
hana.name = "hana"

//조건
//만약에. Yoon의 나이가 20대이면 이걸 실행해달라
if 20 <= yoon.age && yoon.age < 30 {
    print("Yoon은 20대")
}
else if 10 <= yoon.age && yoon.age < 20{
    print("Yoon은 10대")}
else if 30 <= yoon.age && yoon.age < 40 {
    print("Yoon은 30대")}
else if 0 <= yoon.age && yoon.age < 10 {
    print("Yoon은 어린이")}
else {print("Yoon은 늙었음")}

if yoon.age < 20 || yoon.age > 29 {
    print("20 대가 아닙니다")
} else if yoon.age < 10 || yoon.age < 80 {
    print("라경은 어리거나 늙었다")
}

if yoon.age + hana.age > 30 {
    print("평균 열 다섯살 이상")
}

if yoon.age > 50 && hana.age > 50 {
    print("둘 다 늙었다")
}

if yoon.age - hana.age > -10 || yoon.age - hana.age < 10 {
    print("나이 차이가 적다")
};










