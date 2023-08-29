//
//  LikeFollowButtonsView.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI

struct LikeFollowButtonsView: View {
    @State private var isGridViewVisible = false // This variable controls visibility

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    if isGridViewVisible {
                        SquareButtonsGridView()
                            .background(AppColors.customLightGrayColor.opacity(0.5))
                            .cornerRadius(10, corners: .allCorners)
                    }
                }
                VStack {
                    Spacer()
  

                    VStack(spacing: 5) {
                        CustomButton(imageName: "ProfileImage", buttonText: "1250", action: didTapButton)
                            .frame(height: 80) // Adjust the height for the first button
                            .padding(8)                        .background(AppColors.customLightGrayColor.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)


                        CustomButton(imageName: "quizfill", buttonText: "3/3", action: didTapButton)
                            .frame(height: 40) // Adjust the height for the first button
                            .padding(8)                        .background(AppColors.customLightGrayColor.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)

                        CustomButton(imageName: "likeHeart", buttonText: "24.6K", action: didTapButton)
                            .frame(height: 40) // Adjust the height for the first button
                            .padding(8)                        .background(AppColors.customLightGrayColor.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)

                        CustomButton(imageName: "share", buttonText: "7.9K", action: didTapButton)
                            .frame(height: 40) // Adjust the height for the first button
                            .padding(8)                        .background(AppColors.customLightGrayColor.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)

                        CustomButton(imageName: "saved", buttonText: "5.2K", action: didTapButton)
                            .frame(height: 40) // Adjust the height for the first button
                            .padding(8)                        .background(AppColors.customLightGrayColor.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)

                        CustomButton(imageName: "groupEmoji", buttonText: "", action: didTapSelectEmoji)
                            .frame(height: 40) // Adjust the height for the first button
                            .padding(8)
                            .background(AppColors.customLightGrayColor.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                                
                        }
                    .padding()
                    
                }
            }
        }
    }
    
    func didTapSelectEmoji() {
        print("didTapSelectEmoji")
        isGridViewVisible = !isGridViewVisible
    }
    
    func didTapButton() {
        print("didTapSelectEmoji")
    }
}

struct LikeFollowButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        LikeFollowButtonsView()
    }
}

struct CustomButton: View {
    let imageName: String
    let buttonText: String
    let action: () -> Void // Closure to handle button tap

    var body: some View {
        Button(action: {
            // Action to perform when button is tapped
            print("Button tapped: \(buttonText)")
            action()
        }) {
            VStack {
                Image(imageName)
                    .foregroundColor(.blue)
                Text(buttonText)
                    .font(.system(size: 8))
            }
        }
        .frame(width: 40,height: 40)
    }
    
}


struct SquareButtonsGridView: View {
    let numRows = 5
    let numColumns = 5
    
    var images = ["heartEmoji","emoji2","emoji3","emoji4","emoji5","emoji6","heartEmoji","emoji2","emoji3","emoji4","emoji5","emoji6","heartEmoji","emoji2","emoji3","emoji4","emoji5","emoji6","heartEmoji","emoji2","emoji3","emoji4","emoji5","emoji6","heartEmoji","emoji2","emoji3","emoji4","emoji5","emoji6","heartEmoji","emoji2","emoji3","emoji4","emoji5","emoji6"]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<numRows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<numColumns, id: \.self) { column in
                        let index = row * numColumns + column
                        if index < images.count {
                            Button(action: {
                                // Button action
                            }) {
                                Image(images[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(10)
                            }
                        } else {
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding()
    }
}
