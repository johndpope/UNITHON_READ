//
//  RecommendVC.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material


class RecommendVC: UIViewController {

    var image1 : UIImageView!
    var image2 : UIImageView!
    var reco1line : UIView!
    var reco2line : UIView!
    var reco3line : UIView!
    var reco1btn : UIButton!
    var reco2btn : UIButton!
    var reco3btn : UIButton!
    var button : UIButton!
    var button2 : UIButton!
    fileprivate var menuButton : IconButton!
    fileprivate var searchButton : IconButton!
    fileprivate var textButton : FlatButton!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        menuButton = prepareMenuButton()
        
        searchButton = prepareIconButton(icon: Icon.search!)
        searchButton.addTarget(self, action: #selector(onSearchBtnClicked), for: .touchUpInside)
        
        
        prepareNavigationItems(left : [menuButton], right : [searchButton])
        prepareTitle(with : "READ TITLE")

        prepareTabBarItem(title: "도서추천", image: Icon.check!, selected: Icon.close!)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
    }
    
    func onSearchBtnClicked(){
        
    }
    func onTestBtnClicked(){
        
    }
    
    func viewSetUp(){
        
        self.view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        
        image1 = UIImageView(frame: CGRect(x: 29, y: 79, width: 311, height: 163))
        image2 = UIImageView(frame: CGRect(x: 29, y: 272, width: 311, height: 163))
        image1.image = UIImage(named: "reco1")
        image2.image = UIImage(named: "reco2")
        
        self.view.addSubview(image1)
        self.view.addSubview(image2)
        
        button = UIButton(frame: CGRect(x: 147, y: 202, width: 198, height: 38))
        button.setTitle("상세보기", for: .normal)
        button.backgroundColor =  UIColor(red: 255/255, green: 213/255, blue: 48/255, alpha: 1.0)
        button.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        button.titleLabel?.font = button.titleLabel?.font.withSize(11)
        self.view.addSubview(button)
        
        
        button2 = UIButton(frame: CGRect(x: 147, y: 393, width: 198, height: 38))
        button2.setTitle("상세보기", for: .normal)
        button2.backgroundColor =  UIColor(red: 255/255, green: 213/255, blue: 48/255, alpha: 1.0)
        button2.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        button2.titleLabel?.font = button2.titleLabel?.font.withSize(11)

        self.view.addSubview(button2)

        
        reco1btn = UIButton(frame: CGRect(x: 51, y: 32, width: 40, height: 13))
        reco1btn.setTitle("맞춤 추천", for: .normal)
        reco1btn.titleLabel?.font = reco1btn.titleLabel?.font.withSize(10)
        reco1btn.setTitleColor(UIColor.gray, for: .normal)
        reco1btn.addTarget(self, action: #selector(reco1btnAction), for: .touchUpInside)
        self.view.addSubview(reco1btn)

        
        reco2btn = UIButton(frame: CGRect(x: 168, y: 32, width: 47, height: 13))
        reco2btn.setTitle("베스트셀러", for: .normal)
        reco2btn.titleLabel?.font = reco1btn.titleLabel?.font.withSize(10)

        reco2btn.addTarget(self, action: #selector(reco2btnAction), for: .touchUpInside)
        reco2btn.setTitleColor(UIColor.gray, for: .normal)
        self.view.addSubview(reco2btn)

        
        reco3btn = UIButton(frame: CGRect(x: 281, y: 32, width: 49, height: 13))
        reco3btn.setTitle("장르별 추천", for: .normal)
        reco3btn.addTarget(self, action: #selector(reco3btnAction), for: .touchUpInside)
        reco3btn.titleLabel?.font = reco1btn.titleLabel?.font.withSize(10)

        reco3btn.setTitleColor(UIColor.gray, for: .normal)
        self.view.addSubview(reco3btn)

 

        
        reco1line = drawLine(startX: 28, startY: 49, width: 85, height: 2 , color:  UIColor(red: 255/255, green: 213/255, blue: 48/255, alpha: 1.0))
        
        reco2line = drawLine(startX: 149, startY: 49, width: 85, height: 2 , color:  UIColor(red: 255/255, green: 213/255, blue: 48/255, alpha: 1.0))
        reco2line.isHidden = true
        
        reco3line = drawLine(startX: 263, startY: 49, width: 85, height: 2 , color:  UIColor(red: 255/255, green: 213/255, blue: 48/255, alpha: 1.0))
        reco3line.isHidden = true
        
    }
    
    func btnAction(){
        basicAlert(string: "잠시만요!", message: "준비중입니다.")
    }
    
    func reco1btnAction(){
        reco1line.isHidden = false
        reco2line.isHidden = true
        reco3line.isHidden = true
        reco2btn.setTitleColor(UIColor.gray, for: .normal)
        reco3btn.setTitleColor(UIColor.gray, for: .normal)
        
        image1.image = UIImage(named: "reco1")
        image2.image = UIImage(named: "reco2")
        
    }
    
    func reco2btnAction(){
        reco1line.isHidden = true
        reco2line.isHidden = false
        reco3line.isHidden = true
        reco1btn.setTitleColor(UIColor.gray, for: .normal)
        reco3btn.setTitleColor(UIColor.gray, for: .normal)
        
        image1.image = UIImage(named: "reco3")
        image2.image = UIImage(named: "reco4")
    }
    
    func reco3btnAction(){
        reco1line.isHidden = true
        reco2line.isHidden = true
        reco3line.isHidden = false
        reco1btn.setTitleColor(UIColor.gray, for: .normal)
        reco2btn.setTitleColor(UIColor.gray, for: .normal)
        
        image1.image = UIImage(named: "reco1")
        image2.image = UIImage(named: "reco2")
    }
    
    func drawLine(startX: CGFloat,startY: CGFloat,width: CGFloat, height: CGFloat, color: UIColor) -> UIView{
        
        var line: UIView!
        line = UIView(frame: CGRect(x: startX, y: startY, width: width, height: height))

        line.backgroundColor = color
        
        self.view.addSubview(line)
        
        return line
    }
    
    func basicAlert(string : String,message : String){
        let alertView = UIAlertController(title: string, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            alertView.dismiss(animated: true, completion: nil)
        })
        
        alertView.addAction(action)
        
        alertWindow(alertView: alertView)
    }
    
    func alertWindow(alertView: UIAlertController){
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertView, animated: true, completion: nil)
    }



}
