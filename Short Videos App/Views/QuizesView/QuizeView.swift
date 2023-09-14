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
    let quizData = [
        ("Quiz 1", "correct", Color(red: 227/255, green: 157/255, blue: 248/255)),
        ("Quiz 2", "correct", Color(red: 195/255, green: 245/255, blue: 254/255)),
        ("Quiz 3", "correct", Color(red: 158/255, green: 243/255, blue: 190/255))
    ]
    var body: some View {
        ZStack {
            // Top View with Purple Color
            
            Color(red: 59/255, green: 29/255, blue: 104/255)
                .clipShape(TopRoundedRectangle(cornerRadius: 40, style: .continuous)) // Add top corner radius
                .frame(height: 900) // Set the height of the top view
                .offset(y: 80)
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
                                    // Handle the button action for each quiz
                                }) {
                                    HStack(spacing: -13) {
                                        Text(quiz)
                                            .offset(x: -15)
                                            .font(.system(size: 13, weight: .bold))
                                            .frame(width: 100, height: 50)
                                            .background(colors)
                                            .foregroundColor(.black)
                                            .cornerRadius(10)
                                        
                                        //                                            .overlay(
                                                                                        if index == 0{
                                        Image(imageName)
                                            .resizable()
                                            .offset(x: -12)
                                            .frame(width: 20, height: 20)
                                                                                        }
                                        
                                        //                                        )
                                    }
                                }
                            }
                        }
                        //                        .offset(y: )
                    }
                        .offset(y: -287) // Adjust the offset as needed
                )
            
            // Subview with Blue Color
            Color(red: 158/255, green: 243/255, blue: 190/255)
                .frame(height: 612) // Set the height of the subview
                .cornerRadius(20)
            //                .border(.black, width: 2)
                .cornerRadius(20)
                .offset(y: 55) // Move it down by 30 points
            //                .padding(.bottom, 80)
                .padding(.horizontal, 10)
            
            
            // Pink View inside Subview
            Color(red: 94/255, green: 27/255, blue: 178/255)
                .frame(height: 240) // Set the height of the pink view
                .cornerRadius(20)
                .border(.black, width: 2)
                .cornerRadius(20)
                .offset(y: -110)
                .padding(.horizontal, 20)
                .overlay(//addee
                    // VStack with Text and Image
                    VStack(spacing: 20) {
                        Text("Question related to the quizz text here, upto 300 characters")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal, 30)
                        
                        
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.white)
                    }
                        .frame(height: 100) // Set the stack's height
                        .offset(y: -110) // Adjust the offset as needed
                    
                )//addded
            
            // Horizontal Views with Two Text Elements
            VStack(spacing: 10) {
                ForEach(0..<4) { index in
                    ZStack {
                        //                        Color(red: 94/255, green: 27/255, blue: 178/255)
                        
                        Color(red: selectedAnswer == index ? 158/255 : 94/255,
                              green: selectedAnswer == index ? 160/255 : 27/255,
                              blue: selectedAnswer == index ? 250/255 : 178/255)
                        .cornerRadius(10)
                        .frame(height: 60)
                        //                                       .border(.black, width: 2)
                        .padding(.horizontal, 25)
                        .onTapGesture {
                            selectedAnswer = index // Set the selected answer
                        }
                        
                        .overlay(
                            HStack(spacing: 10) { // Add an HStack for two text elements
                                CircleWithText(text: String(index + 1), yOffset: 0, changeColor: selectedAnswer == index ? Color(red: 137/255, green: 201/255, blue: 253/255) : Color(red: 217/255, green: 138/255, blue: 252/255))
                                Text("Answer \(index+1) text here upto 200 char")
                                    .foregroundColor(selectedAnswer == index ? Color.black : Color.white)
                                    .font(.custom("Nunito-Bold", size: 12))
                                
                            }
                            //Color(red: 217/255, green: 138/255, blue: 252/255)
                            
                            
                        )
                    }
                }
                
                // Button with padding, offset, and centered text
                Button(action: {
                    // Handle button tap action here
                }) {
                    Text("Check Answer")
                        .font(.custom("Nunito-Bold", size: 20))
                        .frame(width: 300, height: 60)
                        .background(Color(red: 43/255, green: 226/255, blue: 179/255))
                        .foregroundColor(.black)
                    //                                          .border(.black, width: 2)
                        .cornerRadius(30)
                        .padding(.top, 10)
                }
                //                                  .padding(.bottom, -75) // Offset from the bottom
            }
            .offset(y: 210)
        }
    }
}

struct CircleWithText: View {
    var text: String
    var yOffset: CGFloat
    var changeColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black,lineWidth:borderWidth)
                .background(content: {
                    Circle()
                        .fill(changeColor)
                })
                .frame(width: 40, height: 40)
                .offset(x: 0, y: yOffset)
            
            Text(text)
                .foregroundColor(.black)
                .font(.custom("Nunito-SemiBold", size: 24))
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
