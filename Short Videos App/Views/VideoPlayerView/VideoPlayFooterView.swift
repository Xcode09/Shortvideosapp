//
//  VideoPlayFooterView.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI

struct VideoPlayFooterView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    Text("Geometry")
                        .font(.system(size: 10))
                        .padding(6)
                        .foregroundColor(.white)
                        .background(AppColors.customLightGrayColor)
                        .cornerRadius(5, corners: .allCorners)
                    Text("Algebra")
                        .font(.system(size: 10))
                        .padding(6)
                        .foregroundColor(.white)
                        .background(AppColors.customLightGrayColor)
                        .cornerRadius(5, corners: .allCorners)

                    Text("Probability")
                        .font(.system(size: 10))
                        .padding(6)
                        .foregroundColor(.white)
                        .background(AppColors.customLightGrayColor)
                        .cornerRadius(5, corners: .allCorners)

                }
                   }
                   
                   Spacer()
                   
                   Button(action: {
                       // Action for the "more" button
                   }) {
                       Image("more")
                           .resizable()
                           .scaledToFit()
                           .frame(width: 20,height: 20)
                   }
               }
               .padding()
    }
}

struct VideoPlayFooterView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayFooterView()
    }
}


// MARK: - Video Title & Description View
struct VideoDetailView: View {
    var videoTitle: String
    var videoDescription: String
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text(videoTitle)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(AppColors.customLightGrayColor)

            
            Text(videoDescription)
                .font(.system(size: 10))
                .foregroundColor(AppColors.customLightGrayColor)
        }
        .padding()
    }
}
