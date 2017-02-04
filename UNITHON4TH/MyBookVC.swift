//
//  MyBookVC.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class MyBookVC: UIViewController, TableViewDelegate {
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        preparePageTabBarItem(with: "내 서재")
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

extension MyBookVC
{
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
}
