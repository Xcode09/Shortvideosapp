//
//  SuggestedCoursesCellView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 28/08/2023.
//

import SwiftUI

struct SuggestedCoursesCellView: View {
    var body: some View {
        HStack(spacing: 5) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .padding()
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Course Name")
                    .padding(.top,20)
                    .font(.headline)
                    .lineLimit(3)
                    .minimumScaleFactor(0.7)
                    .multilineTextAlignment(.center)

                HStack(spacing: 10) {
                    IconText(imageName: "library_add_check", text: "3/10")
                    IconText(imageName: "visibility_fill", text: "6/10")
                }
                
                TagView(text: "Mathematics")
                    
                
                Text("+3.4k Students")
                    .font(.custom("Nunito-Bold", size: 12))
                    .minimumScaleFactor(0.7)
            }
            .padding(.vertical, 10)
            .foregroundColor(.white)
            
            Spacer()
        }
        .frame(height:180)
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

    var body: some View {
        HStack(spacing: 3) {
            Image(imageName)
                .resizable()
                .frame(width: 12, height: 12)
                .scaledToFit()

            Text(text)
                .regularFont()
                .lineLimit(0)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}




struct SuggestedCoursesCellView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedCoursesCellView()
    }
}
