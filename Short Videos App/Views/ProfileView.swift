//
//  ProfileView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 26/08/2023.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack{
            segmentView
                .padding()
            
            profileSettingView
                .padding()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    var segmentView:some View
    {
        HStack(spacing:10){
            Spacer().frame(width: 5)
            
            HStack{
                Text("Messages")
                    .padding(10)
                    .frame(maxWidth: .infinity,maxHeight:.infinity,alignment:.leading)
                    .foregroundColor(.init(hex: MyColors.darkPurpleColor))
                    .regularFont()
                    .minimumScaleFactor(0.7)
                
                Spacer()
                
                Text("9")
                    .regularFont()
                    .foregroundColor(.init(hex: MyColors.darkPurpleColor))
                    .frame(width: 30,height: 30)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(hex: MyColors.lightSkyColor))
                    }
                
                Spacer().frame(width: 10)
            }
            .frame(height: 44)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: MyColors.lightIndigoColor))
            }
            
            HStack{
                Text("Account")
                    .padding(10)
                    .frame(maxWidth: .infinity,maxHeight:.infinity,alignment:.leading)
                    .foregroundColor(.white)
                    .regularFont()
                
                Spacer()
                
//                Text("9")
//                    .padding()
//                    .regularFont()
//                    .foregroundColor(.init(hex: MyColors.darkPurpleColor))
//                    .background {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.init(hex: MyColors.tabBarSecondaryColor))
//                    }
            }
            .frame(height: 44)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: MyColors.purpleColor))
            }
            
            Spacer().frame(width: 5)
        }
        .frame(height: 54)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth:2)
                .fill(Color.black)
        }
        
    }
    
    var profileSettingView:some View
    {
        VStack(spacing:10){
            
            Text("Profile")
                .padding(10)
                .boldFont()
                .foregroundColor(.white)
                
            Text("stuUsername")
                .padding(10)
                .regularFont()
                .foregroundColor(.init(hex: MyColors.textBlueColor))
            
            Spacer().frame(height: 20)
            
            RowView(title: "Account", image: "profileIcon", rightImage: "",isLeftImage: true)
            
            RowView(title: "Preferences", image: "profileIcon", rightImage: "",isLeftImage: true)
            RowView(title: "Parents", image: "profileIcon", rightImage: "",isLeftImage: true)
            RowView(title: "Teachers", image: "profileIcon", rightImage: "",isLeftImage: true)
        }
        //.frame(height: UIScreen.main.bounds.height * 0.4)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.black, lineWidth: 2)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(hex: MyColors.purpleColor)))
        }
    }
}

struct RowView:View{
    let title:String
    let image:String
    let rightImage:String
    var isLeftImage = false
    var body: some View {
        HStack(spacing:20){
            Image(systemName: "person")
//                .resizable()
//                .frame(width: 20,height: 20)
//                .scaledToFit()
            
            Text(title)
                .boldFont(isExtra: true)
            
            Spacer()
            
            if isLeftImage {
                Image(systemName: "chevron.right")
            }
        }
        .padding()
        .foregroundColor(.white)
    }
}


import SwiftUI

struct Scrool: View {
    let items = (1...20).map { "Item \($0)" }
    @State private var selectedItem: String? = nil
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { scrollView in
                LazyHGrid(rows: [GridItem()]) {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .font(.title)
                            .frame(width: 200, height: 100)
                            .background(selectedItem == item ? Color.green : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedItem = item
                                scrollToItem(scrollView, item)
                            }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            //scrollToItem(nil)
        }
    }

    private func scrollToItem(_ scrollView: ScrollViewProxy, _ item: String?) {
        if let item = item {
            withAnimation {
                selectedItem = item
                scrollView.scrollTo(item, anchor: .center)
            }
        }
    }
}








struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        //ProfileView()
        //UploadDocumentView()
        
        Scrool()
    }
}
