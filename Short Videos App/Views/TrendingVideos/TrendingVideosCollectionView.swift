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
                    VStack{
                        LazyVGrid(columns: [.init(.flexible()),.init(.flexible())]) {
                            ForEach(0..<100) { _ in
                                VideoSmallCell()
                                    .frame(height: 200)
                            }
                           
                        }
                    }
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading){
                    Button(action: {
                        // Action to perform when button is tapped
                        print("Button tapped")
                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image("back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20) // Adjust the size as needed
                            .padding()
                            .background(AppColors.customLightGrayColor.opacity(0.5))
                            .clipShape(Circle()) // Clip the button and its background to a circle
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
                        Image("search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20) // Adjust the size as needed
                            .padding()
                            .background(AppColors.customLightGrayColor.opacity(0.5))
                            .clipShape(Circle()) // Clip the button and its background to a circle
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
