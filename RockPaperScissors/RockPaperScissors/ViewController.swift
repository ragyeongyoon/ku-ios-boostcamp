//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by cscoi025 on 2019. 8. 16..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttonRock: UIButton!
    @IBOutlet var buttonScissor: UIButton!
    @IBOutlet var buttonPaper: UIButton!
    @IBOutlet var winrateLable: UILabel!
    @IBOutlet var computerLable: UILabel!
    @IBOutlet var userLable: UILabel!
    @IBOutlet var resultLable: UILabel!
    var results: [Result] = []
    var gameTimes: Double = 0
    var winTimes: Double = 0
    
    func saveResultstoFile() {
        let newResult: Result = Result()
        newResult.whoWin = resultLable.text
        newResult.time = Date()
        newResult.winRate = winrateLable.text
        results.append(newResult)
        saveResultsToFile()
    }
    
    func calculateWinRate() {
        var winrate: Double = 100 * winTimes / gameTimes
        winrateLable.text = String(winrate)
        
        
    
    
    }
    
    @IBAction func RockbuttonClicked(_sender: UIButton) {
        var a: Int = Int(arc4random() % 3)
        gameTimes = gameTimes + 1
        userLable.text = "✊"
        if a == 0 {
            computerLable.text = "✊"
            resultLable.text = "비김!"
        } else if a == 1 {
            computerLable.text = "✌️"
            resultLable.text = "사용자 승!"
            winTimes = winTimes + 1
        } else {
            computerLable.text = "✋"
            resultLable.text = "컴퓨터 승!"
        }
        calculateWinRate()
        saveResultstoFile()
        
        
        
    }
    
    @IBAction func scissorButtonClicked(_sender: UIButton) {
        var b: Int = Int(arc4random() % 3)
        gameTimes = gameTimes + 1
        userLable.text = "✌️"
        if b == 0 {
            computerLable.text = "✊"
            resultLable.text = "컴퓨터 승!"
        } else if b == 1 {
            computerLable.text = "✌️"
            resultLable.text = "비김"
        } else {
            computerLable.text = "✋"
            resultLable.text = "사용자 승!"
            winTimes = winTimes + 1
        }
        calculateWinRate()
        saveResultstoFile()
        
    }
    
    @IBAction func paperButtonClicked(_sender: UIButton) {
         var c: Int = Int(arc4random() % 3)
        gameTimes = gameTimes + 1
        userLable.text = "✋"
        if c == 0 {
            computerLable.text = "✊"
            resultLable.text = "사용자 승!"
            winTimes = winTimes + 1
        } else if c == 1 {
            computerLable.text = "✌️"
            resultLable.text = "컴퓨터 승!"
        } else {
            computerLable.text = "✋"
            resultLable.text = "비김"
        }
        calculateWinRate()
        saveResultstoFile()
        
    }

    func saveResultsToFile() {
        let encoder: JSONEncoder = JSONEncoder()
        let jsonData: Data
        do {
            jsonData = try encoder.encode(results)
        } catch {
            print("encode fail")
            return
        }
        let filePath = try!
            FileManager.default.url(for: .applicationDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: true)
        .appendingPathComponent("Results.json")
        do {
            try jsonData.write(to: filePath)
        } catch {
            print("write to path fail")
            return
        }
        print("complete saving")

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
