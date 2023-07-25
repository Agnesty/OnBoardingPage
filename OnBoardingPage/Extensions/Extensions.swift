//
//  Extensions.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 25/07/23.
//

import Foundation
import UIKit

//Mengatur Color menggunakan hex
extension UIColor {
convenience init?(hex: String) {
    var formattedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    formattedHex = formattedHex.replacingOccurrences(of: "#", with: "")
    var rgbValue: UInt64 = 0
    Scanner(string: formattedHex).scanHexInt64(&rgbValue)
    
    let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
    
    self.init(red: red, green: green, blue: blue, alpha: 1.0)
}
}
