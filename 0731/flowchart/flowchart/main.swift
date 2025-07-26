//
//  main.swift
//  flowchart
//
//  Created by cscoi025 on 2019. 7. 31..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

var money: Int = 39500
var x: Int = 0
var y: Int = 0
var z: Int = 0

let whiskeyPrice = 10000
let beerPrice = 5000
let sojuPrice = 2000

while money >= whiskeyPrice {
    x = x + 1
    money = money - whiskeyPrice
}

while money >= beerPrice {
    y = y + 1
    money = money - beerPrice
}

while money >= sojuPrice {
    x = x + 1
    money = money - sojuPrice
}

print("잔액은 \(money)원")
print("마신 술은 양주 \(x)병, 맥주 \(y)병, 소주 \(z)병")
