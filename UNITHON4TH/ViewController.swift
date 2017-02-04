//
//  ViewController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 3..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController {
    
    fileprivate var menuButton : IconButton!
    fileprivate var searchButton : IconButton!
    fileprivate var textButton : FlatButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareBasicUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    fileprivate func prepareBasicUI()
    {
        menuButton = prepareMenuButton()
        
        searchButton = prepareIconButton(icon: Icon.search!)
        searchButton.addTarget(self, action: #selector(onSearchBtnClicked), for: .touchUpInside)
        
        textButton = prepareTextButton(with: "Test")
        textButton.addTarget(self, action: #selector(onTestBtnClicked), for: .touchUpInside)
        
        prepareNavigationItems(left : [menuButton], right : [textButton, searchButton])
        prepareTitle(with : "READ TITLE")
    }
    
    @objc func onSearchBtnClicked()
    {
        print("Search")
    }
    
    @objc func onTestBtnClicked()
    {
        print("Test")
    }
}

