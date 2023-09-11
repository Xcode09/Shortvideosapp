//
//  LikeFollowButtonsView.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI

struct LikeFollowButtonsView: View {
    @State private var isGridViewVisible = false // This variable controls visibility
    @State private var showSave = false
    @State private var showReportVideo = false
    @State private var reportContent = false
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


                        CustomButton(imageName: "quizfill", buttonText: "3/3", action: {
                            showReportVideo.toggle()
                        })
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
            .sheet(isPresented: $showSave) {
                ShowMyCollectionsView()
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $showReportVideo) {
                ReportVideoContentView(reportContent: $reportContent)
                    .presentationDetents([.fraction(reportContent ? 1 : 0.3)])
            }
        }
    }
    
    func didTapSelectEmoji() {
        print("didTapSelectEmoji")
        isGridViewVisible = !isGridViewVisible
    }
    
    func didTapButton() {
        print("didTapSelectEmoji")
        showSave.toggle()
    }
}

struct ReportVideoContentView:View {
    @Binding var reportContent:Bool
    @State private var reportDetail = ""
    var body: some View{
        VStack{
            Text("Video Title")
                .boldFont()
                .foregroundColor(.white)
                .padding()
            if reportContent {
                reasonsSignalingView
            }
            Button {
                //isCreateNewTapped.toggle()
                reportContent.toggle()
            } label: {
                Text("Report inappropriate content.")
                    .foregroundColor(.black)
                    .boldFont()
                    .padding()
            }
            .frame(width:UIScreen.main.bounds.width - 40)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#E74755"))
            }
            if !reportContent {
                Button {
                    //isCreateNewTapped.toggle()
                } label: {
                    Text("Block user")
                        .foregroundColor(.black)
                        .boldFont()
                        .padding()
                }
                .frame(width:UIScreen.main.bounds.width - 40)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#D68628"))
                }
            }
           
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: "#1F083E"))
                .ignoresSafeArea()
        }
    }
    
    var reasonsSignalingView:some View {
        VStack(alignment:.leading,spacing: 5){
            Text("Reasons for signaling")
                .boldFont()
                .foregroundColor(.white)
                .padding()
            
            SignalingRowView(title: "Off-topic content")
            
            SignalingRowView(title: "Spam or misleading")
            
            SignalingRowView(title: "Sexual content")
            
            SignalingRowView(title: "Violence")
            SignalingRowView(title: "Insulting or hateful content")
            
            Text("Details")
                .boldFont()
                .foregroundColor(.white)
            
            TextField("", text: $reportDetail)
                .frame(width:UIScreen.main.bounds.width,height: 147)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                }
        }
    }
    
}

struct SignalingRowView:View {
    var title:String
    var body: some View {
        HStack(spacing:0){
            Button {
                //
            } label: {
                Rectangle()
                    .frame(width:30,height: 30)
                    .foregroundColor(.white)
            }
            .frame(width:30,height: 30)

            Text(title)
                .boldFont()
                .foregroundColor(.white)
                .padding()
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct LikeFollowButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        //FlightInfoView()
        LikeFollowButtonsView()
        //ReportVideoContentView()
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
