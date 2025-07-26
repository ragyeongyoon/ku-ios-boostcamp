//
//  main.swift
//  0731
//
//  Created by cscoi025 on 2019. 7. 31..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

print("Hello, World!")

enum Color {
    case purple
    case green
    case yellow
}
enum Language {
    case korean
    case spanish
    case english
    case russian
}
enum Gender {
    case woman
    case man
}
enum Weather {
    case sunny
    case cloudy
    case windy
    case hot
    case cold
}
enum Day {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}
enum Direction {
    case right
    case left
    case straight
}
//Hero Class 만들기
//Hero Class의 객체는 ...
//name 속성을 갖습니다
//moveForward 함수로 앞으로 이동할 수 있어요
//destroy 함수로 무언가 부술 수 있어요

class Hero {
    var name: String = "alex"
    var hairColor: Color = Color.green
    var motherLanguage: Language = Language.spanish

    //앞으로 갈 횟수인 step을 조정합니다.
    func moveForward(steps: Int) {
        for step in 1...steps {
            print("앞으로 갑니다 \(step)만큼 지나옴")
            
        }
    }
    
    func destroy(something: String) {
        print("\(something)을 부순다")
    }
    func turn(direction: Direction, counts: Int) {
        for count in 1...counts {
            print("\(direction)으로 \(count)번 회전합니다")}
    }
    func turnAround(direction : Direction) {
        if direction == Direction.left || direction == Direction.right {
            self.turn(direction: Direction.left, counts: 2)
            print("뒤돌았습니다")
        } else {
            print("앞으로 갑니다")
        }
    }
    func fight(someone: Hero){
        if someone.name == "steve" || someone.name == "alex" {
            print("say hello")}
        else if someone.name == "cooper" {
            print("meet \(someone.name)")
            self.destroy(something: someone.name)
            
        }
        else {print("그냥 지나갑니다")}
    }
    func meet(someone: Hero){
        print("\(self.name)가 \(someone.name)을 만납니다. I see you.")
    }
}

let alex: Hero = Hero()
let steve: Hero = Hero()
alex.name = "alex"
steve.name = "steve"
alex.meet(someone: steve)
alex.name = "알렉스"
alex.moveForward(steps: 5)
alex.destroy(something: "벽돌")
alex.turn(direction: Direction.right, counts: 2) //뒤로 돌아
alex.turnAround(direction: Direction.right)
