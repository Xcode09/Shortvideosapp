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
                    VStack{
                        VStack{
                            Text("Courses")
                                .foregroundColor(Color.init(hex: "#65C0E8"))
                                .boldFont()
                                .padding()
                            
                            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing:30) {
                                ForEach(0..<4) { _ in
                                    SuggestedCoursesCellView()
                                }
                                
                            }.padding()
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.init(hex: "#01024D"))
                        }
                    }
                    .padding(.horizontal,5)
                    
                    VStack{
                        VStack{
                            
                            ForEach(0..<8) { _ in
                                VideoWithDetailCellView()
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.init(hex: "#2C0A62"))
                        }
                    }
                    .padding(.horizontal,5)
                    
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                
            }
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading){
                    Button(action: {
                        // Action to perform when button is tapped
                        print("Button tapped")
                        //presentationMode.wrappedValue.dismiss()
                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image("back")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20) // Adjust the size as needed
                            .padding()
                            .background(Color.init(hex: "#A890FF"))
                            
                            .clipShape(Circle()) // Clip the button and its background to a circle
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
                        Image("back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20) // Adjust the size as needed
                            .padding()
                            .background(Color.init(hex: "#A890FF"))
                            .clipShape(Circle()) // Clip the button and its background to a circle
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
