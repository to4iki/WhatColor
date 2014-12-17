//
//  UIColorUtil.swift
//  WhatColor
//
//  Created by to4iki on 12/18/14.
//  Copyright (c) 2014 to4iki. All rights reserved.
//

import UIKit

class UIColorUtil {
    
    /**
    color from hex
    
    :param: hex
    :param: alpha
    
    :returns: UIColor
    */
    class func colorWithHexString(hex: String, alpha: CGFloat = 1.0) -> UIColor? {
        let colorScanner = NSScanner(string: hex)
        var color: UInt32 = 0
        
        if !colorScanner.scanHexInt(&color) {
            return nil
        }
        
        let r = CGFloat(((color & 0xFF0000) >> 16)) / 255.0
        let g = CGFloat(((color & 0x00FF00) >> 8 )) / 255.0
        let b = CGFloat((color & 0x0000FF)) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}