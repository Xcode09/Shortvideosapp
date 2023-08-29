//
//  CustomAppColors.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI

import Foundation
import SwiftUI

class AppColors {
    
    static let customLightGrayColor = Color(UIColor(named: "CustomLightGrayColor")!)
    static let customTextGrayColor = Color(UIColor(named: "CustomTextGrayColor")!)
    
}

// MARK: - Corner Radius Property

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
