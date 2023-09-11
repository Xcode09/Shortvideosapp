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
                .font(.custom("Nunito-SemiBold", size: 9))
                .minimumScaleFactor(0.5)

            Text("Firstname Lastname")
                .foregroundColor(.white)
                .font(.custom("Nunito-SemiBold", size: 9))
                .minimumScaleFactor(0.5)

            HStack{
                TagView(text: "Mathematics")
                    .foregroundColor(.black)
                TagView(text: "Mathematics")
                    .foregroundColor(.black)
            }

            HStack{
                StatView(value: "8", title: "Videos")

                StatView(value: "48", title: "Followers")


                StatView(value: "148", title: "Quick Help")


            }
            //.frame(maxWidth:176)
            
            Spacer().frame(height:36)
            
//            Text("Quick Help")
//                .font(.custom("Nunito-Bold", size: 16))
//                .padding(10)
//                .foregroundColor(Color.init(hex: "#00FF4D"))
//                .background {
//                    RoundedRectangle(cornerRadius: 30)
//                        .strokeBorder(Color.black,lineWidth: 4)
//                        .frame(maxWidth: .infinity,maxHeight:.infinity)
//                        .background(content: {
//                            RoundedRectangle(cornerRadius: 30)
//                                .fill(LinearGradient(colors: [Color.init(hex: "#54C998"),Color.init(hex: "#1D6446")], startPoint: .top, endPoint: .bottom))
//                        })
//                }
//                .offset(y:20)

        }
        .padding(10)
        //.frame(width:176,height:300)
        .background {
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(Color.black,lineWidth: 4)
                .frame(maxWidth: .infinity,maxHeight:.infinity)
                .background(content: {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.init(hex: "#321C5C"))
                })
        }
        .overlay(alignment:.bottom){
            HStack{
                Spacer()
                    .frame(width:10)
                
                Text("Quick Help")
                    .font(.custom("Nunito-Bold", size: 16))
                    .padding(10)
                    .frame(alignment:.center)
                    .lineLimit(0)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(Color.init(hex: "#00FF4D"))
                
                Image("spark_green")
                    .resizable()
                    .frame(width:14,height:14)
                    .padding(10)
                    
            }
            .frame(width:136,height:37)
            .background {
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(Color.black,lineWidth: 4)
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .background(content: {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(LinearGradient(colors: [Color.init(hex: "#54C998"),Color.init(hex: "#1D6446")], startPoint: .top, endPoint: .bottom))
                    })
            }
            .offset(y:10)

        }
    }
}



struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView()
    }
}
