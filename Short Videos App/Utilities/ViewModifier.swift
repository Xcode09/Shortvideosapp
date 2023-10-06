//
//  ViewModifier.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 14/09/2023.
//

import Foundation
import SwiftUI

struct CustomRoundedRectangleModifier: ViewModifier {
    let cornerRadiusValue: CGFloat
    let borderWidth: CGFloat
    let backgroundColor: Color
    let borderColor: Color

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadiusValue,style: .continuous)
                    .stroke(borderColor, lineWidth: borderWidth)
                    .background(
                        RoundedRectangle(cornerRadius: cornerRadiusValue,style: .continuous)
                            .fill(backgroundColor)
                    )
            )
    }
}

struct TransparentBlurView:ViewModifier {
    var color: Color = Color.gray
    var isOpacity : CGFloat = 0.7
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadiusValue,style: .continuous)
                    .fill(color.opacity(isOpacity))
                    .blur(radius:1)
            }
    }
}
