//
//  RootWireframe.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import Foundation
import UIKit
import Material

class RootWireframe : NSObject
{
    // Drawer상에서 메뉴 이동시에 사용합니다.
    func transition(in controller : NavigationDrawerController ,to : UIViewController)
    {
        let navcon = controller.rootViewController as! AppNavigationController
        navcon.viewControllers = [to]
    }
    
    // 최상위 컨트롤러로 돌아갑니다
    func popToRoot(in navCon : UINavigationController)
    {
        navCon.popToRootViewController(animated: true)
    }
    
    // 전달된 controller를 Modal 형식으로 출력합니다.
    func presentViewControllerModally(in window : UIWindow, controller : UIViewController)
    {
        if let drawer = window.rootViewController as? NavigationDrawerController
        {
            if let navCon = drawer.rootViewController as? NavigationController
            {
                navCon.present(controller, animated: true, completion: nil)
            }
        }
        else
        {
            print("controller error")
        }
    }
}
