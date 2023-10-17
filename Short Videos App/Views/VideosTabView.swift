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
    @State private var scrollPosition: CGPoint = .zero
    
    @State private var scrollPositionVideoSection: CGPoint = .zero
    
    @State private var scrollPositionMyCollectionView: CGPoint = .zero
    
    
    let column = [GridItem(.flexible(),spacing: 5),GridItem(.flexible(),spacing: 5)]
    
    init() {
        let appearance = UINavigationBarAppearance()

        //appearance.backgroundEffect = // error right here
        
        appearance.backgroundEffect = UIBlurEffect(style: .dark)

        UINavigationBar.appearance().standardAppearance = appearance
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack(spacing:30){
                    trendingSection
                        .padding(.horizontal,scrollPosition.x <= -30 ? -25 : 0)
                    
                    newVideosSection
                        .padding(.horizontal,scrollPositionVideoSection.x <= -30 ? -25 : 0)
   
                    suggestCourses

                    myCollectionView
                        .padding(.top,viewPadding)
                        .padding(.horizontal,scrollPositionMyCollectionView.x <= -30 ? -25 : 0)
                        .onTapGesture {
                            videoSheetitems = .myCollectionsTapped
                        }
 
                    onlineTutors
                        
                        
   
                    followingSection
                        .padding(.top,viewPadding)
                    
                    Spacer()
                        .frame(height:80)
                }
                .padding(viewPadding)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    headerView
                    
                }
            })
            .background(content: {
                BackgroundView()
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
                case .onlineTutors:
                    TeacherProfileView()
                case .following:
                    FollowingView()
                }
            })
        }
        

        
    }
    
    var headerView:some View {
        HStack(spacing:10){
            
            Spacer().frame(width:viewPadding)
            
            Text("1250 Pts")
                .foregroundColor(Color.init(hex: MyColors.pointsColor))
                .padding(viewPadding)
                .frame(width: 134,height: 36)
                .font(.custom("Nunito-Bold", size: 22))
                //.minimumScaleFactor(0.7)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.init(hex: MyColors.pontsRectangleColor))
                }
            
            VStack(spacing:-4){
                Text("50")
                    .foregroundColor(Color.init(hex: "#78F0B9"))
                    .font(.custom("Nunito-Bold", size: 13))
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    
                VStack(spacing:-3){
                    Text("Daily")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
    //                    .lineLimit(2)
    //                    .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    Text("Bouns")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
    //                    .lineLimit(2)
    //                    .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                }
                
                    
            }
            .frame(width:45,height: 36)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.init(hex: "#0099A0"))
            }
            
            
            VStack(spacing:-4){
                Text("100")
                    .foregroundColor(Color.init(hex: "#78F0B9"))
                    .font(.custom("Nunito-Bold", size: 13))
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    
                
                VStack(spacing:-3){
                    Text("Watch")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    Text("3 videos")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                }
                    
            }
            .frame(width:45,height: 36)
            .background {
                RoundedRectangle(cornerRadius:8)
                    .fill(Color.init(hex: "#6A6070"))
            }
            
            VStack(spacing:-4){
                Text("150")
                    .foregroundColor(Color.init(hex: "#78F0B9"))
                    .font(.custom("Nunito-Bold", size: 13))
                    //.minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    
                VStack(spacing:-3){
                    Text("Complete")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    
                    Text("5 Quizes")
                        .foregroundColor(Color.init(hex: "#78F0B9"))
                        .font(.custom("Nunito-Bold", size: 7))
                        //.minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                }
                    
            }
            .frame(width:45,height: 36)
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
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    
                    .frame(width:20,height:20)
                    .scaledToFit()
                    .background {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width:36,height:36)
                            
                    }
                
            }
            //.padding(viewPadding)
            Spacer()
            
        }
        .padding(.all,5)
       
    }
    
    var trendingSection:some View {
        VStack(alignment:.leading){
            
            HStack(spacing: stackPadding){
                Text("Trending")
                    
                    .boldFont()
                
                Image("trending_up_fill")
                    
            }
            .padding(viewPadding)
            
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#46196C"))
            }
            .offset(x:scrollPosition.x <= -30 ? 25 : 0)
            
            .onTapGesture {
                videoSheetitems = .trendingTapped
            }
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:viewPadding){
                    ForEach(0..<16,id:\.self) { index in
                        VideoSmallCell()
                            .frame(width:130,height: 160)
                            .onTapGesture {
                                videoSheetitems = .videoTapped
                                print("Did Tap Video")
                            }
                            .background {
                                GeometryReader {
                                    geometry in
                                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                                }
                                
                            }
                            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                debugPrint("Scroll",value.x)
                                
                                withAnimation {
                                    self.scrollPosition = value
                                }
                                
                            }

                    }
                }
