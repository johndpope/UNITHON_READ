//
//  AppSearchbarController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class AppSearchBarController: SearchBarController, UITextFieldDelegate {
    fileprivate var backButton: IconButton!
    fileprivate var moreButton: IconButton!
    fileprivate var nc = NotificationCenter.default
    
    open override func prepare() {
        super.prepare()
        prepareBackButton()
        prepareMoreButton()
        prepareStatusBar()
        prepareSearchBar()
        searchBar.textField.delegate = self
    }
}

extension AppSearchBarController {
    fileprivate func prepareBackButton()
    {
        backButton = IconButton(image: Icon.cm.arrowBack)
    }
    
    fileprivate func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreVertical)
    }
    
    fileprivate func prepareStatusBar() {
        statusBarStyle = .lightContent
        
        // Access the statusBar.
        //        statusBar.backgroundColor = Color.grey.base
    }
    
    fileprivate func prepareSearchBar() {
        searchBar.leftViews = [backButton]
        searchBar.rightViews = [moreButton]
    }
}

extension AppSearchBarController
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        nc.post(name: Notification.Name(NotiName.SEARCH_TEXT_CHANGED), object: textField.text!)
    }
}
