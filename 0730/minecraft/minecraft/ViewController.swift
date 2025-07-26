//
//  ViewController.swift
//  minecraft
//
//  Created by cscoi025 on 2019. 7. 30..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

var stepsToMove: Int = 0

class Hero : UIView{
    var name: String = "Alex"
    
    @objc func moveDown() {
        for _ in 0..<stepsToMove{
            let viewHeight = superview!.frame.size.height
            if frame.origin.y + self.frame.size.height <= viewHeight {
                self.frame.origin.y += 30}
        }
    }
    @objc func moveRight() {
        for _ in 0..<stepsToMove{
        let viewWidth = superview!.frame.size.width
        if frame.origin.x + self.frame.size.width <= viewWidth
        {self.frame.origin.x += 30}
        }}
    @objc func moveUP() {
        for _ in 0..<stepsToMove{
        if frame.origin.y >= 30{
            self.frame.origin.y -= 30}
        }}
    @objc func moveLeft() {
        for _ in 0..<stepsToMove{
        if frame.origin.x >= 30 {
            self.frame.origin.x -= 30}
        }}
}

class ViewController: UIViewController {
    
    let alex : Hero = Hero()
    let stepper: UIStepper = UIStepper()
    let numberLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        let mainViewSize: CGSize = self.view.frame.size
        
        self.alex.backgroundColor = UIColor.brown
        self.alex.frame = CGRect(x: 0,
                                 y: 0,
                                 width: mainViewSize.width / 5,
                                 height: mainViewSize.height / 8)
        self.view.addSubview(self.alex)
    
        let downButton: UIButton = UIButton(type:
        UIButtonType.system)
        downButton.setTitle("Down",
                            for: UIControlState.normal)
        downButton.addTarget(alex,
                           action: #selector(alex.moveDown),
                           for: UIControlEvents.touchUpInside)
       
        
        let rightButton: UIButton = UIButton(type:
        UIButtonType.system)
        rightButton.setTitle("Right",
                             for: UIControlState.normal)
        rightButton.addTarget(alex,
                              action: #selector(alex.moveRight),
                             for: UIControlEvents.touchUpInside)
        
        let upButton: UIButton = UIButton(type:
            UIButtonType.system)
        upButton.setTitle("Up",
                            for: UIControlState.normal)
        upButton.addTarget(alex,
                             action: #selector(alex.moveUP),
                             for: UIControlEvents.touchUpInside)
        
        
        let leftButton: UIButton = UIButton(type:
            UIButtonType.system)
        leftButton.setTitle("Left",
                             for: UIControlState.normal)
        leftButton.addTarget(alex,
                              action: #selector(alex.moveLeft),
                              for: UIControlEvents.touchUpInside)
        
        self.numberLabel.text = "0"
        self.numberLabel.textColor = UIColor.red
        
        self.stepper.value = 0
        self.stepper.minimumValue = 0
        self.stepper.isContinuous = false
        self.stepper.stepValue = 1
        self.stepper.addTarget(self,
                               action:
                                #selector
                                (stepperValueChanged(_:)),
                                for:
                                UIControlEvents.valueChanged)
        
        let upperStack: UIStackView =
            UIStackView(arrangedSubviews: [numberLabel, stepper])
        upperStack.alignment = UIStackViewAlignment.center
        upperStack.axis = .horizontal
        upperStack.distribution = .fillEqually
        upperStack.spacing = 8
        upperStack.frame = CGRect(x: 0,
                                  y: mainViewSize.height - 88,
                                  width: mainViewSize.width,
                                  height: 44)
        self.view.addSubview(upperStack)
        
        let hStack: UIStackView = UIStackView(arrangedSubviews:
        [downButton, rightButton, upButton, leftButton, numberLabel, stepper])
        hStack.alignment = UIStackViewAlignment.center
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 8
        hStack.frame = CGRect(x: 0,
                              y: mainViewSize.height - 44,
                              width: mainViewSize.width,
                              height: 44)
        self.view.addSubview(hStack)
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
    stepsToMove = Int(sender.value)
        self.numberLabel.text = "\(stepsToMove)"
    }
}
