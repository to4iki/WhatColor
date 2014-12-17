//
//  TimerManagement.swift
//  WhatColor
//
//  Created by to4iki on 12/18/14.
//  Copyright (c) 2014 to4iki. All rights reserved.
//

import Foundation

class TimerManagement {
    
    private var _timer: NSTimer? = nil

    var running: Bool {
        return _timer != nil
    }
    
    lazy var dateFormatter: NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateStyle = .MediumStyle
        df.timeStyle = .ShortStyle
        df.dateFormat = "HH : mm : ss"
        df.locale = NSLocale(localeIdentifier: "ja_JP")
        
        return df
        }()
    
    /**
    repeat timer
    
    :param: interval
    :param: exec
    */
    func repeat(interval: NSTimeInterval, exec: () -> ()) {
        _timer = NSTimer.bk_scheduledTimerWithTimeInterval(
            interval,
            block: { [weak self] timer in
                exec()
            },
            repeats: true
        )
    }
    
    /**
    stop timer
    */
    func stop() {
        if let timer = _timer {
            timer.invalidate()
        }
        _timer = nil
    }
}
