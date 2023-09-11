//
//  SearchVideosFilterView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 31/08/2023.
//

import SwiftUI

struct SearchVideosFilterView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .ignoresSafeArea()
                ScrollView{
                    ZStack{
                        VStack(spacing:40){
                            Text("Video Search")
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Bold", size: 24))
                                .padding()
                            
                            ForEach(0..<5) { _ in
                                FilterTextFieldView(placeHolder: "Pakistan", label: "Target Country")
                            }
                            
                            HStack {
                                Text("Videos that require no sound.")
                                    .foregroundColor(.white)
                                    .font(.custom("Nunito-SemiBold", size: 18))
                                    .frame(maxWidth:.infinity,alignment:.leading)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5)
                                
                                Button {
                                    //
                                } label: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                }
                                .frame(width:24,height:24)

                            }
                            
                        }
                        .padding(.vertical,30)
                        .padding(.horizontal,20)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black,lineWidth:2)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.init(hex:"#49208B"))
                                }
                        }
                        .overlay(alignment:.bottom){
                            CardOffSetButton(title: "Search",offSetY: 28,colors: [.init(hex: "#50FFC9"),.init(hex: "#288065")])
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
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
            }
        }
        
        //.padding()
        
    }
}

struct FilterTextFieldView:View
{
    @State var searchText = ""
    let placeHolder:String
    let label:String
    var body: some View {
        VStack {
            HStack{
                TextField(text: $searchText) {
                    Text(placeHolder)
                        .foregroundColor(.black)
                        .regularFont()
                        
                }
                
                 Triangle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.init(hex: "#B38BFE"))
                    .rotationEffect(.degrees(180))
                    .overlay(
                        Triangle()
                            .stroke(Color.black, lineWidth: 2)
                            .rotationEffect(.degrees(180))
                    )
                    
                    
                
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black,lineWidth:2)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(hex: "#F3E0FD"))
                    }
                    
            }
            .overlay(alignment:.topLeading){
                Text(label)
                    .padding(5)
                    .foregroundColor(.black)
                    .regularFont()
                    .background(content: {
                        Color.init(hex: "#F3E0FD")
                    })
                    .offset(x:10,y:-26)
            }
        }
    }
}

struct SearchVideosFilterView_Previews: PreviewProvider {
    static var previews: some View {
//        FilterTextFieldView(placeHolder: "Pakistan", label: "Main Language")
        SearchVideosFilterView()
    }
}










