//
//  HeaderTabView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 01/09/2023.
//

import SwiftUI

struct HeaderTabView: View {
    
    let items = (1...20).map { "Item \($0)" }
    @State private var selectedItem: String? = nil
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { scrollView in
                LazyHGrid(rows: [GridItem()],spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        Text("Collection Name")
                            .padding()
                            .regularFont()
                            .foregroundColor(Color.init(hex: "#FFA5A5"))
                            .frame(width:110,height: 60)
                            .minimumScaleFactor(0.5)
                            .lineLimit(2)
                            .background {
                                if selectedItem == item {
                                    Rectangle()
                                        .fill(Color.init(hex: "#01024D"))

                                }else{
                                    Rectangle()
                                        .fill(LinearGradient(colors: [Color.init(hex: "3C0A62").opacity(0.5),Color.init(hex: "3C0A62")], startPoint: .leading, endPoint: .trailing))
                                }

                            }
                            .onTapGesture {
                                selectedItem = item
                                scrollToItem(scrollView, item)
                            }
                    }
                }
                
                //.padding()
            }
        }
        .overlay {
            HStack{
                LinearGradient(colors: [Color.black.opacity(0.5),Color.white.opacity(0.5)], startPoint: .leading, endPoint: .trailing)
                    .frame(width:UIScreen.main.bounds.width * 0.2,height: 60)
                    .opacity(0.5)
//                Color.red.frame(width:UIScreen.main.bounds.width * 0.2,height: 60)
                
                Spacer()
                
                LinearGradient(colors: [Color.white.opacity(0.5),Color.black.opacity(0.5)], startPoint: .trailing, endPoint: .leading)
                    .frame(width:UIScreen.main.bounds.width * 0.2,height: 60)
                    .opacity(0.5)
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
//    var body: some View {
//        ScrollView(.horizontal,showsIndicators: false) {
//            HStack(spacing:5) {
//                ForEach(1..<10) { index in
//                    Text("Collection Name")
//                        .padding()
//                        .regularFont()
//                        .frame(width:100,height: 60)
//                        .minimumScaleFactor(0.5)
//                        .lineLimit(2)
//                        .background {
//                            Rectangle()
//                                .fill(LinearGradient(colors: [Color.init(hex: "3C0A62").opacity(0.5),Color.init(hex: "3C0A62")], startPoint: .leading, endPoint: .trailing))
//                        }
//                }
//            }
//            //.padding()
//        }
//    }
}

struct HeaderTabView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTabView()
    }
}

