//
//  ProfileCardView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 30/08/2023.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        VStack{
            Circle()
                .strokeBorder(Color.green,lineWidth: 4)
                .frame(width:63,height: 63)
                .background {
                    Circle()
                        .fill(Color.init(hex: "#1D5E86"))
                }

            Text("@username")
                .foregroundColor(.white)
                .semiBoldFont()
                .minimumScaleFactor(0.5)

            Text("Firstname Lastname")
                .foregroundColor(.white)
                .semiBoldFont()
                .minimumScaleFactor(0.5)

            HStack{
                TagView(text: "Mathematics")

                TagView(text: "Mathematics")
            }

            HStack{
                StatView(value: "8", title: "Videos")

                StatView(value: "48", title: "Followers")


                StatView(value: "148", title: "Quick Help")


            }
            //.frame(maxWidth:176)
            

        }
        .padding(10)
        //.frame(width:176,height:300)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black,lineWidth: 4)
                .frame(maxWidth: .infinity,maxHeight:.infinity)
                .background(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.init(hex: "#321C5C"))
                })
        }
        .overlay(alignment:.bottom){
            Image("qucik_help")
                .offset(y:20)
        }
    }
}



struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView()
    }
}
