//
//  MatchQuizView.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 30/09/2023.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers
struct MatchQuizView: View {
    @State private var selectedTarget: Int = 0
    @State private var selectedSource: Int = 3
    @State private var isConnected = false
    
    @State private var targetCGPoint: CGPoint = .zero
    @State private var sourceCGPoint: CGPoint = .zero
    
    var body: some View {
        
        ZStack {
            if isConnected {
                getPath()
            }
//            VStack {
//                HStack {
//                    ForEach(0..<6) { index in
//                        GeometryReader { geo in
//                        Text("Target \(index)")
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(selectedTarget == index ? Color.red : Color.black)
//                            .onTapGesture {
//                                let size = geo.size
//                                targetCGPoint = CGPoint(x: geo.frame(in: .global).origin.x + (size.width / 2), y: geo.frame(in: .global).origin.y)
//                                print("Target Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
//                                selectedTarget = index
//                            }
//                        }
//                    }
//                }
//
//                // Removed list for demo
//                Spacer()
//
//                HStack {
//                    ForEach(0..<6) { index in
//                        GeometryReader { geo in
//                            Text("Source \(index)")
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(selectedSource == index ? Color.orange : Color.black)
//                                .onTapGesture {
//                                    let size = geo.size
//                                    sourceCGPoint = CGPoint(x: geo.frame(in: .global).origin.x + (size.width / 2), y: geo.frame(in: .global).origin.y)
//                                    print("Source Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
//                                    selectedSource = index
//                                }
//                        }
//
//                    }
//                }
//                Button(isConnected ? "CUT" : "CONNECT") {
//                    isConnected.toggle()
//                }
//                .padding()
//            }
            VStack{
                HStack {
                    VStack {
                        ForEach(0..<6) { index in
                            GeometryReader { geo in
                            Text("Target \(index)")
                                .padding()
                                .foregroundColor(.white)
                                .background(selectedTarget == index ? Color.red : Color.black)
                                .onTapGesture {
                                    let size = geo.size
                                    targetCGPoint = CGPoint(x: geo.frame(in: .global).origin.x + (size.width / 3), y: geo.frame(in: .global).origin.y + (-10))
                                    
                                    print("Target Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                                    selectedTarget = index
                                }
                            }
                        }
                    }
                    
                    VStack {
                                        ForEach(0..<6) { index in
                                            GeometryReader { geo in
                                                Text("Source \(index)")
                                                    .padding()
                                                    .foregroundColor(.white)
                                                    .background(selectedSource == index ? Color.orange : Color.black)
                                                    .onTapGesture {
                                                        let size = geo.size
                                                        sourceCGPoint = CGPoint(x: geo.frame(in: .global).origin.x, y: geo.frame(in: .global).origin.y)
                                                        print("Source Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                                                        selectedSource = index
                                                    }
                                            }
                                            
                                        }
                        }
                }
                
                Button(isConnected ? "CUT" : "CONNECT") {
                    isConnected.toggle()
                }
                .padding()
            }
            
        }
        
    }
    
    func getPath() -> some View {
        Path { path in
            let controlPoint = CGPoint(x: 40, y: 100)
            
            path.move(to: sourceCGPoint)
            
            path.addQuadCurve(to: targetCGPoint, control: controlPoint)
            
            path.addLine(to: targetCGPoint)
            
            //path.addCurve(to: sourceCGPoint, control1: targetCGPoint, control2: targetCGPoint)
//                path.addArc(center: CGPoint(x:proxy.size.width/4, y:proxy.size.height/4), radius: 300, startAngle: .zero, endAngle: .degrees(.pi), clockwise: true)
        }
        .stroke(Color.blue, lineWidth: 3)
        
    }
}

struct Anse:Codable,Identifiable,Hashable,Transferable{
    var id = UUID().uuidString
    let question:String
    var answer:String
    var isShow:Bool = false
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .fillInBlanks)
    }
    
}

extension UTType{
    static let fillInBlanks = UTType(exportedAs: "co.ali.fillInBlanks")
}

let data = [Anse(question: "Hello Hello Hello", answer: "Chawal"),Anse(question: "Hello", answer: "Chawal"),Anse(question: "Hello", answer: "Chawal"),Anse(question: "Hello,Hello,Hello", answer: "Chawal"),Anse(question: "Hello", answer: "Chawal")]


struct fillint:View{
    var body: some View {
        ScrollView {
            FlexibleView(availableWidth: UIScreen.main.bounds.width - 0, data: data, spacing: 5, alignment: .leading) { item in
                HStack{
                    Text(item.question)
                        //.frame(maxWidth:300)
                    
                    Text(item.answer)
                        .overlay {
                            RoundedBackgroundView(backgroundColor: .white)
                        }
                }
            }
        }
       
    }
}


struct MatchQuizView_Previews: PreviewProvider {
    static var previews: some View {
        fillint()
    }
}

