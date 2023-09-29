//
//  TeacherProfileView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 28/09/2023.
//

import Foundation
import SwiftUI

struct TeacherProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: viewPadding+viewPadding){
                    VStack(spacing: 10){
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
                            
                            Text("@username")
                                .foregroundColor(.white)
                                .font(Font.custom("Nunito-Bold", size: 11))
                            
                            Text("First name and Lastname")
                                .foregroundColor(.white)
                                .font(Font.custom("Nunito-SemiBold", size: 10))
                            HStack {
                                TagView(text: "Mathematics")
                                    .foregroundColor(.black)
                                
                                TagView(text: "Physics")
                                    .foregroundColor(.black)
                                
                                TagView(text: "Biology")
                                    .foregroundColor(.black)
                            }
                            
                            
                            Text("Math teacher by day, tutor by night, contact me if you need any help!")
                                //.frame(width:200)
                                .foregroundColor(.white)
                                .font(Font.custom("Nunito-Bold", size: 12))
                            .multilineTextAlignment(.center)
                            
                            HStack(spacing:40){
                                StatView(value: "2.2k", title: "Students",color: "#531886")

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
//                        VStack(spacing:-10){
//                            ForEach(0..<5) { _ in
//                                VideoWithDetailCellView()
//                                    //.frame(maxWidth:.infinity)
//                            }
//                        }
                        
                        
//                        HStack{
//                            Button {
//                                //
//                            } label: {
//                                HStack {
//                                    Image("bookmark_remove_fill")
//                                        .resizable()
//                                        .frame(width:20,height:23)
//
//                                    Text("Remove from collection")
//                                        .font(Font.custom("Nunito-Black", size: 10))
//                                        .foregroundColor(Color.init(hex: "#CB78F0"))
//
//                                        .multilineTextAlignment(.leading)
//
//                                }
//                                .frame(width:133,height:38)
//                                .background {
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .fill(Color.init(hex: "#33244E"))
//                                }
//                            }
//
//                            Spacer()
//                        }
                        

                        
                    }
                    .padding()

                    
                    segmentView
                        .padding(.horizontal)
                    
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
                        Image("back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20) // Adjust the size as needed
                            .padding()
                            .background(AppColors.customLightGrayColor.opacity(0.5))
                            .clipShape(Circle()) // Clip the button and its background to a circle
                    }
                }
                
                ToolbarItem(placement:.principal){
                    Spacer().frame(height:30)
                }
                
                
//                ToolbarItem(placement:.navigationBarTrailing){
//                    Button(action: {
//                        // Action to perform when button is tapped
//                        print("Button tapped")
//                    }) {
//                        Image("search")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: 20) // Adjust the size as needed
//                            .padding()
//                            .background(AppColors.customLightGrayColor.opacity(0.5))
//                            .clipShape(Circle()) // Clip the button and its background to a circle
//                    }
//
//                }
            }
            .background {
                LinearGradient(colors: [.init(hex: "#650489"),.init(hex: "#000000")], startPoint: .top, endPoint: .bottom)
                    //.rotationEffect(Angle.degrees(180))
                    .ignoresSafeArea()
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
        .frame(maxWidth:.infinity,maxHeight:184)
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


struct Teacher_Previews:PreviewProvider{
    static var previews: some View{
        TeacherProfileView()
    }
}
