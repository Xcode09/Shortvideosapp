//
//  Extensions.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 25/08/2023.
//

import Foundation
import UIKit
import SwiftUI
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
    
     static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
    
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}


extension View {
    
    func tabItemsFont() -> some View {
        self.font(AppTheme.tabItemsFont)
    }
    func regularFont() -> some View {
        self.font(AppTheme.primaryFont)
    }
    func mediumFont() -> some View {
        self.font(AppTheme.secondaryFont)
    }
    func semiBoldFont() -> some View {
        self.font(AppTheme.semiFont)
    }
    
    func boldFont(isExtra:Bool = false) -> some View {
        isExtra ? self.font(AppTheme.extraBoldFont) : self.font(AppTheme.boldFont)
    }
    
    func customRoundedRectangle(
        cornerRadiusValue: CGFloat = cornerRadiusValue,
        borderWidth: CGFloat = borderWidth,
        backgroundColor: Color,
        borderColor: Color = Color.black
    ) -> some View {
        modifier(
            CustomRoundedRectangleModifier(
                cornerRadiusValue: cornerRadiusValue,
                borderWidth: borderWidth,
                backgroundColor: backgroundColor,
                borderColor: borderColor
            )
        )
    }
    
    
    func applyBlur(color:Color=Color.gray,isOpacity:CGFloat=0.7) -> some View {
        modifier(TransparentBlurView(color: color,isOpacity: isOpacity))
    }
}
