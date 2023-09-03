//
//  HeaderTabView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 01/09/2023.
//

import SwiftUI

struct HeaderTabView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing:5) {
                ForEach(1..<10) { index in
                    Text("Collection Name")
                        .padding()
                        .regularFont()
                        .frame(width:100,height: 60)
                        .minimumScaleFactor(0.5)
                        .lineLimit(2)
                        .background {
                            Rectangle()
                                .fill(LinearGradient(colors: [Color.init(hex: "3C0A62").opacity(0.5),Color.init(hex: "3C0A62")], startPoint: .leading, endPoint: .trailing))
                        }
                }
            }
            //.padding()
        }
//        .overlay(
//            LinearGradient(gradient: Gradient(colors: [Color.white, Color.black.opacity(0.5), Color.black.opacity(0.5),Color.white]), startPoint: .leading, endPoint: .trailing)
//                .frame(width: 20)
//                .mask(
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 30)
//                )
//            , alignment: .leading
//        )
//        .overlay(
//            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white, Color.white, Color.clear]), startPoint: .trailing, endPoint: .leading)
//                .frame(width: 30)
//                .mask(
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 30)
//                )
//            , alignment: .trailing
//        )
    }
}

struct HeaderTabView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTabView()
    }
}

