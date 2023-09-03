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
                    .fill(LinearGradient(colors: [.init(hex: "#1C1C1C"),.init(hex: "#272727")], startPoint: .top, endPoint: .bottom))
                
                    .frame(width: 140)
                
                VStack(alignment:.leading){
                    Text("Video Title")
                        .foregroundColor(.white)
                        .boldFont()
                    
                    HStack{
                        VStack(spacing:8){
                            Text("1:23")
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Regular", size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            Text("min")
                                
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Regular", size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                
                        }
                        .padding(10)
                        .frame(width:66,height:46)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.init(hex: "#2A2C67"))
                        }
                        
                        
                        VStack(spacing:8){
                            Image("visibility_fill")
                                //.resizable()
                                //.frame(width:12,height:12)
                            
                            Text("Viewed")
                                //.frame(width:12)
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Regular", size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                        .padding(10)
                        .frame(width:66,height:46)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.init(hex: "#2A675B"))
                        }
                        
                        VStack(spacing:8){
                            HStack{
                                Image("library_add_check")
                                    .resizable()
                                    .frame(width:14)
                                
                                Text("2/3")
                                    .foregroundColor(.white)
                                    .font(.custom("Nunito-Regular", size: 12))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.3)
                            }
                            
                            Text("Quizes")
                                .foregroundColor(.white)
                                .font(.custom("Nunito-Regular", size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.3)
                            
                        }
                        .padding(10)
                        .frame(width:66,height:46)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.init(hex: "#2A675B"))
                        }
                    }
                    
                    
                    
                    Text("120 Points")
                        .foregroundColor(.white)
                        .boldFont()
                }
                
                
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: "#040638"))
        }
    }
}

struct VideoWithDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        VideoWithDetailCellView()
    }
}
