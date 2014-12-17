//
//  ViewController.swift
//  WhatColor
//
//  Created by to4iki on 12/17/14.
//  Copyright (c) 2014 to4iki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var colorCodeLabel: UILabel!
    
    private let timer = TimerManagement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        timer.repeat(1.0) {
            let now = self.timer.dateFormatter.stringFromDate(NSDate())
            let hex = now.stringByReplacingOccurrencesOfString(" : ", withString: "", options: nil, range: nil)
            
            self.timerLabel.text = self.timer.dateFormatter.stringFromDate(NSDate())
            self.colorCodeLabel.text = "#\(hex)"
            self.timerLabel.superview!.backgroundColor = UIColorUtil.colorWithHexString(hex, alpha: 1.0)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        timer.stop()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

