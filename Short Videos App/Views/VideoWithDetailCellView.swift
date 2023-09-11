//
//  VideoWithDetailCellView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 01/09/2023.
//

import SwiftUI

struct VideoWithDetailCellView: View {
    var body: some View {
        VStack{
            HStack{
                
                RoundedRectangle(cornerRadius: 10)
                    .fill((LinearGradient(colors: [.init(hex: "#585353"),.init(hex: "#0B0B0B")], startPoint: .top, endPoint: .bottom)))
                    .frame(width: 75,height: 110)
                
//                    .frame(width: 75, height: 110)
//                        .fill((LinearGradient(colors: [.init(hex: "#585353"),.init(hex: "#0B0B0B")], startPoint: .top, endPoint: .bottom)))// Set the width and height
                            
                
                VStack(alignment:.leading){
                    Text("1. Lesson title over 2 lines 2nd line")
                        .foregroundColor(.white)
                        .boldFont()
                    
                    HStack(spacing:24){
                        VStack(spacing:8){
                            Text("1:23")
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Bold", size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            Text("min")
                                
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Bold", size: 6))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                                
                        }
                        .padding(5)
                        .frame(width:52,height:34)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.init(hex: "#2A2C67"))
                        }
                        
                        
                        VStack(spacing:8){
                            Image("visibility_fill")
                                .resizable()
                                .frame(width:14,height:12)
                            
                            Text("Viewed")
                                //.frame(width:12)
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Bold", size: 6))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                        .padding(5)
                        .frame(width:52,height:34)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.init(hex: "#2A675B"))
                        }
                        
                        VStack(spacing:8){
                            HStack{
                                Image("library_add_check")
                                    .resizable()
                                    .frame(width:12)
                                
                                Text("2/3")
                                    .foregroundColor(.white)
                                    .font(.custom("Nunito-Bold", size: 9))
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.3)
                            }
                            
                            Text("Quizes")
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Regular", size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.3)
                            
                        }
                        .padding(5)
                        .frame(width:52,height:34)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.init(hex: "#2A675B"))
                        }
                    }
                    
                    
                    
                    
                    Text("120 Points")
                        .foregroundColor(.white)
                        .boldFont()
                }
//                .frame(maxWidth:.infinity)
                
                Spacer()
                
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.init(hex: "#040638"))
        }
    }
}

struct VideoWithDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        VideoWithDetailCellView()
    }
}
