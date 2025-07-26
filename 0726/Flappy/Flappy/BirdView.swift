//
//  BirdView.swift
//  Flappy
//
//  Created by cscoi025 on 2019. 7. 26..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class BirdView: UIImageView {
    var name = "flapppy  bird"
    var age = 10
    var color = "yellow"
    
    @IBAction func moveUp() {
        print("위로 날아")
        let viewHeight = superview!.frame.size.height
        if frame.origin.y >= 0 {
            self.frame.origin.y -= 30}
    }
    @IBAction func moveRight() {
        print("오른쪽으로 날아")
        let viewWidth = superview!.frame.size.width
        if frame.origin.x <= viewWidth {
            self.frame.origin.x += 30}
    }
    @IBAction func moveDown() {
        print("아래로 날아")
        let viewHeight = superview!.frame.size.height
        if frame.origin.y <= viewHeight - 100 {
            self.frame.origin.y += 30}
    }
    @IBAction func moveLeft() {
        print("왼쪽으로 날아")
        let viewWidth = superview!.frame.size.width
        if self.frame.origin.x >= 0 {
            self.frame.origin.x -= 30}
    }
}
