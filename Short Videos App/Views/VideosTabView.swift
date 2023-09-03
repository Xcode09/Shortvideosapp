//
//  VideosTabView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 27/08/2023.
//

import SwiftUI

struct VideosTabView: View {
    @State private var videoTapped = false
    @State private var videoSheetitems : VideoTabViewSheetItems?
    let column = [GridItem(.flexible(),spacing: 5),GridItem(.flexible(),spacing: 5)]
    var body: some View {
        VStack(spacing:20){
            headerView
            ScrollView(showsIndicators: false){
                VStack(spacing:30){
                    trendingSection
    //                    .padding(.vertical,5)
    //                    .padding(.horizontal,10)
                    
                    newVideosSection
    //                    .padding(.vertical,5)
    //                    .padding(.horizontal,2)
                    
                    suggestCourses
    //                    .padding(.vertical,5)
    //                    .padding(.horizontal,2)
                    myCollectionView
                        .onTapGesture {
                            videoSheetitems = .myCollectionsTapped
                        }
    //                    .padding(.vertical,5)
    //                    .padding(.horizontal,2)
                    
                    onlineTutors
    //                    .padding(.vertical,5)
    //                    .padding(.horizontal,2)
                    
                    followingSection
    //                    .padding(.vertical,10)
    //                    .padding(.horizontal,2)
                }
                .padding(10)
                .frame(width:UIScreen.main.bounds.width)
            }
        }
        .fullScreenCover(item: $videoSheetitems, content: { item in
            switch item {
            case .videoTapped:
                VideoPlayView()
               .navigationBarHidden(true)
            case .settingTapped:
                SearchVideosFilterView()
            case .myCollectionsTapped:
                MyCollectionsView()
            case .courseDetailView:
                CourseDetailView()
            }
        })

        
    }
    
    var headerView:some View {
        HStack(spacing:10){
            Spacer()
            Text("120 Pts")
                .foregroundColor(Color.init(hex: MyColors.pointsColor))
                .padding(10)
                .boldFont()
                .minimumScaleFactor(0.7)
                .frame(width: 100,height: 56)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: MyColors.pontsRectangleColor))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(5)
                .boldFont()
                .minimumScaleFactor(0.5)
                .frame(width:56,height: 56)
                .multilineTextAlignment(.center)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#0099A0"))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(5)
                .boldFont()
                .minimumScaleFactor(0.5)
                .frame(width:56,height: 56)
                .multilineTextAlignment(.center)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#6A6070"))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(5)
                .boldFont()
                .frame(width:56,height: 56)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                
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
        .padding(.horizontal,10)
        .frame(height: 66)
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
                            .onTapGesture {
                                videoSheetitems = .videoTapped
                                print("Did Tap Video")
                            }

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
            VStack(spacing: 20){
                VStack(alignment:.leading){
                    Text("Suggested Courses")
                        .boldFont()
                        .foregroundColor(.init(hex: "#BB98DE"))
                        .padding()
                    
                    HStack(spacing:10){
                        TagView(text: "Mathematics")
                        
                        TagView(text: "Mathematics")
                        
                        TagView(text: "Mathematics")
                    }
                    
                    
                    
                    HStack(spacing:10){
                        
                        TagView(text: "Year 7",backgroundColor: "#01024D")

                        
                        TagView(text: "Year 8",backgroundColor: "#01024D")
                        
                        TagView(text: "Year 9",backgroundColor: "#01024D")
                        
                        Spacer()
                        
                        Button {
                            videoSheetitems = .settingTapped
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
                .padding(.horizontal,10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(colors: [.init(hex: "#01024D"),.init(hex: "#030329")], startPoint: .top, endPoint: .bottom))
                }
                
                Spacer().frame(height: 20)
                
                LazyVGrid(columns: column,spacing:30) {
                    ForEach(0..<4) { _ in
                        SuggestedCoursesCellView()
                            .frame(maxHeight:180)
                    }
                    
                }
                .padding(.horizontal,10)
                
                CardOffSetButton(title: "More Courses", offSetY: 30) {
                    videoSheetitems = .courseDetailView
                }
                
            }
            //.padding()
            //.frame(maxHeight:300)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#01024D"))
            }
//            .overlay(alignment:.bottom) {
//
//            }
        }
    }
    
    
    var myCollectionView:some View{
        VStack(alignment:.leading){
            
            HStack(spacing: 10){
                Text("My Collections")
                    .boldFont()
                
                Image("bookmark")
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#19266C"))
            }
            
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<8) { index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [.init(hex: "#F38D70"),.init(hex: "#0F121C")], startPoint: .top, endPoint: .bottom))
                                .frame(width: 160,height: 200)
                            
                            VStack{
                                Text("Collection Name")
                                    .boldFont()
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                Spacer()
                                
                                Text("12")
                                    .boldFont()
                                    .padding(.vertical,5)
                                    .padding(.horizontal)
                                    .background {
                                        Color.init(hex: "#F38D70")
                                    }
                                    .cornerRadius(20)
                            }
                            .padding()
                            
                        }
                        .frame(width: 160,height: 200)
                    }
                }

            }
        }
        .foregroundColor(.white)
        .padding([.vertical,.horizontal])
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: "#01024D"))
        }
    }
    
    var onlineTutors:some View
    {
        ZStack{
            VStack{
                Spacer()
                LazyVGrid(columns: column,spacing: 24) {
                    ForEach(0..<4) { _ in
                        ProfileCardView()
                            .frame(maxWidth: .infinity,maxHeight:235)
                    }

                }
                .padding(10)
                
                CardOffSetButton(title: "Online Tutors", offSetY: 20)
                
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#01024D"))
            }
            
        }
        
    }
    
    var followingSection:some View
    {
        ZStack{
            VStack{
                Spacer()
                LazyVGrid(columns: column,spacing: 24) {
                    ForEach(0..<4) { _ in
                        ProfileCardView()
                            .frame(maxWidth: .infinity,maxHeight:235)
                    }

                }
                .padding(10)
                
                CardOffSetButton(title: "Following 123", offSetY: 20)
                
            }
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


