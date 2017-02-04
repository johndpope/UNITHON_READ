//
//  App.swift
//  FirstNoteProject
//
//  Created by HAN on 2017. 2. 2..
//  Copyright © 2017년 HAN. All rights reserved.
//

import Foundation
import UIKit

struct App {
    
    struct Size {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
        static let navigationBarHeight: CGFloat = 44
        static let toolBarHeight: CGFloat = 44
        static let statusBarHeight = UIApplication.shared.statusBarFrame.height
        static let statusBarAndNavigationBarHeight = Size.statusBarHeight + Size.navigationBarHeight
    }

    struct URL {
        //static let
        static let itunes: String = ""
        static let devlop: String = ""
        static let production: String = ""
    }
    
    struct API {
        static let googleKey: String = "AIzaSyAX_3nW5fgpcwb78cuh_8px2P12DNn_uTc"
        static let mainKey: String = ""
        static let subKey: String = ""
    }

    struct Font {
        static func main(_ size: CGFloat) -> UIFont { return App.Font.nanumSquare(size: size) }
        static func nanumSquare(size: CGFloat) -> UIFont { return UIFont(name: "NanumSquare", size: size) ?? UIFont.systemFont(ofSize: size) }
        static func nanumBarunGothic(size: CGFloat) -> UIFont { return UIFont(name: "NanumBarunGothic", size: size) ?? UIFont.systemFont(ofSize: size) }
    }
    
    struct Color {
        static let CommonColor: String = "2D201C"
    }
    
    //    struct Logo {
    //        static let titleImage: UIImage = R.image.titleImage()!
    //    }
    
}
