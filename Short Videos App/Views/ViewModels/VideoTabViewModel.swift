//
//  VideoTabViewModel.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 31/08/2023.
//

import Foundation

enum VideoTabViewSheetItems:String,Identifiable{
    var id : String { return rawValue }
    case videoTapped
    case settingTapped
    case myCollectionsTapped
    case courseDetailView
    case trendingTapped
    case onlineTutors
}

class VideoTabViewModel:ObservableObject {
    @Published var settingTapped = false
    @Published var videoTapped = false
}
