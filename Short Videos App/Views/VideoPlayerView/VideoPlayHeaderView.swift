//
//  VideoPlayHeaderView.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI

struct VideoPlayHeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    // Action to perform when button is tapped
                    print("Button tapped")
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Image("back")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20) // Adjust the size as needed
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .clipShape(Circle()) // Clip the button and its background to a circle
                }
                HeaderEmojiView()
                
                Button(action: {
                    // Action to perform when button is tapped
                    print("Button tapped")
                }) {
                    Image("search")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                    
                        .frame(width: 20, height: 20) // Adjust the size as needed
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .clipShape(Circle()) // Clip the button and its background to a circle
                }
            }

        }
        .frame(maxWidth: .infinity)
        .background(alignment:.bottom){
            Rectangle()
                .fill(.ultraThinMaterial)
                //.frame(height:10)
                .offset(y:5)
                .environment(\.colorScheme, .light)
        }
    }}

struct VideoPlayHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayHeaderView()
    }
}


// MARK: - EMOJI's HEADER VIEW

struct HeaderEmojiView: View {
    var titles = ["2.2k", "700", "800", "400", "300", "900"]
    var emojis = ["heartEmoji","emoji2","emoji3","emoji4","emoji5","emoji6"]
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                ForEach(0...5, id: \.self) { index in
                    VStack(spacing: 0) {
                        Button(action: {
                            // Action to perform when button is tapped
                            print("Button \(index) tapped")
                            self.emojididTap(index: index)
                        }) {
                            Text("\(titles[index])")
                                .font(.system(size: 8))
                                .padding(8)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(.infinity)
                        }
                        Image("\(emojis[index])") // Replace with your image
                            .padding(.top, -12) // Adjust this value to control the overlap
                    }
                }
            }
            .padding()
        }
    }
    
    func emojididTap(index: Int) {
        print("Emoji Did Tapped")
    }
}
