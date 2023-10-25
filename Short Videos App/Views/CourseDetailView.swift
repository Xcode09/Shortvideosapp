//
//  CourseDetailView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 01/09/2023.
//

import SwiftUI

struct CourseDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: viewPadding){
                    VStack(spacing: 20+viewPadding){
                        VStack(spacing:viewPadding-5){
                            HStack{
                                HStack {
                                    Image("location_on_fill")
                                        .resizable()
                                        .frame(width:12,height:15)
                                    VStack(alignment:.leading){
                                        Text("Multan")
                                            .font(Font.custom("Nunito-Black", size: 8))
                                            .foregroundColor(Color.init(hex: "#FF7EC3"))
                                        
                                        Text("Pakistan")
                                            .font(Font.custom("Nunito-Black", size: 8))
                                            .foregroundColor(Color.init(hex: "#FF7EC3"))
                                    }
                                }
                                .offset(y:-20)
                                
                                Spacer()

                                HStack {
                                    Text("English")
                                        .font(Font.custom("Nunito-Black", size: 8))
                                        .foregroundColor(Color.init(hex: "#FF7EC3"))
                                    Image("language_fill")
                                        .resizable()
                                        .frame(width:12,height:15)
                                }
                                .offset(y:-20)
                            }
                            .frame(height:46)
                            
                            
                            Text("First name and Lastname")
                                .foregroundColor(.white)
                                .font(Font.custom("Nunito-SemiBold", size: 10))
                            
                            TagView(text: "Mathematics")
                                .foregroundColor(.black)
                            
                            
                            Text("Course title over 2 lines")
                                .foregroundColor(.white)
                                .frame(width:130)
                                .font(Font.custom("Nunito-Bold", size: 22))
                                .lineSpacing(0)
                                
                            
                            Text("Course description over two lines maximum 80 characters")
                                .frame(width:200)
                                .foregroundColor(.white)
                            .regularFont()
                            .multilineTextAlignment(.center)
                            
                            HStack(spacing:40){
                                StatView(value: "2.2k", title: "Students",color: "#531886")
//                                    .frame(width:65,height:55)
                                StatView(value: "4k", title: "Reactions",color: "#531886")
//                                    .frame(width:65,height:55)
                                StatView(value: "124k", title: "Views",color: "#531886")
//                                    .frame(width:65,height:55)
//
                                StatView(value: "55", title: "Points",color: "#531886")
//                                    .frame(width:65,height:55)
                            }
                            
                            Spacer().frame(height:viewPadding+viewPadding)
                            
                            
                            
                        }
                        .padding()
                        //.frame(height:290)
                        .customRoundedRectangle(borderWidth:borderWidth+1,backgroundColor:Color.init(hex: "#2E0A6A"))
                        .overlay(alignment:.top){
                            Circle()
                                .strokeBorder(Color.green,lineWidth: 6)
                                .frame(width: 120,height: 120)
                                .background(Circle().fill(Color.init(hex: "#1D5E86")))
                                .offset(y:-60)
                                .overlay {
                                    ZStack{
                                        Circle().fill(Color.init(hex: "#531886"))
                                            .frame(width:26,height:26)
                                        
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .frame(width:10,height:10)
                                            .scaledToFit()
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                        }
                        .overlay(alignment:.bottom) {
                            HStack{
                                //Spacer()
                                VStack(spacing:-5){
                                    Text("Available Now")
                                        .font(.custom("Nunito-Bold", size: 16))
                                        .frame(alignment:.center)
                                        .lineLimit(2)
                                        //.minimumScaleFactor(0.5)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.center)
                                        .lineSpacing(0)
                                    
                                    Text("for Quick Help")
                                        .font(.custom("Nunito-Bold", size: 16))
                                        .frame(alignment:.center)
                                        .lineLimit(2)
                                        //.minimumScaleFactor(0.5)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.center)
                                        .lineSpacing(0)
                                }
                                
                                
                                Image("spark_green")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width:21,height:37)
                                    .foregroundColor(Color.init(hex: "#0A965A"))
                                    
                            }
                            .frame(width:240,height:50)
                            .customRoundedRectangle(backgroundColor:Color.init(hex: "#4DD99E"))
                            .offset(y:20)
                        }
                        VStack(spacing:-10){
                            ForEach(0..<5) { _ in
                                VideoWithDetailCellView()
                                    //.frame(maxWidth:.infinity)
                            }
                        }
                        
                        
                        HStack{
                            Button {
                                //
                            } label: {
                                HStack {
                                    Image("bookmark_remove_fill")
                                        .resizable()
                                        .frame(width:20,height:23)
                                    
                                    Text("Remove from collection")
                                        .font(Font.custom("Nunito-Black", size: 10))
                                        .foregroundColor(Color.init(hex: "#CB78F0"))
                                    
                                        .multilineTextAlignment(.leading)
                                    
                                }
                                .frame(width:133,height:38)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.init(hex: "#33244E"))
                                }
                            }
                            
                            Spacer()
                        }
                        

                        
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(hex: "#110031"))
                    }
                    
                    segmentView
                        .padding()
                    
                    LazyVGrid(columns: [GridItem(spacing:0),GridItem(spacing:0)],spacing:0) {
                        ForEach(0..<6) { _ in
                            courseDetailCell
                        }
                    }
                    .background {
                        Color.init(hex: "#A879DE")
                    }
                    
                }
                .frame(width:UIScreen.main.bounds.width)
                
                
            }
            .toolbar {
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
                        
                    }
                }
                
                ToolbarItem(placement:.principal){
                    HStack{
                        CardOffSetButton(title: "Biology",offSetY: 0,colors: [.init(hex: "#383286"),.init(hex: "#1C1943")],width: 200)
                            //.disabled(true)
                        //Spacer()
                        
                        //.frame(width:60)
                    }
                }
                
                
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action: {
                        // Action to perform when button is tapped
                        print("Button tapped")
                    }) {
                        ZStack{
                            Circle()
                                .fill(AppColors.customLightGrayColor.opacity(0.5))
                                .frame(width: 40, height: 40)
                            Image("search")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
                        
                    }
                    
                }
            }
            .background {
                BackgroundView().ignoresSafeArea()
            }
        }
        
    }
    
    var segmentView:some View {
        VStack{
            HStack {
                Button {
                    //
                } label: {
                    HStack{
                        Text("Videos")
                            .foregroundColor(.init(hex: "#37155A"))
                            .regularFont()
                        
                        Spacer()
                        
                        Text("8")
                            .regularFont()
                            .padding(.horizontal)
                            .frame(width:50)
                            .foregroundColor(.init(hex: "#37155A"))
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.init(hex: "#C9B4CE"))
                            }
                    }
                    .padding(.vertical,5)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.init(hex: "#9783BE"))
                    }
                }

                
                Button {
                    //
                } label: {
                    HStack{
                        
                        Text("4")
                            .regularFont()
                            .padding(.horizontal)
                            .frame(width:50)
                            .foregroundColor(.init(hex: "#37155A"))
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.init(hex: "#8D6396"))
                            }
                        
                        Spacer()
                        
                        Text("Courses")
                            .regularFont()
                            .foregroundColor(.init(hex: "#76579F"))
                        
                        
                        
                        
                    }
                    .padding(.vertical,5)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.init(hex: "#391D5C"))
                    }
                }

                
                
            }
        }
        //.padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.init(hex: "#1B0833"))
                }
        }
    }
    
    var courseDetailCell:some View{
        HStack{
            RoundedRectangle(cornerRadius: 10)
                .fill((LinearGradient(colors: [.init(hex: "#585353"),.init(hex: "#0B0B0B")], startPoint: .top, endPoint: .bottom)))

            
            VStack{
                Text("Course Name over 4 lines with overflow …..")
                    .foregroundColor(.white)
                    .font(Font.custom("Nunito-Bold", size: 13))
                    .lineLimit(4)
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                
                HStack{
                    StatView(value: "2.2k", title: "Students",color: "#531886")
                        .frame(width:40,height:40)
                    
                    StatView(value: "4k", title: "Reactions",color: "#531886")
                        .frame(width:40,height:40)
                    
                }
                HStack{
                    StatView(value: "124k", title: "Views",color: "#531886")
                        .frame(width:40,height:40)
                    
                    StatView(value: "55", title: "Points",color: "#531886")
                        .frame(width:40,height:40)
                }
                
            }
        }
        .padding(viewPadding)
        .frame(maxHeight:184)
        .background {
            RoundedRectangle(cornerRadius: 0)
                .strokeBorder(Color.init(hex: "#A879DE"),lineWidth: 2)
                .background {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.init(hex: "#11003"))
                }
        }
    }
    
}



struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView()
    }
}
