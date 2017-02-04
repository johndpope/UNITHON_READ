//
//  AppBottomNavigationController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class AppBottomNavigationController: BottomNavigationController {
    open override func prepare() {
        super.prepare()
        prepareTabBar()
    }
    
    private func prepareTabBar() {
        tabBar.depthPreset = .none
        tabBar.dividerColor = Color.grey.lighten3
    }
}
