//
//  VideoPlayView.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI
import AVKit
struct VideoPlayView: View {
    @State private var isPlaylistTapped:Bool = false
    @State private var showQuiz = false
        var body: some View {
            ZStack {
//                Color.black.background(.ultraThinMaterial)
//                    .frame(maxWidth: .infinity,maxHeight:.infinity)
//                    //.ignoresSafeArea()
                
                Player(shouldPlay: true,player: .init(url: .init(string: dummyURL)!))
                    //.ignoresSafeArea()
                    .aspectRatio(9/16, contentMode: .fit)
                    //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 16/9)
                    .frame(height:UIScreen.main.bounds.height * 0.85)

////                    .onTapGesture {
////                        showQuiz.toggle()
////                    }
//
////                    .overlay(alignment:.bottom){
////                        VideoPlayFooterView()
////                    }


                VStack {
                    VideoPlayHeaderView()
                        .frame(height: 46)
                        .background {
                            Rectangle()
                                .fill(Color.gray.opacity(0.7))
                                .frame(height:22)
                                .blur(radius: 5)
                                .offset(y:22)
                                //.environment(\.colorScheme, .light)
                        }




                    Spacer()

                    VStack {
                        Spacer()
                        HStack {
                            
                            Spacer()
                            LikeFollowButtonsView()
                                .offset(x:10,y:20)


                        }
                    }

                    Spacer()
                    
                    VStack (spacing: 0){
                        VideoPlayFooterView()
                        VideoDetailView(videoTitle: "Video title in less than 30char", videoDescription: "Short description that summarize the video in less than 90 characters over two lines.",isPlaylistTapped: $isPlaylistTapped)

                    }
                    .overlay(alignment:.topLeading){

                        if isPlaylistTapped{
                            VideoPlaylistView(isPlaylistTapped: $isPlaylistTapped)
                                .padding(.leading,viewPadding)
                                .frame(width:UIScreen.main.bounds.width * 0.85,height: UIScreen.main.bounds.height * 0.55)
                                .offset(y:-UIScreen.main.bounds.height * 0.55)
                        }
                        else{
                            Button {
                                isPlaylistTapped.toggle()
                            } label: {
                                Image("spark_green")
                                    .resizable()
                                    .frame(width:18,height: 18)
                                    .scaledToFit()
                                    
                            }
                            .padding(.horizontal,viewPadding)
                            .padding(.vertical,5)
                            .background(content: {
                                Color(.init(red: 86, green: 127, blue: 119)).opacity(0.7)
                            })
                            .cornerRadius(14, corners: [.topRight,.bottomRight])
                            .offset(y:-50)
                            

                        }
                    }
                    .offset(y:15)
//                    .background {
//                        Rectangle()
//                            .fill(Color.gray.opacity(0.5))
//                            .blur(radius: 1)
//                            .offset(y:22)
//                            .environment(\.colorScheme, .light)
//                    }
                    
                }
                
                
                
            }
            .fullScreenCover(isPresented: $showQuiz) {
                QuizeView()
                    
            }
        }
        
}

struct VideoPlayView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayView()
    }
}


struct Player : UIViewControllerRepresentable {
    var shouldPlay : Bool? = true
    var player : AVPlayer
    var isShowController = false
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let view = AVPlayerViewController()
        
        view.allowsPictureInPicturePlayback = false
        player.automaticallyWaitsToMinimizeStalling = false
        view.player = player
        view.showsPlaybackControls = isShowController
        //view.videoGravity = .re
        
//        if let videoTrack = (self.player.currentItem?.asset.tracks(withMediaType: .video).first) {
//
//            let transformedVideoSize = videoTrack.naturalSize.applying(videoTrack.preferredTransform)
//            let videoIsPortrait = abs(transformedVideoSize.width) < abs(transformedVideoSize.height)
//            if videoIsPortrait {
//                view.videoGravity = .resizeAspectFill
//            } else {
//                view.videoGravity = .resizeAspect
//            }
//        }
       
        
//        let size = self.player.currentItem?.asset.tracks(withMediaType: .video).first?.naturalSize
//        if let tempSize = size {
//            if (tempSize.width == tempSize.height || tempSize.width > tempSize.height){
//                view.videoGravity = .resizeAspect
//            } else {
//                view.videoGravity = .resizeAspectFill
//            }
//        }
        if shouldPlay == true {
            view.player?.play()
        }
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
        
    }
}
