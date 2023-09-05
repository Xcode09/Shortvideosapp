//
//  VideoSmallCell.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 27/08/2023.
//

import SwiftUI

struct VideoSmallCell: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [.init(hex: "#1C1C1C"),.init(hex: "#272727")], startPoint: .top, endPoint: .bottom))
                //.frame(width: 160,height: 200)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .overlay(alignment:.topTrailing) {
            Image("like")
                .frame(width: 20,height: 20)
                .offset(x:-10,y: 10)
        }
        .overlay(alignment:.bottomLeading) {
            HStack {
                Image("Videos")
                    .frame(width: 14,height: 14)
                    .rotationEffect(.degrees(180))
                
                Text("2345")
                    .foregroundColor(.white)
                    .regularFont()
                    .minimumScaleFactor(0.5)
            }
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black.opacity(0.7))
            }
            .offset(x:10,y: -10)
        }
    }
}

struct VideoSmallCell_Previews: PreviewProvider {
    static var previews: some View {
        VideoSmallCell()
    }
}
