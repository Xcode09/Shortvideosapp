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
                    VStack(spacing: 20){
                        VStack(spacing:viewPadding){
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
                                
                                
                                Spacer()

                                HStack {
                                    Text("English")
                                        .font(Font.custom("Nunito-Black", size: 8))
                                        .foregroundColor(Color.init(hex: "#FF7EC3"))
                                    Image("language_fill")
                                        .resizable()
                                        .frame(width:12,height:15)
                                }
                            }
                            .frame(height:46)
                            
                            //Spacer().frame(height:20)
                            
                            Text("First name and Lastname")
                                .foregroundColor(.white)
                            .regularFont()
                            
                            TagView(text: "Biology")
                            
                            Text("Course title over 2 lines")
                                .foregroundColor(.white)
                                .font(Font.custom("Nunito-Bold", size: 23))
                            
                            Text("Course description over two lines maximum 80 characters")
                                .foregroundColor(.white)
                            .regularFont()
                            .multilineTextAlignment(.center)
                            
                            HStack {
                                StatView(value: "2.2k", title: "Students",color: "#531886")
                                    .frame(width:65,height:55)
                                StatView(value: "4k", title: "Reactions",color: "#531886")
                                    .frame(width:65,height:55)
                                StatView(value: "124k", title: "Views",color: "#531886")
                                    .frame(width:65,height:55)
                                
                                StatView(value: "55", title: "Points",color: "#531886")
                                    .frame(width:65,height:55)
                            }
                            
                            Spacer().frame(height:20)
                            
                            
                            
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: cornerRadiusValue)
                                .stroke(Color.black,lineWidth: borderWidth)
                                .background(content: {
                                    RoundedRectangle(cornerRadius: cornerRadiusValue)
                                        .fill(Color.init(hex:"#2E0A6A"))
                                })
                            
                        }
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
                                    
                                Text("Available Now for Quick Help")
                                    .font(.custom("Nunito-Bold", size: 16))
                                    .frame(alignment:.center)
                                    .lineLimit(2)
                                    //.minimumScaleFactor(0.5)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                
                                Image("spark_green")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width:21,height:37)
                                    .foregroundColor(Color.init(hex: "#0A965A"))
                                    
                            }
                            .frame(width:240,height:50)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black,lineWidth: borderWidth)
                                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                                    .background(content: {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(LinearGradient(colors: [Color.init(hex: "#47F2A9"),Color.init(hex: "#0A965A")], startPoint: .top, endPoint: .bottom))
                                    })
                            }
                            .offset(y:20)
                        }
                        
                        ForEach(0..<5) { _ in
                            VideoWithDetailCellView()
                                //.frame(maxWidth:.infinity)
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
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing:10) {
                        ForEach(0..<5) { _ in
                            courseDetailCell
                        }
                    }
                    //.padding()
                    
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
                        Image("search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20) // Adjust the size as needed
                            .padding()
                            .background(AppColors.customLightGrayColor.opacity(0.5))
                            .clipShape(Circle()) // Clip the button and its background to a circle
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
