//
//  QuizeView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 14/09/2023.
//

import Foundation

import SwiftUI


struct QuizeView: View {
    @State private var isButtonTapped = false
    @State private var selectedAnswer: Int?
    
    @State private var selectedColor: Color = .clear
    
    let quizData = [
        ("Quiz 1", "correct", Color(hex: 0xE39DF8)),
        ("Quiz 2", "correct", Color(hex: 0xC3F5FE)),
        ("Quiz 3", "correct", Color(hex: 0x9EF3BE))
    ]
    var body: some View {
        NavigationView{
            ScrollView {
                ZStack {
                    
                    Color.black.ignoresSafeArea()
                    
                    Color(hex: 0x3B1D68)
                        .clipShape(TopRoundedRectangle(cornerRadius: 40, style: .continuous)) // Add top corner radius
                        .frame(height: 900) // Set the height of the top view
                        .offset(y: 60)
                    //                .ignoresSafeArea()
                        .overlay(
                            // VStack with Text and HStack of Three Buttons
                            VStack {
                                Text("Video Title")
                                    .font(.system(size: 22, weight: .bold))
                                    .frame( height: 25)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 10)
                                
                                
                                HStack(spacing: 5) {
                                    ForEach(quizData.indices, id: \.self) { index in
                                        let (quiz, imageName, colors) = quizData[index]
                                        Button(action: {
                                            selectedColor = colors
                                        }) {
                                            HStack(spacing: -13) {
                                                Text(quiz)
                                                    .offset(x: -15)
                                                    .font(.custom("Nunito-Bold", size: 12))
                                                    .frame(width: 110, height: 50)
                                                    .background(colors)
                                                    .foregroundColor(.black)
                                                    .cornerRadius(18, corners: [.topRight,.topLeft])
                                                
                                                //                                            .overlay(
                                                                                                if selectedColor == colors{
                                                Image(imageName)
                                                    .resizable()
                                                    .offset(x: -16)
                                                    .frame(width: 20, height: 20)
                                                                                                }
                                                
                                                //                                        )
                                            }
                                        }
                                    }
                                }
                                //                        .offset(y: )
                            }
                                .offset(y: -300) // Adjust the offset as needed
                        )
                    
                    // Subview with Blue Color
                    Color.clear
                        .padding()
                        .frame(width:UIScreen.main.bounds.width * 0.95,height: 630)
                        .customRoundedRectangle(cornerRadiusValue: 20,borderWidth:2,backgroundColor: selectedColor == .clear ? Color(hex: 0x9EF3BE) : selectedColor,borderColor: selectedColor == .clear ? Color.black : selectedColor)
                        
                        .offset(y: 55)
                        
                        
                    
                    
                    // Pink View inside Subview
                    Color(hex: 0x5E1BB2)
                        .padding()
                        .frame(width:UIScreen.main.bounds.width * 0.85,height: 260)
                        .customRoundedRectangle(cornerRadiusValue: 20,borderWidth:2,backgroundColor: Color(hex: 0x5E1BB2))
                        .offset(y: -110)
                        .overlay(//addee
                            // VStack with Text and Image
                            VStack(spacing: 20) {
                                Text("Question related to the quizz text here, upto 300 characters")
                                    .font(.custom("Nunito-Bold", size: 18))
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .lineLimit(5)
                                    .multilineTextAlignment(.leading)
                                
                                
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .foregroundColor(.white)
                                
                            }// Set the stack's height
                            .offset(y: -120) // Adjust the offset as needed
                            
                        )
                    //addded
                    
                    
                    
                    // Horizontal Views with Two Text Elements
                    VStack(spacing: 10) {
                        ForEach(0..<4) { index in

                            
                            HStack(spacing: 10) { // Add an HStack for two text elements
                                CircleWithText(text: String(index + 1), yOffset: 0, changeColor: selectedAnswer == index ? Color(hex: 0x89C9FD) : Color(hex: 0xD98AFC))
                                    
                                
                                Text("Answer \(index+1) text here upto 200 char")
                                    .foregroundColor(selectedAnswer == index ? Color.black : Color.white)
                                    .font(.custom("Nunito-Bold", size: 12))
                                    .lineLimit(3)
                                    .frame(maxWidth:.infinity,alignment:.leading)
                                    .multilineTextAlignment(.leading)
                                    
                                
                                
                                
                            }
                            .padding(.horizontal)
                            .frame(maxWidth:335,maxHeight: 60)
                            .customRoundedRectangle(backgroundColor: Color.init(hex: selectedAnswer == index ?  "#9E9EFD" : "#5F08B5"))
                            .onTapGesture {
                                selectedAnswer = index
                            }
                            
                        }
                        
                        // Button with padding, offset, and centered text
                        Button(action: {
                            // Handle button tap action here
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30) // Adjust the corner radius as needed
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(Color(hex: 0x2BE2B3))
                                    .overlay(
                                        Text("Check Answer")
                                            .font(.system(size: 27, weight: .medium))
                                            .foregroundColor(.black)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30) // Adjust the corner radius as needed
                                            .stroke(Color.black, lineWidth: 2) // Border color and width
                                    )
                            }
                            .padding(.top, 10)
                        }
                        .padding(.bottom, -25) // Offset from the bottom
                    }
                    .offset(y: 210)
                }
            }
            .background(content: {
                Color.black.ignoresSafeArea()
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    headerView
                    
                }
            })
        }
    }
    
    var headerView:some View {
        HStack(spacing:10){
            
            Spacer().frame(width:viewPadding)
            
            Text("1250 Pts")
                .foregroundColor(Color.init(hex: MyColors.pointsColor))
                .padding(viewPadding)
                .frame(width: 134,height: 36)
                .font(.custom("Nunito-Bold", size: 22))
                //.minimumScaleFactor(0.7)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.init(hex: MyColors.pontsRectangleColor))
                }
            
            VStack(spacing:-5){
                Text("50")
                    .foregroundColor(Color.init(hex: "#78F0B9"))
                    .font(.custom("Nunito-Bold", size: 13))
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    
                VStack(spacing:-3){
                    Text("Daily")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
    //                    .lineLimit(2)
    //                    .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    Text("Bouns")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
    //                    .lineLimit(2)
    //                    .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                }
                
                    
            }
            .frame(width:45,height: 36)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.init(hex: "#0099A0"))
            }
            
            
            VStack(spacing:-5){
                Text("100")
                    .foregroundColor(Color.init(hex: "#78F0B9"))
                    .font(.custom("Nunito-Bold", size: 13))
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    
                
                VStack(spacing:-3){
                    Text("Watch")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    Text("3 videos")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                }
                    
            }
            .frame(width:45,height: 36)
            .background {
                RoundedRectangle(cornerRadius:8)
                    .fill(Color.init(hex: "#6A6070"))
            }
            
            VStack(spacing:-5){
                Text("150")
                    .foregroundColor(Color.init(hex: "#78F0B9"))
                    .font(.custom("Nunito-Bold", size: 13))
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    
                VStack(spacing:-3){
                    Text("Complete")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    Text("5 Quizes")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                }
                    
            }
            .frame(width:45,height: 36)
            .background {
                RoundedRectangle(cornerRadius:8)
                    .fill(Color.init(hex: "#6A6070"))
            }
            
            Spacer()
            
//            Button {
//                //
//            } label: {
//                Image("search")
//                    .resizable()
//                    .renderingMode(.template)
//                    .foregroundColor(.white)
//                    
//                    .frame(width:20,height:20)
//                    .scaledToFit()
//                    .background {
//                        Circle()
//                            .fill(.ultraThinMaterial)
//                            .frame(width:36,height:36)
//                            
//                    }
//                
//            }
//            //.padding(viewPadding)
//            Spacer()
            
        }
        .padding(.all,5)
       
    }
}

struct CircleWithText: View {
    var text: String
    var yOffset: CGFloat
    var changeColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(changeColor)
                .frame(width: 40, height: 40)
                .offset(x: 0, y: yOffset)
            
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 22, weight: .medium))
                .offset(x: 0, y: yOffset)
                .font(.headline)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizeView()
    }
}
struct TopRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the rounded rectangle path with top corners rounded
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
