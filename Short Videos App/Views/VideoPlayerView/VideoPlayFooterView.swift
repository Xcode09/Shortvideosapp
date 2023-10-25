//
//  VideoPlayFooterView.swift
//  Short Videos App
//
//  Created by Everything Apple on 29/08/2023.
//

import SwiftUI

struct VideoPlayFooterView: View {

    var body: some View {
        ZStack{
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 5) {
                        Text("Geometry")
                            .font(.custom("Nunito-Bold", size: 10))
                            .padding(6)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: cornerRadiusValue,style: .continuous)
                                    .fill(.ultraThinMaterial)
                            }
//                            //.environment(\.colorScheme, .light)
//                            .cornerRadius(5, corners: .allCorners)
                        Text("Algebra")
                            .font(.custom("Nunito-Bold", size: 10))
                            .padding(6)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: cornerRadiusValue,style: .continuous)
                                    .fill(.ultraThinMaterial)
                            }
//                            .environment(\.colorScheme, .light)
//                            .cornerRadius(5, corners: .allCorners)

                        Text("Probability")
                            .font(.custom("Nunito-Bold", size: 10))
                            .padding(6)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: cornerRadiusValue,style: .continuous)
                                    .fill(.ultraThinMaterial)
                            }
//                            .environment(\.colorScheme, .light)
//                            .cornerRadius(5, corners: .allCorners)

                    }
                       }
                       
                       Spacer()
                   }
            .padding(.horizontal)
            
        }
////        .applyBlur()
//        .background {
//            Rectangle()
//                .fill(.ultraThinMaterial)
//                .offset(y:13)
//                //.environment(\.colorScheme, .light)
//        }
        
    }
}

struct VideoPlaylistView:View
{
    @Binding var isPlaylistTapped:Bool
    var body:some View{
        VStack(alignment:.leading){
            HStack{
                VStack{
                    Text("Course Name")
                        .font(.custom("Nunito-Bold", size: 14))
                        .foregroundColor(.init(hex: "#439693"))
                    Text("+34k Students")
                        .font(.custom("Nunito-Bold", size: 14))
                        .foregroundColor(.init(hex: "#439693"))
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        isPlaylistTapped.toggle()
                    }
                    
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                    
                }

            }
            .padding(10)
            ScrollView{
                VStack(alignment:.leading,spacing:0){
                    ForEach(0..<4) { _ in
                        HStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill((LinearGradient(colors: [.init(hex: "#585353"),.init(hex: "#0B0B0B")], startPoint: .top, endPoint: .bottom)))
                                .frame(width:60,height: 60)
                            VStack(alignment:.leading){
                                Text("1 - Video title up to 30 characters")
                                    .padding(10)
                                    .font(.custom("Nunito-Bold", size: 14))
                                    .foregroundColor(.init(hex: "#439693"))
                                
                                HStack{
                                    Image("library_add_check")
                                        .resizable()
                                        .frame(width:14,height:14)
                                    
                                    Text("2/3")
                                        .foregroundColor(.white)
                                        .font(.custom("Nunito-Bold", size: 9))
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.3)
                                    
                                    Spacer()
                                }
                            }
                            
                            
                            
                        }
                        .padding(10)
                    }
                }
            }
            
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10,style: .continuous))
//        .environment(\.colorScheme, .light)
    }
}

struct VideoPlayFooterView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayFooterView()
    }
}


// MARK: - Video Title & Description View
struct VideoDetailView: View {
    var videoTitle: String
    var videoDescription: String
    @Binding var isPlaylistTapped:Bool
    var body: some View {
        VStack(alignment: .leading,spacing: -5) {
            Text(videoTitle)
                .font(.custom("Nunito-Bold", size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.horizontal)
            
            HStack {
                Text(videoDescription)
                    .font(.custom("Nunito-regular", size: 14))
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity)
                    .lineSpacing(0)
                
                Spacer()
                
                Button(action: {
//                    withAnimation {
//                        //isPlaylistTapped.toggle()
//                    }
                }) {
                    Image("more")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)
                }
            }
            .padding(.horizontal)
            
        }
    }
}
