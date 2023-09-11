//
//  SuggestedCoursesCellView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 28/08/2023.
//

import SwiftUI

struct SuggestedCoursesCellView: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .aspectRatio(9/16, contentMode: .fit)
                .padding(10)

            
            VStack(alignment: .leading, spacing:10) {
                Text("Course Name")
                    .padding(.top,30)
                    .foregroundColor(.white)
                    .font(.custom("Nunito-Bold", size: 18))
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)

                TagView(text: "Mathematics")
                    .foregroundColor(.black)
                
                HStack(spacing: 10) {
                    IconText(imageName: "library_add_check", text: "3/10")
                        .foregroundColor(.white)
                    IconText(imageName: "visibility_fill", text: "6/10")
                        .foregroundColor(.white)
                }
                
                Text("+3.4k Students")
                    .font(.custom("Nunito-Bold", size: 12))
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
            }
            //.padding(10)
            .aspectRatio(9/16, contentMode: .fit)
            
            
        }
        //.aspectRatio(9/16, contentMode: .fit)
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
