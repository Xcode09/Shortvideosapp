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
        NavigationStack {
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
                .offset(y:46)
            }
            .background {
                BackgroundView()
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    headerView
                    
                }
            })
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
                case .trendingTapped:
                    TrendingVideosCollectionView()
                }
            })
        }
        

        
    }
    
    var headerView:some View {
        HStack(spacing:10){
            Spacer()
            Text("120 Pts")
                .foregroundColor(Color.init(hex: MyColors.pointsColor))
                .padding(10)
                .font(.custom("Nunito-Bold", size: 12))
                //.minimumScaleFactor(0.7)
                .frame(width: 100,height: 40)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.init(hex: MyColors.pontsRectangleColor))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(5)
                .font(.custom("Nunito-Bold", size: 12))
                .minimumScaleFactor(0.5)
                .frame(width:46,height: 40)
                .multilineTextAlignment(.center)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.init(hex: "#0099A0"))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(5)
                .font(.custom("Nunito-Bold", size: 12))
                .minimumScaleFactor(0.5)
                .frame(width:46,height: 40)
                .multilineTextAlignment(.center)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.init(hex: "#6A6070"))
                }
            
            Text("50\nDaily Bouns")
                .foregroundColor(Color.init(hex: "#78F0B9"))
                .padding(5)
                .font(.custom("Nunito-Bold", size: 12))
                .frame(width:46,height: 40)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                
                .background {
                    RoundedRectangle(cornerRadius:8)
                        .fill(Color.init(hex: "#6A6070"))
                }
            
            Spacer()
            
            Button {
                //
            } label: {
                Image("search")
                    .resizable()
                    .frame(width:26,height:26)
                    .scaledToFit()
                    .background {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width:40,height:40)
                            
                    }
                
            }
            .padding(10)

            
        }
        .padding(.horizontal,5)
        .frame(height: 46)
    }
    
    var trendingSection:some View {
        VStack(alignment:.leading){
            
            HStack(spacing: 5){
                Text("Trending")
                    .padding(10)
                    .boldFont()
                
                Image("trending_up_fill")
                    .padding(10)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#46196C"))
            }
            
            .onTapGesture {
                videoSheetitems = .trendingTapped
            }
            
            ScrollView(.horizontal) {
                HStack(spacing:10){
                    ForEach(0..<8) { index in
                        VideoSmallCell()
                            .frame(width:104,height: 136)
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
            
            HStack(spacing: 5){
                Text("New Videos")
                    .padding(10)
                    .boldFont()
                
                Image("hot")
                    .padding(10)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#19266C"))
            }
            
            ScrollView(.horizontal) {
                HStack(spacing:10){
                    ForEach(0..<8) { index in
                        VideoSmallCell()
                            .frame(width:104,height: 136)
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
                            .foregroundColor(.black)
                        
                        TagView(text: "Biology")
                            .foregroundColor(.black)
                        
                        TagView(text: "Physics")
                            .foregroundColor(.black)
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
                
                Spacer().frame(height: 10)
                
                LazyVGrid(columns: column,spacing:40) {
                    ForEach(0..<4) { _ in
                        SuggestedCoursesCellView()
//                            /.frame(width:140,height:180)
                    }
                    
                }
                .padding(.horizontal,10)
                
                CardOffSetButton(title: "More Courses", offSetY: 20) {
                    videoSheetitems = .courseDetailView
                }
            }

            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#01024D"))
            }
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
                HStack(spacing:10){
                    ForEach(0..<8) { index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(LinearGradient(colors: [.init(hex: "#F38D70"),.init(hex: "#0F121C")], startPoint: .top, endPoint: .bottom))
                                //.frame(width: 140,height: 200)
                            
                            VStack{
                                Text("Collection Name")
                                    .foregroundColor(.black)
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
                        .frame(width: 120,height: 160)
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
                LazyVGrid(columns: column,spacing: 30) {
                    ForEach(0..<4) { _ in
                        ProfileCardView()
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
                LazyVGrid(columns: column,spacing: 30) {
                    ForEach(0..<4) { _ in
                        ProfileCardView()
    
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