//                .onChange(of: proxy.frame(in: .global).midY) { newValue in
//                    debugPrint("Scroll View",newValue)
//                }
               

            }
            .coordinateSpace(name: "scroll")
        }
        .foregroundColor(.white)
        .padding(viewPadding)
        .customRoundedRectangle(borderWidth:2,backgroundColor: Color.init(hex:"#452F57"))
        
    }
    
    var newVideosSection:some View {
        VStack(alignment:.leading){
            
            HStack(spacing: stackPadding){
                Text("New Videos")
                    
                    .boldFont()
                
                Image("hot")
                    
            }
            .padding(viewPadding)
            
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#19266C"))
            }
            .offset(x:scrollPositionVideoSection.x <= -30 ? 25 : 0)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:viewPadding){
                    ForEach(0..<8) { index in
                        VideoSmallCell()
                            .frame(width:130,height: 160)
                            .background {
                                GeometryReader {
                                    geometry in
                                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                                }
                                
                            }
                            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                debugPrint("Scroll",value.x)
                                
                                withAnimation {
                                    self.scrollPositionVideoSection = value
                                }
                                
                            }
                    }
                }

            }
            .coordinateSpace(name: "scroll")
        }
        .foregroundColor(.white)
        .padding(viewPadding)
        .customRoundedRectangle(borderWidth:2,backgroundColor: Color.init(hex:"#202B5C"))
    }
    
    var suggestCourses:some View {
        ZStack {
            VStack(spacing: stackPadding){
                VStack{
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Suggested Courses")
                            .boldFont()
                            .foregroundColor(.init(hex: "#BB98DE"))

                        HStack {
                            TagView(text: "Mathematics")
                                .foregroundColor(.black)

                            TagView(text: "Biology",backgroundColor: "#8BFCC4")
                                .foregroundColor(.black)

                            TagView(text: "Physics",backgroundColor: "#8BBEFC")
                                .foregroundColor(.black)
                        }
                        
                        HStack {
                            TagView(text: "Year 7", backgroundColor: "#01024D")
                            TagView(text: "Year 8", backgroundColor: "#01024D")
                            TagView(text: "Year 9", backgroundColor: "#01024D")
                            
                            Spacer() // Add spacer to push the button to the right

                            Button(action: {
                                videoSheetitems = .settingTapped
                            }) {
                                ZStack {
                                    Image("Rectangle 1233")
                                        .resizable()
                                        .frame(width: 50, height: 50) // Adjust the size as needed

                                    Image(systemName: "gearshape.fill")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 50, height: 50) // Match the button's size

                        }
                        .foregroundColor(.white)
                    }
                    .padding(viewPadding)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black,lineWidth:2)
                            .background(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(colors: [.init(hex: "#01024D"), .init(hex: "#030329")], startPoint: .top, endPoint: .bottom))
                            })
                    )
                }
                .padding(viewPadding) // Add padding to the VStack
                .frame(maxWidth: .infinity, alignment: .leading) // Ensure the VStack takes full width

                
                Spacer().frame(height: 10)
                
                LazyVGrid(columns: column,spacing:40) {
                    ForEach(0..<4) { _ in
                        SuggestedCoursesCellView()
//                            /.frame(width:140,height:180)
                    }
                    
                }
                .padding(.horizontal,viewPadding)
                
