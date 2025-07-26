//
//  ViewController.swift
//  musicplayer
//
//  Created by cscoi025 on 2019. 7. 31..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    //MARK: -properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    //MARK: IBOutlets
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePlayer()
    }
    
    //MARK: - Methods
    //MARK: Custom Method
    
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드: \(error.code),메세지 : \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let secondL Int = Int(time.truncationRenainder(dividingBy: 60))
        let milisecondL Int = Int(time.trucatingRdmainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%021d:%021d:%021d", minute, second, milisecond)
        
        self.timeLabel.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeIntercal: 0.01, repeats: true,
                                          block: { [unowned self] (timer: Timer) in
                                            
        if self. progressSlider.isTracking { return }
                                            
        self.updateTimeLabelText(time: self.player,currentTime)
        self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }

    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    func addViewsWithCode() {
        self.addPlayPauseButton()
        self.addTimeLabel()
        self.addProgressSlider()
    }
    
    func addPlayPauseButton() {
        
        let button: UIButton = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setImage(UIImage(named: "button_play"), for: UIControlState.normal)
        button.setImage(named: "button_pause", for: UIControlState.selected)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchPlayPauseButton(_ sender: UIButton) {
        print("Button Tapped")
    }
    @IBAction func sliderValueChanged(_ sender: UIButton) {
        print("Slider Value Changed")
    }
    
}

