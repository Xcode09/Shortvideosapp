//
//  SuggestedCoursesCellView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 28/08/2023.
//

import SwiftUI

struct SuggestedCoursesCellView: View {
    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                //.frame(width:70)
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Course Name")
                    .padding(.top,20)
                    .boldFont()
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)

                HStack(spacing: 10) {
                    IconText(imageName: "library_add_check", text: "3/10")
                    IconText(imageName: "visibility_fill", text: "6/10")
                }
                
                TagView(text: "Mathematics")
                    
                
                Text("+3.4k Students")
                    .font(.custom("Nunito-Bold", size: 12))
                    .minimumScaleFactor(0.5)
            }
            .padding(.vertical, 10)
            .foregroundColor(.white)
            
        }
//       ` .padding()`
        //.frame(height:180)
        .overlay(alignment:.topTrailing,content: {
            Circle()
                .strokeBorder(Color.green,lineWidth: 3)
                .frame(width: 50,height: 50)
                .background(Circle().fill(Color.gray))
                .offset(y:-25)
            
        })
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color(hex: "#110031")))
    }
}

struct IconText: View {
    let imageName: String
    let text: String
    var iconWidth:CGFloat = 12
    var iconHeight:CGFloat = 12
    var contentMode:ContentMode = .fit
    var isLeftHand : Bool = false
    var body: some View {
        if isLeftHand {
            HStack(spacing: 3) {
                Text(text)
                    .regularFont()
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                
                Image(imageName)
                    .resizable()
                    .frame(width: iconWidth, height: iconHeight)
                    .aspectRatio(contentMode: contentMode)

                
            }
        }else{
            HStack(spacing: 3) {
                Image(imageName)
                    .resizable()
                    .frame(width: iconWidth, height: iconHeight)
                    .aspectRatio(contentMode: contentMode)

                Text(text)
                    .regularFont()
                    .lineLimit(0)
                    .minimumScaleFactor(0.3)
                    .multilineTextAlignment(.center)
            }
        }
        
    }
}




struct SuggestedCoursesCellView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedCoursesCellView()
    }
}
