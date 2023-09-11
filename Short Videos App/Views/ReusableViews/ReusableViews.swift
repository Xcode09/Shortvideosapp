//
//  ReusableViews.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 31/08/2023.
//

import Foundation
import SwiftUI

struct BackgroundView:View{
    var body: some View {
        LinearGradient(colors: [.init(hex: MyColors.linearGradient3),.init(hex: MyColors.linearGradient4)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct CardOffSetButton:View{
    let title:String
    var offSetY:CGFloat = 30
    var colors : [Color] = [.init(hex: "#4C00A5"),.init(hex: "#260053")]
    var actionCall:(()->Void)?
    var width : CGFloat = 200
    var body: some View {
        Button {
            actionCall?()
        } label: {
            VStack(alignment:.center){
                Text(title)
                    .boldFont()
                    //.foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .frame(maxWidth:width,maxHeight:46,alignment:.center)
                    .background {
                        RoundedRectangle(cornerRadius: 40)
                            .strokeBorder(Color.black,lineWidth: 4)
                            .background(RoundedRectangle(cornerRadius: 40).fill(LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)))

                    }
            }

        }
        .offset(y:offSetY)
    }
}



struct StatView: View {
    let value: String
    let title: String
    var color:String = "#321C5C"
    var body: some View {
        VStack(spacing:5){
            Text(value)
                .foregroundColor(.white)
                .font(.custom("Nunito-SemiBold", size: 10))
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
            
            Text(title)
                .foregroundColor(.white)
                .font(.custom("Nunito-Bold", size: 12))
                .lineLimit(4)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
        }
        .padding(5)
        .frame(maxWidth:50,maxHeight: 50)
        .background(content: {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(hex: color))
                .shadow(color: .black.opacity(0.5), radius: 10)
        })
    }
}

struct NavigationBackButton:View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            // Action to perform when button is tapped
            print("Button tapped")
            presentationMode.wrappedValue.dismiss()

        }) {
            Image("back")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20) // Adjust the size as needed
                .padding()
                .background(Color.init(hex: "#A890FF"))
                
                .clipShape(Circle()) // Clip the button and its background to a circle
        }
    }
}

struct TagView: View {
    let text: String
    var backgroundColor : String = "#FFA5A5"
    var body: some View {
        Text(text)
            .font(.custom("Nunito-ExtraBold", size: 12))
            .lineLimit(0)
            .minimumScaleFactor(0.5)
            .padding(.vertical, 10)
            .padding(.horizontal,10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(Color.black, lineWidth: 4)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(hex: backgroundColor)))
            )
    }
}
