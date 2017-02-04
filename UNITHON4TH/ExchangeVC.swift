//
//  ExchangeVC.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class ExchangeVC: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareTabBarItem(title: "교환정보", image: Icon.check!, selected: Icon.close!)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }

}
