//
//  AppNavigationController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class AppNavigationController: NavigationController, UINavigationControllerDelegate
{
    override func viewDidLoad()
    {
        super.prepare()
//        prepareNavigationbar()
        // Back 버튼 정의시 사용합니다.
//        navigationBar.backIndicatorImage
//        navigationBar.backIndicatorTransitionMaskImage
//        navigationBar.tintColor = AppColor.Yellow
//        navigationBar.dividerColor = AppColor.Yellow
    }

    override func viewDidLayoutSubviews() {
        prepareNavigationbar()
    }
    
    override func prepare()
    {
        super.prepare()
    }
}

extension AppNavigationController {
    
    fileprivate func prepareNavigationbar()
    {
        navigationBar.backgroundColor = AppColor.Yellow
    }
}
