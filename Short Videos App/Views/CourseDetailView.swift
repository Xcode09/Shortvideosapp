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
                VStack{
                    VStack{
                        VStack(spacing:16){
                            HStack{
                                IconText(imageName: "location_on_fill", text: "Multan pakistan",iconWidth:12,iconHeight: 15,contentMode: .fill)
                                    .foregroundColor(Color.init(hex: "#FF7EC3"))
                                    .frame(width: 100)
                                Spacer()
                                
                                IconText(imageName: "language_fill", text: "English",iconWidth:12,iconHeight: 15,contentMode: .fill,isLeftHand: true)
                                    .foregroundColor(Color.init(hex: "#FF7EC3"))
                                    .frame(width: 100)
                            }
                            
                            Spacer().frame(height:20)
                            
                            Text("First name and Lastname")
                                .foregroundColor(.white)
                            .regularFont()
                            
                            TagView(text: "Biology")
                            
                            Text("Courses Name")
                                .foregroundColor(.white)
                            .boldFont()
                            
                            Text("Course description over two lines maximum 80 characters")
                                .foregroundColor(.white)
                            .regularFont()
                            .multilineTextAlignment(.center)
                            
                            HStack {
                                StatView(value: "2.2k", title: "Students",color: "#531886")
                                StatView(value: "4k", title: "Reactions",color: "#531886")
                                StatView(value: "124k", title: "Views",color: "#531886")
                                
                                StatView(value: "55", title: "Points",color: "#531886")
                            }
                            
                            
                            
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.init(hex: "#2E0A6A"))
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
                                            .frame(width:30,height:30)
                                        
                                        Image(systemName: "checkmark")
                                            .padding()
                                            .frame(width:20,height:20)
                                            .scaledToFit()
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                        }
                        
                        ForEach(0..<5) { _ in
                            VideoWithDetailCellView()
                        }
                        HStack{
                            Button {
                                //
                            } label: {
                                IconText(imageName: "bookmark_remove_fill", text: "Remove from collection",iconWidth:20,iconHeight:24)
                                    .foregroundColor(Color.init(hex: "#CB78F0"))
                                    .padding()
                                    
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
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing:0) {
                        ForEach(0..<5) { _ in
                            courseDetailCell
                        }
                    }
                    .padding()
                    
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
                    .padding(.vertical,10)
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
                    .padding(.vertical,10)
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
            Color.black.cornerRadius(20)
            
            VStack{
                Text("Course Name")
                    .foregroundColor(.white)
                    .boldFont()
                    .lineLimit(4)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                
                HStack{
                    StatView(value: "2.2k", title: "Students",color: "#531886")
                    
                    StatView(value: "4k", title: "Reactions",color: "#531886")
                }
                HStack{
                    StatView(value: "124k", title: "Views",color: "#531886")
                    
                    StatView(value: "55", title: "Points",color: "#531886")
                }
                
            }
        }
        .padding(10)
        .frame(maxHeight:184)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.init(hex: "#A879DE"),lineWidth: 2)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#110031"))
                }
        }
    }
    
}



struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView()
    }
}
