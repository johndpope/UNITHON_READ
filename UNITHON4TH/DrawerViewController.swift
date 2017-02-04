//
//  DrawerViewController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import Material
import CircleProgressView

class DrawerViewController: UIViewController {
    
    // 메뉴에 사용되는 테이블뷰입니다.
    @IBOutlet weak var tableView: UITableView!
    
    // variables to connect Menu -> View Controllers Start ***********
    // 여기에 각 메뉴의 첫 페이지를 정의해 주세요. 여기서 정의된 VC들은 화면이 전환되어도 메모리상에 유지됩니다.
    
//    lazy var testVC : ViewController = {
//        return UIStoryboard.drawerVC(identifier: ViewIdentifier.) as! ViewController
//    }()
    
    // variables to connect Menu -> View Controllers End *************
    
    
    // Singleton
    class var shared: DrawerViewController {
        struct Static {
            static let instance: DrawerViewController = DrawerViewController()
        }
        return Static.instance
    }
    
    // transition을 담당하는 Wireframe을 불러옵니다.
    var wireframe = RootWireframe()
    
    // onCreate
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.Kakao
        prepareTableView()
        navigationDrawerController?.setLeftViewWidth(width: 316, isHidden: true, animated: true)
    }
    
    
    // ** Table View related **
    /// Prepares the tableView UIs.
    fileprivate func prepareTableView() {
        tableView.backgroundColor = AppColor.Kakao
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        view.layout(tableView).edges(top: 0)
    }
}


/// TableViewDataSource methods.
extension DrawerViewController: UITableViewDataSource {
    
    /// Determines the number of rows in the tableView.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row
        {
        case 0:
            return 60
        case 1:
            return 80
        case 2:
            return 320
        case 3:
            return 170
        case 4:
            return 50
        default:
            return 0
        }
    }
    
    /// Prepares the cells within the tableView.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ((indexPath as NSIndexPath).row == 0)
        {
            // Title cells
        }
        else if ((indexPath as NSIndexPath).row == 4)
        {
            // for middle dividers
        }
        
        var cell : UITableViewCell = UITableViewCell()
        
        switch indexPath.row
        {
        case 0 :
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.LOGINCELL, for: indexPath)
        case 1 :
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.PROCESSCELL, for: indexPath)
        case 2 :
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.PATTERNCELL, for: indexPath)
        case 3 :
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.RECOMMENDCELL, for: indexPath)
        case 4 :
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.NOTICECELL, for: indexPath)
        default : break
        }
        
        return cell
    }
}

/// UITableViewDelegate methods.
extension DrawerViewController: UITableViewDelegate {
    
    
    /// Sets the tableView cell height.
    /*
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 60
     }
     */
    
    /// Select item at row in tableView.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
//        let item: DrawerItem = drawerMenuItems[(indexPath as NSIndexPath).row]
//        let from = navigationDrawerController!
//        switch item.text
//        {
////        case "내 서재":
////            // Transition to other view controller
////            wireframe.transition(in: from, to: viewController)
////        case "북크로싱":
////            wireframe.transition(in: from, to: viewController)
////        case "교환정보":
////            wireframe.transition(in: from, to: viewController)
////        case "도서추천":
////            wireframe.transition(in: from, to: viewController)
////        case "환경설정":
////            wireframe.transition(in: from, to: viewController)
//        default:break
//        }
        closeNavigationDrawer(result: true)
    }
}

extension DrawerViewController {
    // to close drawer.
    fileprivate func closeNavigationDrawer(result : Bool) {
        navigationDrawerController?.closeLeftView()
    }
}
