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
    @State var dropAns:String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var isTarget = false
    let quizData = [
        ("Quiz 1", "correct", Color(hex: 0xE39DF8)),
        ("Quiz 2", "correct", Color(hex: 0xC3F5FE)),
        ("Quiz 3", "correct", Color(hex: 0x9EF3BE))
    ]
    
    @State var dummyQuestions = ["The sky is","Trees are","The sun is a","Sea water is", "The snow is The snow is "]
    
    @State var dummyAnswers : [Anse] = [.init(question: "The sky is", answer: "blue"),.init(question: "Trees are", answer: "green"),.init(question: "The electirc are way better than", answer: "cricle"),.init(question: "Sea water is", answer: "salty"),.init(question: "The snow is", answer: "white")]
    //["blue","green","cricle","salty", "white"]
    
    @State var items = [
        ChipItem(name: "Red"),
        ChipItem(name: "Green"),
        ChipItem(name: "Blue"),
        ChipItem(name: "Purple"),
        ChipItem(name: "Orange")
    ]
    
    @State var userAnswers : [Anse] = [.init(question: "The sky is", answer: "blue"),.init(question: "Trees are", answer: "green"),.init(question: "The electirc are way better than", answer: "cricle"),.init(question: "Sea water is", answer: "salty"),.init(question: "The snow is", answer: "white")]
    
    @State var userAnswersDic : [String:Any] = [:]
    
    @State var width = CGFloat.zero
    @State var height = CGFloat.zero
    
    

    @State private var minItemWidth: CGFloat = 100
    
