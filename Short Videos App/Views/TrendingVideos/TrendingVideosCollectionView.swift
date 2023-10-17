//
//  TrendingVideosCollectionView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 04/09/2023.
//

import SwiftUI

struct TrendingVideosCollectionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundView()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing:0){
                        LazyVGrid(columns: [.init(.flexible(),spacing: 1),.init(.flexible(),spacing: 1)],spacing:1) {
                            ForEach(0..<100) { _ in
                                VideoSmallCell()
                                    .frame(height: 200)
                            }
                           
                        }
                    }
                }
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading){
                    Button(action: {
                        // Action to perform when button is tapped
                        print("Button tapped")
                        presentationMode.wrappedValue.dismiss()

                    }) {
                        
                        ZStack{
                            Circle()
                                .fill(AppColors.customLightGrayColor.opacity(0.5))
                                .frame(width: 40, height: 40)
                            Image("back")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
//                        Image("back")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: 20) // Adjust the size as needed
//                            .padding()
//                            .background(AppColors.customLightGrayColor.opacity(0.5))
//                            .clipShape(Circle()) // Clip the button and its background to a circle
                    }
                }
                
                ToolbarItem(placement:.principal){
                    Text("Trending")
                        .foregroundColor(.white)
                        .font(.custom("Nunito-Bold", size: 24))
                }
                
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action: {
                        // Action to perform when button is tapped
                        print("Button tapped")
                    }) {
                        
                        ZStack{
                            Circle()
                                .fill(AppColors.customLightGrayColor.opacity(0.5))
                                .frame(width: 40, height: 40)
                            Image("search")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
                        
//                        Image("search")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: 20) // Adjust the size as needed
//                            .padding()
//                            .background(AppColors.customLightGrayColor.opacity(0.5))
//                            .clipShape(Circle()) // Clip the button and its background to a circle
                    }
                }
                
            }
            
        }
    }
}

struct TrendingVideosCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingVideosCollectionView()
    }
}
