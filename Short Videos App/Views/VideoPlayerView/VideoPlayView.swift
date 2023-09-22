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
                Color.black.ignoresSafeArea()
                
                Player(shouldPlay: true,player: .init(url: .init(string: dummyURL)!))
                    //.ignoresSafeArea()
                    .frame(height:UIScreen.main.bounds.height * 0.75)
//                    .overlay(alignment:.bottom){
//                        Color.clear.background(.ultraThinMaterial)
//                            .frame(height:20)
//                    }
                    .onTapGesture {
                        showQuiz.toggle()
                    }
//                Color.red
//                    .frame(height:UIScreen.main.bounds.height * 0.85)
//                    .overlay(alignment:.bottom){
//                        Color.clear.background(.ultraThinMaterial)
//                            .frame(height:20)
//                    }
                
                
                VStack {
                    VideoPlayHeaderView()
                        .frame(height: 90)
                        .offset(y:-10)
                        
                            
                            
                    Spacer()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            LikeFollowButtonsView()
                                .offset(x:10,y:10)
                            
                        
                        }
                    }
                
                    
                    VStack (spacing: 0){
                        VideoPlayFooterView()
                        VideoDetailView(videoTitle: "Video title in less than 30char", videoDescription: "Short description that summarize the video in less than 90 characters over two lines",isPlaylistTapped: $isPlaylistTapped)
                        
                    }
                    .overlay(alignment:.topLeading){
                        if isPlaylistTapped{
                            VideoPlaylistView(isPlaylistTapped: $isPlaylistTapped)
                                .frame(width:UIScreen.main.bounds.width * 0.8,height: UIScreen.main.bounds.height * 0.4)
                                .offset(y:-UIScreen.main.bounds.height * 0.45)
                        }
                    }
                    .offset(y:15)
                    .background(.ultraThinMaterial)
                    
                }
                
                
                
            }
            
            .sheet(isPresented: $showQuiz) {
                QuizeView()
                    .presentationDetents([.fraction(0.9)])
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
