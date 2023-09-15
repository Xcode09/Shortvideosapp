//
//  ExampleBlurView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 14/09/2023.
//

import Foundation
import SwiftUI


struct ExampleBlurView: View {
    @State private var isScrollingUp = true

    var body: some View {
        ScrollView {
            ZStack{
                Color.red
                    .background(alignment:.top,content: {
                        if !isScrollingUp {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .frame(height: 100)
                                .ignoresSafeArea()
                        }
                    })
                VStack(spacing: 20) {
                    ForEach(0..<20) { index in
                        Text("Item \(index)")
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            // Add logic to handle the scroll direction
                            onScrollContent(geometry)
                        }
                        .onChange(of: geometry.frame(in: .global).minY) { _ in
                            // Add logic to handle the scroll direction
                            onScrollContent(geometry)
                        }
                    }
                )
            }
           
        }
    }

    private func onScrollContent(_ geometry: GeometryProxy) {
        if geometry.frame(in: .global).minY > 0 {
            // Scrolling up
            debugPrint("Scroll Up")
            isScrollingUp = true
        } else {
            // Scrolling down or at the top
            debugPrint("Scroll Down")
            isScrollingUp = false
        }
    }
}

struct ExampleBlurView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleBlurView()
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
