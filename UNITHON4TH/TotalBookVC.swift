//
//  TotalBookVC.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class TotalBookVC: UIViewController {

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        preparePageTabBarItem(with: "전체 도서")
    }
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
    }
    
    open override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = AppColor.BG_Gray
    }
}
