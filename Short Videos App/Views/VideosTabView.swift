//
//  VideosTabView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 27/08/2023.
//

import SwiftUI

struct VideosTabView: View {
    let columns : [GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        VStack{
            headerView
            ScrollView {
                trendingSection
                
                newVideosSection
                
                suggestCourses
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    var headerView:some View {
        HStack(spacing:10){
            Text("120 Pts")
                .foregroundColor(Color.init(hex: MyColors.pointsColor))
                .padding(10)
                .boldFont()
                .minimumScaleFactor(0.7)
                .frame(width: 100)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: MyColors.pontsRectangleColor))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(10)
                .boldFont()
                .minimumScaleFactor(0.5)
                //.frame(width: 30,height: 30)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#0099A0"))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(10)
                .boldFont()
                .minimumScaleFactor(0.5)
                //.frame(width: 30,height: 30)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#6A6070"))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(10)
                .boldFont()
                .minimumScaleFactor(0.5)
                //.frame(width: 30,height: 30)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#6A6070"))
                }
            
            Button {
                //
            } label: {
                Image("search_icon")
            }
            .padding(10)

            
        }
        .frame(height: 56)
    }
    
    var trendingSection:some View {
        VStack(alignment:.leading){
            
            HStack(spacing: 10){
                Text("Trending")
                    .boldFont()
                
                Image("trending_up_fill")
            }
            .background {
                Image("Rectangle 1232")
            }
            
            .padding()
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<8) { index in
                        VideoSmallCell()
                            .frame(maxWidth: 200,maxHeight: 200)
                    }
                }

            }
        }
        .foregroundColor(.white)
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: "#452F57"))
        }
    }
    
    var newVideosSection:some View {
        VStack(alignment:.leading){
            
            HStack(spacing: 10){
                Text("New Videos")
                    .boldFont()
                
                Image("hot")
            }
            .background {
                Image("Rectangle 1232-1")
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<8) { index in
                        VideoSmallCell()
                            .frame(maxWidth: 200,maxHeight: 200)
                    }
                }

            }
        }
        .foregroundColor(.white)
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: "#202B5C"))
        }
    }
    
    var suggestCourses:some View {
        ZStack {
            VStack(alignment:.leading,spacing:20){
                VStack(alignment:.leading){
                    Text("Suggested Courses")
                        .boldFont()
                        .foregroundColor(.init(hex: "#BB98DE"))
                    
                    HStack(spacing:10){
                        Text("Mathematics")
                            .font(.custom("Nunito-ExtraBold", size: 13))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 4)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(hex: "#FFA5A5")))
                            }
                        
                        Text("Physics")
                            .font(.custom("Nunito-ExtraBold", size: 13))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 4)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(hex: "#8BBEFC")))
                            }
                        
                        Text("Biology")
                            .font(.custom("Nunito-ExtraBold", size: 13))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 4)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(hex: "#8BFCC4")))
                            }
                    }
                    
                    
                    
                    HStack(spacing:10){
                        Text("Year 7")
                            .font(.custom("Nunito-ExtraBold", size: 13))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 4)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(hex: "#01024D")))
                            }
                        
                        Text("Year 8")
                            .font(.custom("Nunito-ExtraBold", size: 13))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 4)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(hex: "#01024D")))
                            }
                        
                        Text("Year 9")
                            .font(.custom("Nunito-ExtraBold", size: 13))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 4)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(hex: "#01024D")))
                            }
                        
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            ZStack{
                                Image("Rectangle 1233")
                                
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.black)
                            }
                            
                        }

                    }
                    .foregroundColor(.white)
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(colors: [.init(hex: "#01024D"),.init(hex: "#030329")], startPoint: .top, endPoint: .bottom))
                }
                
                
                Spacer().frame(height:20)
                
                LazyVGrid(columns: columns,spacing:30) {
                    ForEach(0..<4) { _ in
                        SuggestedCoursesCellView()
                            .frame(height:160)
                    }
                }
            }
            .padding()
            //.frame(height:400)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#01024D"))
            }
        }
    }
    
}

struct VideosTabView_Previews: PreviewProvider {
    static var previews: some View {
        VideosTabView()
    }
}