//    let columns = [
//        GridItem(.adaptive(minimum: minItemWidth)),
//        //GridItem(.adaptive(minimum: 150))
//    ]
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    Text("Video Title")
                        .font(.custom("Nunito-Bold", size: 18))
                        .padding(.top,25)
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
                    .offset(y:20)
                    
                    VStack {
                        VStack{
                            Spacer().frame(height:viewPadding)
                            
                            Image(systemName:"photo")
                                .resizable()
                                .frame(width:180,height:180)
                                .padding(viewPadding)
                                .customRoundedRectangle(cornerRadiusValue:16,borderWidth:2,backgroundColor: .init(hex: "#E5E3EE"))
                            
                            
                            ScrollView
                            {
                                FlexibleView(availableWidth: UIScreen.main.bounds.width - 20, data: dummyAnswers, spacing: 10, alignment: .leading) { item in
                                    
                                    FillintheBlankView(ansers: item, dummyAns: $userAnswers)
                                        .frame(height:34)

                                    
                                }
                            }
                            
                            
                            
                            
                            
                            
                    
                            
                            VStack(alignment:.leading, spacing:0){
                                Text("Question related to the quizz text here, upto 300 characters")
                                    .font(.custom("Nunito-Bold", size: 18))
                                    .padding(viewPadding)
                                    //.frame(height:80)

                                
                                FlexibleView(availableWidth: UIScreen.main.bounds.width - 85, data: userAnswers, spacing: 10, alignment: .leading) { item in
                                    ResizableChipView(text: item.answer)
                                        .draggable(item)
                                }
                                .padding(viewPadding)
                                
 
                                
                            }
                            .frame(width:UIScreen.main.bounds.width * 0.9)
                            .customRoundedRectangle(backgroundColor: .init(hex: "#5539BC"))
            
                            Spacer().frame(height:40)
                        }
                        .frame(width:UIScreen.main.bounds.width * 0.95,height:UIScreen.main.bounds.height * 0.65)
                        .customRoundedRectangle(borderWidth: 3, backgroundColor: Color.init(hex:  0x9EF3BE))
//                        .background(content: {
////                            RoundedRectangle(cornerRadius: cornerRadiusValue)
////                                .fill(Color.init(hex:  0x9EF3BE))
//
//                            B
//                        })
                    }
                    .padding(viewPadding)
                    .dropDestination(for: Anse.self, action: { items, loction in
                        for i in items {
//                            if dropAns == i.answer {
//                                dropAns = ""
//                            }
//                            for v in userAnswersDic.values{
//                                if (v as! String) == i.answer {
//                                    let key = getKey(forValue: (v as! String), in: userAnswersDic)
//
//                                    debugPrint("Key \(key)",v)
//
//                                    userAnswersDic.removeValue(forKey: key)
//                                }
//                            }

                            if !userAnswers.contains(where: {$0 == i}) {
                                userAnswers.append(i)
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
                    .offset(y:-40)
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
    
    func calculateMinWidth(for text: String) -> CGFloat {
            let font = UIFont(name: "Nunito-ExtraBold", size: 16) // Adjust font size as needed
           
            let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
            let textSize = (text as NSString).size(withAttributes: attributes)
            return textSize.width + 32 // Adding padding for a better appearance
        }
    
    var checkAnserButton:some View{
        //#D8D8D8
        Button(action: {
            // Handle button tap action here
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
        .padding(.bottom, -25)
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
    var ansers:Anse
    @Binding var dummyAns:[Anse]
    @State var isHS = false
    @State var dropAns:String = ""
    var body: some View {
        HStack(spacing:5){
            Text(ansers.question)
//                .padding(.horizontal,8)
//                .padding(.vertical,4)
                .font(.custom("Nunito-ExtraBold", size: 16))
                .lineLimit(1)
                //.minimumScaleFactor(0.5)
                //.frame(maxWidth:.infinity,alignment:.leading)
                .foregroundColor(.black)
            if isHS {
                Text(dropAns)
                    .padding(.horizontal,8)
                    .padding(.vertical,4)
                    .font(.custom("Nunito-ExtraBold", size: 16))
                    .foregroundColor(Color.black)
                    .customRoundedRectangle(cornerRadiusValue: 6,backgroundColor: .init(hex: "#DA86FF"))
                    .draggable(Anse(id:ansers.id,question: ansers.question, answer: dropAns))
                
            }else{
             
                Text(ansers.answer)
                    .padding(.horizontal,8)
                    .padding(.vertical,4)
                    .font(.custom("Nunito-ExtraBold", size: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadiusValue)
                            .fill(.ultraThinMaterial)
                    }
            }
                

            Circle()
                .fill(Color.black)
                .frame(width:3,height: 3)
        }
        .onChange(of: dummyAns, perform: { newValue in
            for i in newValue {
                if ansers.id == i.id {
                    isHS = false
                }
            }
        })
        .dropDestination(for: Anse.self) { itemm, location in
            for i in itemm {
                dropAns = i.answer
                if dummyAns.contains(where: {$0 == i}) {
                    dummyAns.removeAll(where: {$0.id == i.id})
                }
            }
            isHS.toggle()
            
            return true
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
//            .lineLimit(1)
//            .minimumScaleFactor(0.5)
            .foregroundColor(.black)
            .frame(height:34)
            .customRoundedRectangle(cornerRadiusValue: 6,backgroundColor: .init(hex: "#DA86FF"))
            .overlay {
                GeometryReader { reader -> Color in
                    
                    let maxX = reader.frame(in: .global).maxX
                    
                    if maxX > 30 {
                        
                    }
                    
                    return Color.clear
                }

            }
        
    }
    
    func calculateMinWidth(for text: String) -> CGFloat {
            let font = UIFont(name: "Nunito-ExtraBold", size: 16) // Adjust font size as needed
           
            let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
            let textSize = (text as NSString).size(withAttributes: attributes)
            return textSize.width + 50 // Adding padding for a better appearance
        }
}


struct FillintheBlanksQuizView_Previews: PreviewProvider {
    static var previews: some View {
        FillintheBlanksQuizView()
    }
}

struct ChipData:Identifiable,Hashable {
    var id = UUID().uuidString
    let chipText:String
    var isExceeded = false
}
