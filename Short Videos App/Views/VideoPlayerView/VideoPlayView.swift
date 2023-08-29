//
//  VideoPlayView.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI

struct VideoPlayView: View {
    

        var body: some View {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VideoPlayHeaderView()
                            .frame(height: 90)
                            
                            
                    Spacer()
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            LikeFollowButtonsView()
                        }
                    }
                    VStack (spacing: 0){
                                        VideoDetailView(videoTitle: "Video title in less than 30char", videoDescription: "Short description that summarize the video in less than 90 characters over two lines")
                        
                        VideoPlayFooterView()

                    }
                }
            }
        }
}

struct VideoPlayView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayView()
    }
}
