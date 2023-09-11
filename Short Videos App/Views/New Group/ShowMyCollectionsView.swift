//
//  ShowMyCollectionsView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 05/09/2023.
//

import SwiftUI

struct ShowMyCollectionsView: View {
    private var colorsPlate = ["#DEE5FF","#A8A9EB","#85DACC","#ADDA78","#F9CC6C","#F38D70","#FD6883"]
    @State private var collectionName = ""
    
    @State private var isCreateNewTapped = false
    var body: some View {
        VStack{
            
            if isCreateNewTapped {
                createNewCollectionView
            }else{
                Text("Add to a private collection")
                    .foregroundColor(.white)
                    .boldFont()
                    .padding()
                
                Button {
                    isCreateNewTapped.toggle()
                } label: {
                    Text("New Collection")
                        .foregroundColor(.black)
                        .boldFont()
                        .padding()
                }
                .frame(width:UIScreen.main.bounds.width - 40)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#49B8C6"))
                }
            }
        
            Spacer().frame(height:30)
            GeometryReader {
                proxy in
                ScrollView(showsIndicators: false){
                    ForEach(0..<30) { _ in
                        HStack {
                            Text("Collection Name")
                                .foregroundColor(.white)
                                .boldFont()
                                .padding()
                            Spacer()
                            
                            Button {
                                //
                            } label: {
                                Image("add_button")
                            }
                            .padding()
                            
                            
                        }
                        .frame(width:UIScreen.main.bounds.width - 20,height:46)
                        .background {
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(lineWidth: 2)
                                .background(content: {
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.init(hex: "#360D6E"))
                                })
                                .shadow(color:Color.black.opacity(0.5),radius:2,y:2)
                                
                                
                        }
                        
                        
                    }.frame(maxWidth:.infinity)
                }
                //.frame(height:proxy.size.height * 0.6)
            }
            

        }
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: "#1F083E"))
                .ignoresSafeArea()
        }
        
    }
    
    private var createNewCollectionView:some View
    {
        VStack{
            Text("Create a new collection")
                .foregroundColor(.white)
                .boldFont()
                .padding()
            
            
            
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment:.center, spacing:10){
                    HStack{
                        Text("Select a collection color")
                            .foregroundColor(.white)
                            .boldFont()
                            .padding()
                        Spacer()
                    }
                    ForEach(colorsPlate,id:\.self) {
                        color in
                        Spacer()
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.init(hex: color))
                            .frame(width: 32,height: 32)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 2)
                            }
                        Spacer()
                    }
                }
            }
            
            HStack(spacing:10){
                FloatingBorderLabelTextField(placeholder: "Collection Name", text: $collectionName)
                    .frame(height:60)
                
                Button {
                    //
                } label: {
                    Image("add_button")
                        .renderingMode(.template)
                        .foregroundColor(Color.init(hex: "#1F083E"))
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.init(hex: "#49B8C6"))
                    
                }
                    
            }
            .padding()
            
        }
    }
}

struct ShowMyCollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMyCollectionsView()
    }
}

struct FloatingBorderLabelTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            Text(placeholder)
                .font(.system(self.text.isEmpty ? .title2 : .title3, design: .rounded))
                .foregroundColor(.white)
                .padding(.horizontal, self.text.isEmpty ? 0 : 10)
                .background(Color.black)
                .offset(y: self.text.isEmpty ? 0 : -28)
                .scaleEffect(self.text.isEmpty ? 1 : 0.9, anchor: .leading)
            
            TextField("", text: self.$text)
                .font(.system(.title2, design: .rounded))
                .foregroundColor(.white)
        }
        .animation(.easeOut, value: !text.isEmpty)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(self.text.isEmpty ? .white : .white, lineWidth: 2)
                .background(content: {
                    RoundedRectangle(cornerRadius: 10)
                })
        )
    }
}
