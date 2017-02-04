//
//  AppPageTabBarController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class AppPageTabBarController: PageTabBarController {
    
    open override func prepare() {
        super.prepare()
        delegate = self
        preparePageTabBar()
        prepareNavigationItems()
    }
}

extension AppPageTabBarController {
    fileprivate func preparePageTabBar() {
        pageTabBar.contentEdgeInsets = EdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        pageTabBar.lineColor = AppColor.Yellow
        pageTabBarAlignment = .top
        pageTabBar.lineAlignment = .bottom
        pageTabBar.lineHeight = 2
        pageTabBar.dividerColor = AppColor.BG_Gray
        pageTabBar.backgroundColor = AppColor.BG_Gray
        pageTabBar.contentViewAlignment = .center
        pageTabBar.height = 40
        isBounceEnabled = false
    }
    
    fileprivate func prepareNavigationItems()
    {
        navigationItem.titleLabel.textColor = Color.white
        navigationDrawerController?.isRightViewEnabled = false
    }
    
    
    @objc fileprivate func handleCloseButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
}


extension AppPageTabBarController : PageTabBarControllerDelegate
{
    func pageTabBarController(pageTabBarController: PageTabBarController, didTransitionTo viewController: UIViewController)
    {
        print("pageTabBarController", pageTabBarController, "didTransitionTo viewController:", viewController)
    }
}
