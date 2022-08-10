//
//  UIColor+Ext.swift
//  Movies
//
//  Created by Yernar Masujima on 8/10/22.
//

import UIKit

extension UIColor {
    static let navigationColor = UIColor(rgb: 0xE8E0D6)
    static let backgroundColor = UIColor(rgb: 0xF6EEE4)
    static let titleColor = UIColor(rgb: 0xe1755C)
    static let textColor = UIColor(rgb: 0x384458)
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
