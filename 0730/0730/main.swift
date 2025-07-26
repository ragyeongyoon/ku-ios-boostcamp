//
//  main.swift
//  0730
//
//  Created by cscoi025 on 2019. 7. 30..
//  Copyright © 2019년 rcr. All rights reserved.
//

import Foundation

class Atm {
    var balance = 10
    var withdrawl = 10
    var deposit = 10
    var account = "Yoon"
    var transferAccount = "Yagom"
    var transferMoney = 10
    func checkBalance() {
        print("In \(account)'s account,\(balance) is left")
        
    }
    func withDraw() {
        print("In \(account)'s account, \(withdrawl) withdraw and \(balance - withdrawl) is left")
        
    }
    func depositMoney() {
        print("In \(account)'s account, \(deposit) deposit and \(balance + deposit) is left ")
    }
    func transfer() {
        print("From \(account)to \(transferAccount), \(transferMoney) trasferred and \(balance - transferMoney) is left in \(account)")
    }
    func lowBalance() {
        if balance - withdrawl + deposit < 0 {
        print("Low Balance")}
        else {func withDraw() {}}
        }
    init () {}
}
let accountOfYoon = Atm.init()
accountOfYoon.transfer()
accountOfYoon.balance = 0
accountOfYoon.deposit = 20
accountOfYoon.lowBalance()

// 반목문 - Loop
// 1에서 3까지 독같은 코드를 실행할겁니다. {} 안에 감싼 코드
for _ in 1...3 {
    //살행코드 들어올 자리
    print("블라블라")
}
// 1~3까지 똑같은 코드를 실행할겁니다
// 실행중인 횟수는 number가 알려줄거에요
for number in 1...5 {
    //실행코드 들어올 자리
    print("훌라훌라")
    if number % 2 == 0{
        print("짝수번째 실행중...")
    } else {
        print("홀수번째 실행중...")
    }
}

var first: Int = 3
var last: Int = 7
for i in first..<last {
    print("3부터 7")}

last = 10
for i in first...last {
    print("3부터 10")
}
