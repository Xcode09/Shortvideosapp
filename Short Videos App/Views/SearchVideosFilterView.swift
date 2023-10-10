//
//  SearchVideosFilterView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 31/08/2023.
//

import SwiftUI

struct SearchVideosFilterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var segmentArr = ["Curriculum","Topic"]
    
    @State var selectedTab = "Curriculum"
    @State var selectedIndex = -0
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .ignoresSafeArea()
                ZStack{
                    VStack(spacing:35){
                        Text("Video Search")
                            .foregroundColor(.white)
                            .font(.custom("Nunito-Bold", size: 24))
                        //.padding(vi)
                        
                        segmentView
                        
                        if selectedTab == "Curriculum" {
                            ScrollView {
                                ForEach(0..<2) { _ in
                                    FilterTextFieldView(placeHolder: "Pakistan", label: "Target Country")
                                        .padding(.vertical)
                                }
                                .offset(y:5)
                                
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
                                //.offset(y:-15)
                                
                                Divider().frame(height:1.5).overlay {
                                    Color.white
                                }
                                //.offset(y:-10)
                                
                                titleView
                                    
                                
                                ScrollView{
                                    VStack(spacing:30){
                                        Spacer().frame(height:0)
                                        ForEach(0..<5,id:\.self) {
                                            index in
                                            HStack(spacing:0){
                                                VStack(spacing:30){
                                                    Text("Curriculum")
                                                        .foregroundColor(.init(hex:"#531886"))
                                                        .font(.custom("Nunito-ExtraBold", size: 14))
                                                        .frame(width:100,height:25)
                                                        .offset(x:-50)
                                                        .rotationEffect(.degrees(-270))
                                                    
                                                    
                                                    Text("Section")
                                                        .foregroundColor(.init(hex:"#531886"))
                                                        .font(.custom("Nunito-ExtraBold", size: 14))
                                                        .frame(width:100,height:25)
                                                        .offset(x:-40)
                                                        .rotationEffect(.degrees(-270))
                                                    
                                                    
                                                    
                                                }
                                                //                                            .rotationEffect(.degrees(-270))
                                                .frame(width:30,height:260)
                                                
                                                .customRoundedRectangle(cornerRadiusValue:30,borderWidth:2,backgroundColor: .init(hex:"#A890FF"), borderColor: .init(hex:"#49208B"))
                                                .offset(x:-5)
                                                
                                                
                                                
                                                ScrollView {
                                                    VStack{
                                                        ForEach(0..<10,id:\.self) {
                                                            subIndex in
                                                            if selectedIndex == subIndex {
                                                                HStack {
                                                                    Circle()
                                                                        .fill(Color.black)
                                                                        .frame(width:14,height:14)
                                                                        
                                                                    Text("Curriculum Section title ovar 2 lines and with ovarflow....")
                                                                        .foregroundColor(.black)
                                                                        .font(.custom("Nunito-Bold", size: 14))
                                                                        .frame(maxWidth:.infinity,alignment:.leading)
                                                                }
                                                                .onTapGesture {
                                                                    selectedIndex = subIndex
                                                                }
                                                                .padding(viewPadding)
                                                                .customRoundedRectangle(backgroundColor: .white)
                                                            }
                                                            else{
                                                                HStack {
                                                                    Circle()
                                                                        .frame(width:14,height:14)
                                                                        
                                                                    Text("Curriculum Section title ovar 2 lines and with ovarflow....")
                                                                        .foregroundColor(.white)
                                                                        .font(.custom("Nunito-Bold", size: 14))
                                                                        .frame(maxWidth:.infinity,alignment:.leading)
                                                                }
                                                                .padding(viewPadding)
                                                                .onTapGesture {
                                                                    selectedIndex = subIndex
                                                                }
                                                            }
                                                            
                                                            
                                                            
                                                        }
                                                    }
                                                }
                                                
                                                
                                            }
                                            .padding(.horizontal,5)
                                            .frame(height:250)
                                            .customRoundedRectangle(borderWidth:3,backgroundColor: .init(hex:"#2C0A62"), borderColor: .init(hex:"#2C0A62"))
                                            
                                            
                                            
                                        }
                                    }
                                    
                                }
                                .offset(y:-30)
                            }
                            
                        }else{
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
                            .offset(y:-15)
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.vertical,25)
                    .padding(.horizontal,20)
                    .frame(width:UIScreen.main.bounds.width * 0.95,height:UIScreen.main.bounds.height * 0.8)
                    .customRoundedRectangle(borderWidth:3,backgroundColor: Color.init(hex:"#49208B"))
                    .overlay(alignment:.bottom){
                        CardOffSetButton(title: "Search", offSetY: 28, colors: [.init(hex: "#50FFC9"),.init(hex: "#288065")], forColor: "")
                        //                            CardOffSetButton(title: "Search",offSetY: 28,colors: [.init(hex: "#50FFC9"),.init(hex: "#288065")],forColor:Color.black)
                        //.foregroundColor(.black)
                    }
                    .overlay(alignment:.topLeading) {
                        Button(action: {
                            // Action to perform when button is tapped
                            print("Button tapped")
                            //presentationMode.wrappedValue.dismiss()
                            presentationMode.wrappedValue.dismiss()
                            
                        }) {
                            Image(systemName:"xmark")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(.black)
                                .aspectRatio(contentMode: .fill)
                                
                                .frame(width: 14, height: 14) // Adjust the size as needed
                                .padding()
                                .background(Color.init(hex: "#A890FF"))
                                
                                .clipShape(Circle())
                                
                                
                        }
                        .background(content: {
                            Circle().stroke(Color.black,lineWidth:6)
                        })
                        .offset(y:-10)
                    }
                }
                .padding(viewPadding)
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
//            .toolbar {
//                ToolbarItem(placement:.navigationBarLeading) {
//                    Button(action: {
//                        // Action to perform when button is tapped
//                        print("Button tapped")
//                        //presentationMode.wrappedValue.dismiss()
//                        presentationMode.wrappedValue.dismiss()
//
//                    }) {
//                        Image("back")
//                            .renderingMode(.template)
//                            .resizable()
//                            .foregroundColor(.white)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: 20) // Adjust the size as needed
//                            .padding()
//                            .background(Color.init(hex: "#A890FF"))
//
//                            .clipShape(Circle()) // Clip the button and its background to a circle
//                    }
//                }
//            }
        }
        
        //.padding()
        
    }
    
    var titleView:some View{
        VStack{
            Text("Mathematics")
                .foregroundColor(.white)
                .font(.custom("Nunito-ExtraBold", size: 22))
            
            Text("Year 7 Curriculum")
                .foregroundColor(.white)
                .font(.custom("Nunito-ExtraBold", size: 22))
            
            
            Text("Select curriculum item")
                .foregroundColor(.white)
                .font(.custom("Nunito-regular", size: 13))
        }
    }
    
    var segmentView:some View{
        HStack(spacing:40){
            ForEach(0..<segmentArr.count,id:\.self) {
                index in
                if selectedTab == segmentArr[index] {
                    Button {
                        withAnimation {
                            selectedTab = segmentArr[index]
                        }
                    } label: {
                        Text(segmentArr[index])
                            .foregroundColor(selectedTab == segmentArr[index] ? Color.black : Color.white)
                            .font(.custom("Nunito-Bold", size: 18))
                            .padding(viewPadding)
                        
                    }
                    .frame(width:140,height:30)
                    .customRoundedRectangle(cornerRadiusValue:6,backgroundColor: .white)
                }else{
                    Button {
                        withAnimation {
                            selectedTab = segmentArr[index]
                        }
                        
                    } label: {
                        Text(segmentArr[index])
                            .foregroundColor(Color.white)
                            .font(.custom("Nunito-Bold", size: 18))
                            .padding(viewPadding)
                        
                    }
                    .frame(width:140,height:30)
                    .customRoundedRectangle(cornerRadiusValue:6,backgroundColor: .clear,borderColor: .init(hex: "#49208B"))
                }
                
                
                
                
            }
            
            
        }
        .padding(viewPadding)
        .background {
            RoundedRectangle(cornerRadius: cornerRadiusValue)
                .stroke(Color.black,lineWidth:3)
        }
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










