//
//  main.swift
//  0802
//
//  Created by cscoi025 on 2019. 8. 2..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

//영웅의 정보를 나타내는 클래스
class Hero {
    var name: String = "Alex"
    var age: Int = 0
    var xPosition: Int = 0
    var yPosition: Int = 0
}

//사용자에게 표현해주는 클래스
class Printer {
    func printCurrentPosstion(x: Int, y: Int) {
        print("현재 좌표는 \(x), \(y)입니다")
    }
    func printName(name: String) {
        print("이름은 \(name)입니다")
        
    }
    func printAge(age: Int) {
        print("나이는 \(age)입니다")
    }
}

//다른 두 클래스의 객체를 조종하는 클래스
class HeroController {
    var hero: Hero = Hero()
    var printer: Printer = Printer()
    
    func moveHero(toX: Int, y: Int) {
        hero.xPosition = toX
        hero.yPosition = y
        printer.printCurrentPosstion(x: toX,
                                     y: y)
    }
    func changeHeroName(name: String) {
        hero.name = name
        printer.printName(name: name)
        
    }
    func changeHeroAge(age: Int) {
        hero.age = age
        printer.printAge(age: age)
    }
}

let controller: HeroController = HeroController()
controller.changeHeroName(name: "yagom")
controller.changeHeroAge(age: 1)
controller.moveHero(toX: 50, y: 50)
