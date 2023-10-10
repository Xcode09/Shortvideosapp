//
//  FillintheBlanksQuizView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 03/10/2023.
//

import SwiftUI

struct FillintheBlanksQuizView: View {
    @State private var isButtonTapped = false
    @State private var selectedAnswer: Int?
    
    @State private var selectedColor: Color = .clear
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isTarget = false
    let quizData = [
        ("Quiz 1", "correct", Color(hex: 0xE39DF8)),
        ("Quiz 2", "correct", Color(hex: 0xC3F5FE)),
        ("Quiz 3", "correct", Color(hex: 0x9EF3BE))
    ]
    
    @State var dummyQuestions = ["The sky is","Trees are","The sun is a ","Sea water is", "The snow is"]
    
    @State var dummyAnswers = ["blue","green","cricle","salty", "white"]
    
    @State var userAnswers : [String] = []
    
    @State var userAnswersDic : [String:Any] = [:]
    
    @State var width = CGFloat.zero
    @State var height = CGFloat.zero
    
    var body: some View {
        NavigationView{
            ZStack {
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
                            
                            .frame(width: 110, height: 34)
                            .cornerRadius(12, corners: [.topRight,.topLeft])
                        }
                    }
                    .offset(y:20)
                    
                    VStack {
                        VStack{
                            Spacer().frame(height:viewPadding)
                            
                            Image(systemName:"photo")
                                .resizable()
                                .frame(width:180,height:180)
                                .padding(viewPadding)
                                .customRoundedRectangle(cornerRadiusValue:16,borderWidth:2,backgroundColor: .init(hex: "#E5E3EE"))
                            
                            ScrollView {
                                LazyVGrid(columns:Array(repeating: GridItem(spacing:0), count: 2),spacing:5) {
                                    ForEach(dummyQuestions.indices,id:\.self) {
                                        index in
                                        FillintheBlankView(text: dummyQuestions[index],ansers: $userAnswersDic, isTarget: $isTarget)
                                            .dropDestination(for: String.self) { items, location in
                                                for i in items {
                                                    userAnswersDic[dummyQuestions[index]] = i
                                                    
                                                    dummyAnswers.removeAll(where: {$0 == i})
                                                }
                                                return true
                                            } isTargeted: { done in
                                                isTarget = done
                                            }

                                    }
                                }
                            }
                            .padding(viewPadding)
                            
                            VStack(spacing:-viewPadding){
                                Text("Question related to the quizz text here, upto 300 characters")
                                    .font(.custom("Nunito-Bold", size: 18))
                                    .padding(viewPadding)
                                    .frame(width:UIScreen.main.bounds.width - 20)
                                
                                LazyVGrid(columns:Array(repeating: GridItem(spacing:viewPadding), count: 6)) {
                                    ForEach(dummyAnswers.indices,id:\.self) {
                                        index in
                                        ResizableChipView(text: dummyAnswers[index])
                                            .draggable(dummyAnswers[index])
                                    }
                                }
                                
                                .padding(viewPadding)
                                
                                Spacer()
                                
                            }
                            .frame(width:UIScreen.main.bounds.width * 0.9)
                            .customRoundedRectangle(backgroundColor: .init(hex: "#5539BC"))
                            
                            
                            
                            
                            Spacer().frame(height:20)
                        }
                        .frame(width:UIScreen.main.bounds.width * 0.95,height:UIScreen.main.bounds.height * 0.65)
                        .background(content: {
                            RoundedRectangle(cornerRadius: cornerRadiusValue)
                                .fill(Color.init(hex:  0x9EF3BE))
                        })
                    }
                    .padding(viewPadding)
                    .dropDestination(for: String.self, action: { items, loction in
                        for i in items {
                            for v in userAnswersDic.values{
                                if (v as! String) == i {
                                    let key = getKey(forValue: (v as! String), in: userAnswersDic)
                                    
                                    debugPrint("Key \(key)",v)
                                    
                                    userAnswersDic.removeValue(forKey: key)
                                }
                            }
                            
                            if !dummyAnswers.contains(i) {
                                dummyAnswers.append(i)
                            }
                        }
                        
                        return true
                    })
                    
                }
                .background {
                    Color.init(hex:  0x3B1D68)
                }
                .clipShape(TopRoundedRectangle(cornerRadius: 40, style: .continuous))
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .navigationBarTitleDisplayMode(.inline)
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
            .overlay(alignment:.bottom){
                checkAnserButton
                    .offset(y:-30)
            }
            
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
                .font(.custom("Nunito-Bold", size: 18))
                .foregroundColor(.black))
        }else{
            return AnyView(
                VStack(spacing:-viewPadding){
                Text("Check Answer")
                    .font(.custom("Nunito-Bold", size: 18))
                    .foregroundColor(.black)
                    
                 Text("(Incomplete)")
                        .font(.custom("Nunito-Bold", size: 16))
                        .foregroundColor(.black)
            })
        }
        
    }
    
    func getKey(forValue value: String, in dictionary: [String: Any]) -> String {
        for (key, dictValue) in dictionary where (dictValue as! String) == value {
            return key
        }
        return ""
    }
}

struct FillintheBlankView:View {
    let text:String
    @Binding var ansers:[String:Any]
    @Binding var isTarget : Bool
    var body: some View {
        HStack(spacing:2){
            Text(text)
                .font(.custom("Nunito-ExtraBold", size: 16))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth:.infinity)
                .foregroundColor(.black)
            ZStack{
                if let value = ansers[text] as? String {
                    Text(value)
//                        .padding(viewPadding)
                        .foregroundColor(.black)
                        .font(.custom("Nunito-ExtraBold", size: 14))
                        .frame(maxWidth:.infinity,maxHeight:24)
                        .customRoundedRectangle(cornerRadiusValue: 6, backgroundColor: .init(hex: "#DA86FF"))
                        .draggable(value)
                    
                }else{
                    RoundedRectangle(cornerRadius: 8)
                        
                        .fill(Color.gray.opacity(0.7))
                        .frame(height:24)
                }
                
            }

            
            
            Circle()
                .fill(Color.black)
                .frame(width:3,height: 3)
        }
    }
}

struct ResizableChipView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal,8)
            .padding(.vertical,4)
            .font(.custom("Nunito-ExtraBold", size: 16))
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .foregroundColor(.black)
            .frame(height:34)
            .customRoundedRectangle(cornerRadiusValue: 6,backgroundColor: .init(hex: "#DA86FF"))
        
    }
}


struct FillintheBlanksQuizView_Previews: PreviewProvider {
    static var previews: some View {
        FillintheBlanksQuizView()
    }
}
