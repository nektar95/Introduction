//
//  LifestyleModel.swift
//  Introduction
//
//  Created by Aleksander on 5/13/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import Foundation
import UIKit

func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 3
    let numberOfItemsPerRow = 8
    
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}
