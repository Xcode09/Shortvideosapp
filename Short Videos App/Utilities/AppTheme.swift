//
//  AppTheme.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 26/08/2023.
//

import Foundation
import SwiftUI

struct AppTheme {
    static let accentColor = Color.blue
    static let primaryFont = Font.custom("Nunito-Regular", size: 17)
    static let secondaryFont = Font.custom("Nunito-Medium", size: 18)
    static let boldFont = Font.custom("Nunito-Bold", size: 20)
    static let extraBoldFont = Font.custom("Nunito-ExtraBold", size: 20)
    static let semiFont = Font.custom("Nunito-SemiBold", size: 19)
    static let tabItemsFont = Font.custom("Nunito-Regular", size: 11)
    
    // You can add more theme properties here
    
    enum AppTabTitle:String,CaseIterable,Identifiable{
        case Tutoring,Quick,Videos,Games,Profile
        var id:String {return rawValue}
        var title:String{
            switch self {
            case .Tutoring : return "Tutoring"
            case .Quick : return "Quick"
            case .Videos : return "Videos"
            case .Games : return "Games"
            case .Profile: return"Profile"
            }
        }
    }
}