//                CardOffSetButton(title: "More Courses", offSetY: 20) {
//                    videoSheetitems = .courseDetailView
//                }
                Spacer().frame(height:viewPadding+viewPadding)
            }
            .overlay(alignment:.bottom,content: {
                CardOffSetButton(title: "More Courses", offSetY: 20) {
                    videoSheetitems = .courseDetailView
                }
            })
            .customRoundedRectangle(borderWidth:2,backgroundColor: Color.init(hex: "#01024D"))
        }
    }
    
    
    var myCollectionView:some View{
        VStack(alignment:.leading,spacing: viewPadding){
            
            HStack(spacing: stackPadding){
                Text("My Collections")
                    
                    .boldFont()
                
                Image("bookmark")
            }
            .padding(viewPadding)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(hex: "#19266C"))
            }
            .offset(x:scrollPositionMyCollectionView.x <= -30 ? 25 : 0)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:viewPadding){
                    ForEach(0..<8) { index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(LinearGradient(colors: [.init(hex: "#F38D70"),.init(hex: "#0F121C")], startPoint: .top, endPoint: .bottom))
                                //.frame(width: 140,height: 200)
                            
                            VStack{
                                Text("Collection name")
                                    .frame(width:70)
                                    .foregroundColor(.black)
                                    .font(.custom("Nunito-Bold", size: 12))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                Spacer()
                                
                                Text("12")
                                    .foregroundColor(.black)
                                    .font(.custom("Nunito-Bold", size: 15))
                                    .padding(.vertical,2)
                                    .padding(.horizontal)
                                    .background {
                                        Color.init(hex: "#F38D70")
                                    }
                                    .cornerRadius(capsuleCornerRadiusValue)
                            }
                            .padding(viewPadding)
                            
                        }
                        .frame(width:130,height: 160)
                        .background {
                            GeometryReader {
                                geometry in
                                Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                            }
                            
                        }
                        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                            debugPrint("Scroll",value.x)
                            
                            withAnimation {
                                self.scrollPositionMyCollectionView = value
                            }
                            
                        }
                    }
                }

            }
            .coordinateSpace(name: "scroll")
        }
        .foregroundColor(.white)
        .padding(viewPadding)
        .customRoundedRectangle(borderWidth: 2,backgroundColor: Color.init(hex: "#01024D"))
    }
    
    var onlineTutors:some View
    {
        ZStack{
            VStack(spacing:20){
                //Spacer()
                LazyVGrid(columns: column,spacing: 30) {
                    ForEach(0..<4) { _ in
                        ProfileCardView()
                            .onTapGesture {
                                videoSheetitems = .onlineTutors
                            }
                    }

                }
                .padding(viewPadding)
                
                Spacer().frame(height: viewPadding+viewPadding)
                
            }
            .overlay(alignment:.bottom){
                CardOffSetButton(title: "Online Tutors", offSetY: 20)
            }
            .customRoundedRectangle(borderWidth:2,backgroundColor: Color.init(hex: "#01024D"))
            
            
        }
        
    }
    
    var followingSection:some View
    {
        ZStack{
            VStack{
                //Spacer()
                LazyVGrid(columns: column,spacing: 30) {
                    ForEach(0..<4) { _ in
                        ProfileCardView()
    
                    }

                }
                .padding(viewPadding)
                
                Spacer().frame(height: 40)
                
            }
            .overlay(alignment:.bottom,content: {
                CardOffSetButton(title: "Following 123", offSetY: 20) {
                    videoSheetitems = .following
                }
            })
            .customRoundedRectangle(borderWidth:2,backgroundColor: Color.init(hex: "#01024D"))
            
        }
        
    }
    
}

struct VideosTabView_Previews: PreviewProvider {
    static var previews: some View {
        VideosTabView()
    }
}



struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
