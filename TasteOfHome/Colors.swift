//
//  Colors.swift
//  TasteOfHome
//
//  Created by Fan Chen on 6/8/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit

public class Colors {
  static let orange = UIColor(hex: "E56F23")
  static let lightGray = UIColor(hex: "979797")
}

extension UIColor {
  convenience init(hex: String) {
    let scanner = Scanner(string: hex)
    scanner.scanLocation = 0
    
    var rgbValue: UInt64 = 0
    
    scanner.scanHexInt64(&rgbValue)
    
    let r = (rgbValue & 0xff0000) >> 16
    let g = (rgbValue & 0xff00) >> 8
    let b = rgbValue & 0xff
    
    self.init(
      red: CGFloat(r) / 0xff,
      green: CGFloat(g) / 0xff,
      blue: CGFloat(b) / 0xff, alpha: 1
    )
  }
}
