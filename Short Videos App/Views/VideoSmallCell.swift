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
            RoundedRectangle(cornerRadius: 6)
                .fill(LinearGradient(colors: [.init(hex: "#1C1C1C"),.init(hex: "#272727")], startPoint: .top, endPoint: .bottom))
                //.frame(width: 160,height: 200)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .overlay(alignment:.topTrailing) {
            
            Image(systemName: "hand.thumbsup.fill")
                .resizable()
                .frame(width: 12,height: 12)
                .foregroundColor(.yellow)
                
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.ultraThinMaterial)
                        .frame(width:24,height: 24)
                        
                }
                .offset(x:-10,y:10)
                
                
        }
        .overlay(alignment:.bottomLeading) {
            HStack(spacing:5){
                Image("Videos")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .rotationEffect(.degrees(180))
                
                Text("2345")
                    .foregroundColor(.init(hex: "#8592C1"))
                    .font(.custom("Nunito-Bold", size: 12))
                    .minimumScaleFactor(0.5)
            }
            .padding(5)
            .background {
                RoundedRectangle(cornerRadius: 40)
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
