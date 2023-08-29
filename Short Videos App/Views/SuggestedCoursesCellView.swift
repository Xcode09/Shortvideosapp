//
//  SuggestedCoursesCellView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 28/08/2023.
//

import SwiftUI

struct SuggestedCoursesCellView: View {
    var body: some View {
        ZStack{
            Color.init(hex: "#110031")
            
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                
                VStack{
                    Text("Course Name over 4 lines with overflow …..")
                        .boldFont()
                    
                    HStack{
                        Label("3/10", image: "library_add_check")
                            .rotationEffect(.degrees(360))
                        
                        Label("6/10", image: "library_add_check")
                            .rotationEffect(.degrees(360))
                    }
                    
                    
                }
            }
        }
        .overlay(alignment:.topTrailing){
            Image("circle_with_green_border")
                .frame(width: 50,height: 50)
        }
    }
}

struct SuggestedCoursesCellView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedCoursesCellView()
    }
}
