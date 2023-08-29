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
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .padding(3)
            
            VStack(alignment:.leading, spacing:40){
                Text("Course Name over 4 lines with overflow …..")
                    .boldFont()
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                
                //Spacer()
                
                HStack(spacing:20){
                    
                    HStack(spacing:5){
                        Image("library_add_check")
                            .frame(width: 8,height: 8)
                            .scaledToFit()
                        
                        Text("3/10")
                            .lineLimit(0)
                            .minimumScaleFactor(0.5)
                    }
                    
                    
                    HStack(spacing:5){
                        Image("library_add_check")
                            .frame(width: 8,height: 8)
                            .scaledToFit()
                        
                        Text("3/10")
                            .lineLimit(0)
                            .minimumScaleFactor(0.5)
                    }
                }
                
                //Spacer()
                
                Text("+3.4k Students")
                    .font(.custom("Nunito-Bold", size: 8))
                
                
            }
            .padding(.all,5)
            .frame(maxHeight:.infinity)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .overlay(alignment:.topTrailing){
            Image("circle_with_green_border")
                .frame(width: 50,height: 50)
                .offset(y:-30)
        }
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: "#110031"))
        }
    }
}

struct SuggestedCoursesCellView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedCoursesCellView()
    }
}
