//
//  DragDropQuizView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 30/09/2023.
//

import SwiftUI

struct DragDropQuizView: View {
    @State private var isButtonTapped = false
    @State private var selectedAnswer: Int?
    
    @State private var selectedColor: Color = .clear
    
    @Environment(\.presentationMode) var presentationMode
    
    let quizData = [
        ("Quiz 1", "correct", Color(hex: 0xE39DF8)),
        ("Quiz 2", "correct", Color(hex: 0xC3F5FE)),
        ("Quiz 3", "correct", Color(hex: 0x9EF3BE))
    ]
    
    @State var dummyAnswers = ["Value = 0.5","2/2", "Value = 1","Value = 2","4/5","Audio", "Latex","Image"]
    @State var group1Answers : [String] = []
    @State var group2Answers : [String] = []
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Video Title")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top,viewPadding)
                    .frame( height: 25)
                    .foregroundColor(.white)
                
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
                                    .frame(width: 110, height: 34)
                                    .background(colors)
                                    .foregroundColor(.black)
                                    .cornerRadius(12, corners: [.topRight,.topLeft])
                                
                                //                                            .overlay(
                                                                                if selectedColor == colors{
                                Image(imageName)
                                    .resizable()
                                    .offset(x: -10)
                                    .frame(width: 20, height: 20)
                                                                                }
                                
                                //                                        )
                            }
                        }
                    }
                }
                .offset(y:20)
                
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: cornerRadiusValue)
                            .fill(Color.init(hex:  0x9EF3BE))
                        
                        VStack{
                            Text("Question related to the quizz text here, upto 300 characters")
                                .padding(viewPadding)
                                .frame(width:UIScreen.main.bounds.width - 20 ,height:100)
                                .customRoundedRectangle(backgroundColor: .init(hex: 0x3B1D68))
                            
                            //Spacer()
                            
                            HStack{
                                KenbeView(ansers: group1Answers, color: "#F3E0FD")
                                    .dropDestination(for: String.self) { dropObject, location in
                                        if group1Answers.count == 4 {
                                            return false
                                        }else{
                                            for drop in dropObject {
                                                if group1Answers.contains(drop) {
                                                    return false
                                                }else{
                                                    group1Answers += dropObject
                                                    
                                                    dummyAnswers.removeAll(where: {$0 == drop})
                                                    return true
                                                }
                                                
                                            }
                                            
                                            
                                            return true
                                        }
                                        
                                    }

                                KenbeView(ansers: group2Answers,color:"#DAE6FA")
                                    .dropDestination(for: String.self) { dropObject, location in
                                        if group2Answers.count == 4 {
                                            return false
                                        }else{
                                            for drop in dropObject {
                                                if group2Answers.contains(drop) {
                                                    return false
                                                }else{
                                                    group2Answers += dropObject
                                                    
                                                    dummyAnswers.removeAll(where: {$0 == drop})
                                                    return true
                                                }
                                                
                                            }
                                            
                                            
                                            return true
                                        }
                                        
                                    }
                            }
                            
                            Spacer()
                            
                            ScrollView(.horizontal) {
                                HStack(spacing:viewPadding){
                                    ForEach(dummyAnswers,id:\.self) { index in
                                        Text(index)
                                            .padding()
                                            .frame(width:120,height:120)
                                            .font(.custom("Nunito-Bold", size: 20))
                                            .foregroundColor(.black)
                                            .customRoundedRectangle(cornerRadiusValue: 10, borderWidth:3,backgroundColor: .init(hex: "#E5E3EE"))
                                            .draggable(index)
                                    }
                                }
                            }
                            .dropDestination(for: String.self) { items, location in
                                
                                dummyAnswers += items
                                return true
                            }

                            
                            Spacer().frame(height:20)
                        }
                        .padding(viewPadding)
                    }
                    .frame(height:UIScreen.main.bounds.height * 0.7)
                    .padding(viewPadding)
                    .overlay(alignment:.bottom){
                        checkAnserButton
                    }
                }
                
                
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .background {
                Color.init(hex:  0x3B1D68)
            }
        }
    }
    
    var checkAnserButton:some View{
        //#D8D8D8
        Button(action: {
            // Handle button tap action here
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 30) // Adjust the corner radius as needed
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .foregroundColor(dummyAnswers.isEmpty ? Color(hex: 0x2BE2B3) : Color.init(hex: "#D8D8D8"))
                    .overlay(
                        getCheckAnswerButtonText()
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 30) // Adjust the corner radius as needed
                            .stroke(Color.black, lineWidth: 2) // Border color and width
                    )
            }
            //.padding(.top, 10)
        }
        .disabled(dummyAnswers.isEmpty ? false : true)
        .padding(.bottom, -20)
    }
    
    func getCheckAnswerButtonText()-> some View {
        if dummyAnswers.isEmpty {
            return AnyView(Text("Check Answer")
                .font(.custom("Nunito-Bold", size: 22))
                .foregroundColor(.black))
        }else{
            return AnyView(
                VStack(spacing:-viewPadding){
                Text("Check Answer")
                    .font(.custom("Nunito-Bold", size: 22))
                    .foregroundColor(.black)
                    
                 Text("(Incomplete)")
                        .font(.custom("Nunito-Bold", size: 18))
                        .foregroundColor(.black)
            })
        }
        
    }
}

struct DragDropQuizView_Previews: PreviewProvider {
    static var previews: some View {
        DragDropQuizView()
    }
}

struct KenbeView:View{
    let ansers:[String]
    let color:String
    var body: some View{
        GeometryReader {
            proxy in
            VStack(spacing:0){
                Text("Value  = 0.5 ")
                    .padding()
                    .font(.custom("Nunito-Bold", size: 20))
                    .foregroundColor(.black)
                    .frame(width:proxy.size.width,height: 60)
                    .customRoundedRectangle(borderWidth:3,backgroundColor: .init(hex: color).opacity(1.0))
                LazyVGrid(columns: [GridItem(.flexible(),spacing: 0),GridItem(.flexible(),spacing: 5)]) {
                    ForEach(ansers.indices,id: \.self) {
                        index in
                        Text(ansers[index])
                            .padding()
                            .font(.custom("Nunito-Bold", size: 14))
                            .foregroundColor(.black)
                            .frame(width:74,height:74)
                            .customRoundedRectangle(cornerRadiusValue: 10, borderWidth:3,backgroundColor: .init(hex: "#E5E3EE"))
                            .draggable(ansers[index])
                    }
                    
                    
                }
                .padding(.horizontal,5)
                .frame(height:180)
            }
            .customRoundedRectangle(backgroundColor: .init(hex: color))
        }
        
    }
    
    
}
