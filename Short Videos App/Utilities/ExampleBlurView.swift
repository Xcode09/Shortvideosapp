//
//  ExampleBlurView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 14/09/2023.
//

import Foundation
import SwiftUI
struct ExampleBlurView: View {
    @State private var scrollOffset: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack{
                    
                    Color.red
                        .frame(height:UIScreen.main.bounds.height)
                }
                
            }
            .background(
                Color.clear // This is to make sure GeometryReader covers the entire view
            )
            .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                self.scrollOffset = offset
            }
            .blur(radius: blurRadiusForOffset(scrollOffset, maxOffset: geometry.size.height * 0.2))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    
    func blurRadiusForOffset(_ offset: CGFloat, maxOffset: CGFloat) -> CGFloat {
        let maxBlurRadius: CGFloat = 20.0
        let maxScroll: CGFloat = maxOffset * 0.2 // Adjust as needed
        
        let normalizedOffset = min(max(offset, 0), maxScroll)
        let progress = normalizedOffset / maxScroll
        
        return progress * maxBlurRadius
    }

}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0.0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct ExampleBlurView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleBlurView()
    }
}
