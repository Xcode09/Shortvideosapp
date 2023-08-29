//
//  CustomTabBarView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 25/08/2023.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab = 0
    @State private var tabItems = AppTheme.AppTabTitle.allCases
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                Text("Tab 1 Content")
                    .tag(0)
                Text("Tab 2 Content")
                    .tag(1)
                VideosTabView()
                    .tag(2)
                Text("Tab 4 Content")
                    .tag(3)
                ProfileView()
                    .frame(maxWidth:.infinity,maxHeight:.infinity)
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            HStack(spacing: 0) {
                ForEach(tabItems.indices,id:\.self) { index in
                    Button(action: {
                        selectedTab = index
                    }) {
                        VStack {
                            Image(tabItems[index].title)
                                .foregroundColor(selectedTab == index ? Color.blue : Color.gray)
                                .frame(width: 24, height: 24)
                            Text(tabItems[index].title)
                                .tabItemsFont()
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(selectedTab == index ? Color.init(hex: MyColors.tabBarSecondaryColor) : Color.clear)
                        )
                        
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            //.frame(height: 90)
            .padding()
            .background(Color.init(hex: MyColors.darkPurpleColor))
            .cornerRadius(radius: 10, corners: [.topLeft, .topRight])
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: -2)
        }
        .background(
            selectedTab == 4 ? AnyView( // Apply to Tab 3 content
                LinearGradient(colors: [.init(hex: MyColors.linearGradient1),.init(hex: MyColors.linearGradient2)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(edges: .top)
                                      ) : AnyView(LinearGradient(colors: [.init(hex: MyColors.linearGradient3),.init(hex: MyColors.linearGradient4)], startPoint: .top, endPoint: .bottom)
                                        .ignoresSafeArea(edges: .all)
                                                  
                                                  
                                      )
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}

struct RoundedCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

