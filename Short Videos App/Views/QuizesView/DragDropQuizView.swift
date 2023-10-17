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
    @State var showFillInBlanks = false
    
    var body: some View {
        ZStack {
            VStack{
                Text("Video Title")
                    .font(.custom("Nunito-Bold", size: 18))
                    .padding(.top,viewPadding)
                    .frame( height: 25)
                    .foregroundColor(.white)
                
                HStack(spacing: 10) {
                    ForEach(quizData.indices, id: \.self) { index in
                        let (quiz, imageName, colors) = quizData[index]
                        Button(action: {
                            selectedColor = colors
                        }) {
                            HStack(spacing: 0) {
                                Text(quiz)
                                    //.offset(x: -15)
                                    .font(.custom("Nunito-Bold", size: 12))
                                    .frame(maxWidth:.infinity,maxHeight: 34)
                                    .foregroundColor(.black)
                                    
                                
                                //                                            .overlay(
                                                                                if selectedColor == colors{
                                Image(imageName)
                                    .resizable()
                                    //.offset(x: -10)
                                    .frame(width:20,height: 20)
                                                                                }
                                
                                Spacer()
                                
                                //                                        )
                            }
                        }
                        .background(colors)
                        
                        .frame(height: 34)
                        .cornerRadius(12, corners: [.topRight,.topLeft])
                    }
                }
                .frame(width:UIScreen.main.bounds.width * 0.85)
                .offset(y:10)
                
                VStack {
                    VStack{
                        Text("Question related to the quizz text here, upto 300 characters")
                            .padding(viewPadding)
                            .font(.custom("Nunito-Bold", size: 16))
                            //.frame(height:100)
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
                        
                        //Spacer()
                        
                        ZStack{
                            Color.black.opacity(0.15)
                            VStack(spacing:10){
                                Text("Drag and Drop the answers to the correct slots")
                                    .font(.custom("Nunito-Bold", size: 13))
                                    .foregroundColor(.black)
                                
                                ScrollView(.horizontal,showsIndicators:false) {
                                    HStack(spacing:viewPadding){
                                        ForEach(dummyAnswers,id:\.self) { index in
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 14,style:.circular)
                                                    .stroke(Color.black,lineWidth:4)
                                                    .background(Color.init(hex: "#E5E3EE"))
                                                    .frame(width:120)
                                                    .cornerRadius(14)
                                                
                                                Text(index)
        //                                            .padding(viewPadding)
                                                    .font(.custom("Nunito-Bold", size: 18))
                                                    .lineLimit(0)
                                                    .minimumScaleFactor(0.5)
                                                    .foregroundColor(.black)
                                                //.frame(width:120,height:120)
                                            }
                                            .draggable(index)
                                        }
                                    }
                                }
                                
                            }
                            .padding(viewPadding)
                        }
                        .padding(.top,viewPadding)
                        .frame(height:180)
                    
                        
                        Spacer().frame(height:20)
                    }
                    //.padding(viewPadding)
//                    .overlay(alignment:.bottom){
//                        checkAnserButton
//                    }
                    .dropDestination(for: String.self) { items, location in
                        for i in items {
                            
                            if group1Answers.contains(where: {$0 == i}) {
                                if let inde = group1Answers.firstIndex(of: i) {
                                    group1Answers.remove(at: inde)
                                }
                                
                            }else if group2Answers.contains(where: {$0 == i}) {
                                if let inde = group2Answers.firstIndex(of: i) {
                                    group2Answers.remove(at: inde)
                                }
                                
                            }
                            
                            if !dummyAnswers.contains(i) {
                                dummyAnswers.append(i)
                            }
                        }
                        
                        return true
                    }
                }
                .padding(viewPadding)
                .frame(width:UIScreen.main.bounds.width * 0.9,height:UIScreen.main.bounds.height * 0.65)
                .background(content: {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.init(hex:  0x9EF3BE))
                })
                
                
            }
            .padding(viewPadding)
            .frame(width:UIScreen.main.bounds.width * 0.95)
            .background {
                Color.init(hex:  0x3B1D68)
            }
            .clipShape(TopRoundedRectangle(cornerRadius: 40, style: .continuous))
            .overlay(alignment:.bottom){
                checkAnserButton
                    .offset(y:-25)
            }
            .fullScreenCover(isPresented: $showFillInBlanks) {
                FillintheBlanksQuizView()
            }
        }
        
        .frame(maxWidth:.infinity,maxHeight:.infinity)
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                headerView
                
            }
            
            ToolbarItem(placement:.navigationBarLeading){
                Button(action: {
                    // Action to perform when button is tapped
                    print("Button tapped")
                    presentationMode.wrappedValue.dismiss()

                }) {
                    ZStack{
                        Circle()
                            .fill(AppColors.customLightGrayColor.opacity(0.5))
                            .frame(width: 40, height: 40)
                        Image("back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
//                        .background(AppColors.customLightGrayColor.opacity(0.5))
                    
                     // Adjust the size as needed
//                            .padding()
//                            .background(AppColors.customLightGrayColor.opacity(0.5))
//                            .clipShape(Circle()) // Clip the button and its background to a circle
                }
            }
        })
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
    
    var checkAnserButton:some View{
        
        
        //#D8D8D8
        Button(action: {
            // Handle button tap action here
            showFillInBlanks.toggle()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 30) // Adjust the corner radius as needed
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 46)
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
        .padding(.bottom, -40)
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
    @State var isShow = false
    var body: some View{
        GeometryReader {
            proxy in
            VStack(spacing:0){
                Text("Value  = 0.5 ")
                    .padding()
                    .font(.custom("Nunito-Bold", size: 20))
                    .foregroundColor(.black)
                    .frame(width:proxy.size.width,height: 60)
                    .lineLimit(0)
                    .minimumScaleFactor(0.5)
                    .customRoundedRectangle(cornerRadiusValue:8,borderWidth:2,backgroundColor: .init(hex: color).opacity(1.0))
                if ansers.count <= 2 {
                    HStack{
                        ForEach(ansers.prefix(2),id:\.self) { index in
                            VStack{
                                Text(index)
                                    .padding()
                                    .font(.custom("Nunito-Bold", size: 11))
                                    .foregroundColor(.black)
                                    .frame(width:64,height:70)
                                    .lineLimit(0)
                                    .minimumScaleFactor(0.5)
                                    .customRoundedRectangle(cornerRadiusValue: 10, borderWidth:2,backgroundColor: .init(hex: "#E5E3EE"))
                                    .draggable(index)
                                
                                Spacer()
                            }
                            
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical,viewPadding)
                    .padding(.horizontal,viewPadding - 6)
                    .frame(height:165)
                    
                    
                }else{
                    LazyVGrid(columns: [GridItem(.flexible(),spacing: 0, alignment: .top),GridItem(.flexible(),spacing: 5,alignment: .top)],alignment:.listRowSeparatorLeading,spacing: viewPadding) {
                        ForEach(ansers.indices,id: \.self) {
                            index in
                            
                            Text(ansers[index])
                                .padding()
                                .font(.custom("Nunito-Bold", size: 11))
                                .foregroundColor(.black)
                                .frame(width:64,height:70)
                                .lineLimit(0)
                                .minimumScaleFactor(0.5)
                                .customRoundedRectangle(cornerRadiusValue: 10, borderWidth:2,backgroundColor: .init(hex: "#E5E3EE"))
                                .draggable(ansers[index])
                            
                            
                            
                        }
                        
                        //Spacer()
                        
                        
                    }
                    .padding(.vertical,viewPadding)
                    .padding(.horizontal,viewPadding - 5)
                    .frame(height:165)
                    .alignmentGuide(.top) { dimensions in
                                    // Align each item to the top-leading side
                                    dimensions[VerticalAlignment.top]
                                }
                }
                
            }
            .customRoundedRectangle(borderWidth:2,backgroundColor: .init(hex: color))
        }
        
    }
    
    
}
