//
//  SuggestedCoursesCellView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 28/08/2023.
//

import SwiftUI

struct SuggestedCoursesCellView: View {
    var body: some View {
        HStack(spacing:5){
            RoundedRectangle(cornerRadius: cornerRadiusValue)
                .fill(LinearGradient(colors: [.init(hex: "#585353"), .init(hex: "#0B0B0B")], startPoint: .top, endPoint: .bottom))
                .aspectRatio(9/16, contentMode: .fit)
                .padding([.leading,.top,.bottom],3)

            VStack(alignment: .leading) {
                Text("Course Name over 4 lines with overflow …..")
                    .foregroundColor(.white)
                    .font(.custom("Nunito-Bold", size: 12))
                    .lineLimit(4)
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .offset(y:28)
       

                HStack{
                    TagView(text: "Mathematics")
                        .foregroundColor(.black)
                    Spacer()
                }

                HStack(spacing: 3) {
                    IconText(imageName: "library_add_check", text: "3/10", iconWidth: 13, iconHeight: 13)
                        .foregroundColor(.white)
                    IconText(imageName: "visibility_fill", text: "6/10", iconWidth: 13, iconHeight: 13)
                        .foregroundColor(.white)
                    
                    Spacer()
                }

                Text("+3.4k Students")
                    .font(.custom("Nunito-Bold", size: 8))
                    .foregroundColor(.white)
                    //.minimumScaleFactor(0.5)
                    .padding(.bottom,5)
            }
//            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading) // Expand the inner VStack to fill width
            .aspectRatio(9/16, contentMode: .fit)
            .overlay(alignment: .topTrailing) {
                Circle()
                    .strokeBorder(Color.green, lineWidth: 3)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.gray))
                    .offset(y: -23)
            }
            
        }
        .customRoundedRectangle(borderWidth: borderWidth+1,backgroundColor: Color(hex: "#110031"))
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
            HStack(spacing: 2) {
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
            HStack(spacing: 2) {
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
