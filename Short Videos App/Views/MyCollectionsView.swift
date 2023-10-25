//
//  MyCollectionsView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 01/09/2023.
//

import SwiftUI

struct MyCollectionsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView().ignoresSafeArea()
                ScrollView {
                    HeaderTabView()
                        .padding(.top,5)
                    VStack{
                        VStack{
                            Text("Courses")
                                .foregroundColor(Color.init(hex: "#65C0E8"))
                                .boldFont()
                                .padding(.vertical,viewPadding + 5)
                            
                            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing:30) {
                                ForEach(0..<4) { _ in
                                    SuggestedCoursesCellView()
                                }
                                
                            }.padding()
                        }
                        .customRoundedRectangle(backgroundColor: Color.init(hex: "#01024D"))
                        
                    }
                    .padding(.top,-8)
                    .padding(.horizontal,5)
                    
                    VStack{
                        VStack{
                            Text("Videos")
                                .foregroundColor(Color.init(hex: "#CA65E8"))
                                .boldFont()
                            
                            ForEach(0..<8) { _ in
                                VideoWithDetailCellView()
                            }
                        }
                        .padding()
                        .customRoundedRectangle(backgroundColor: Color.init(hex: "#2C0A62"))
                    }
                    .padding(.horizontal,5)
                    
                    
                    
                    //Spacer()
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                
            }
            .navigationBarTitleDisplayMode(.inline)
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
                        CardOffSetButton(title: "My Collections",offSetY: 0,colors: [.init(hex: "#383286"),.init(hex: "#1C1943")],width: 200)
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
        }
        
    }
    
    var navView:some View
    {
        HStack{
            Button(action: {
                // Action to perform when button is tapped
                print("Button tapped")
                //presentationMode.wrappedValue.dismiss()

            }) {
                Image("back")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20) // Adjust the size as needed
                    .padding()
                    .background(AppColors.customLightGrayColor.opacity(0.5))
                    .clipShape(Circle()) // Clip the button and its background to a circle
            }
            
            CardOffSetButton(title: "My Collections",offSetY: 0)
            
            
            Button(action: {
                // Action to perform when button is tapped
                print("Button tapped")
                //presentationMode.wrappedValue.dismiss()

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
        
    }
}

struct MyCollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        MyCollectionsView()
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
