//
//  StoryboardExtension.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit

// MARK - To call storyboards.
extension UIStoryboard {
    
    // 스토리 보드를 불러오기 위한 함수를 정의합니다.
    class func drawerVC(identifier : String) -> UIViewController
    {
        return UIStoryboard(name: "Drawer", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    class func searchVC(identifier : String) -> UIViewController
    {
        return UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}
