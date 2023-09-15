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
//                Color.black
//                    .edgesIgnoringSafeArea(.all)
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
                        
                        VideoPlayFooterView(isPlaylistTapped: $isPlaylistTapped)

                    }
                    .overlay(alignment:.top){
                        if isPlaylistTapped{
                            VideoPlaylistView(isPlaylistTapped: $isPlaylistTapped)
                                .frame(width:UIScreen.main.bounds.width - 20,height: UIScreen.main.bounds.height * 0.4)
                                .offset(y:-UIScreen.main.bounds.height * 0.3)
                        }
                    }
                }
                
                
            }
            .background {
                Player(shouldPlay: true,player: .init(url: .init(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4")!))
                    .ignoresSafeArea()
                    .onTapGesture {
                        showQuiz.toggle()
                    }
            }
            .sheet(isPresented: $showQuiz) {
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
        view.videoGravity = .resizeAspectFill
        
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
