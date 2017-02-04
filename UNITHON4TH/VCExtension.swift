//
//  VCExtension.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import Foundation
import Material

/**
 * MARK : Material 프레임워크를 사용하여 Navigation Bar 를 구성하기 위한 기본 함수들을 제공합니다.
 * ViewController.swift에서 사용 예제를 보실 수 있습니다.
 */
extension UIViewController
{
   /**
    * Navigation Bar 에 구성할 메뉴를 정의합니다. 
    * @param left : 바 상에서 왼쪽에 들어갈 버튼들
    * @param right : 바 상에서 오른쪽에 들어갈 버튼들을 순서대로 정의
    * Material 프레임워크에서는 IconButton을 정의하여 넣으시면 편리합니다. 예 => IconButton(image : Icon.menu!)
    */
    func prepareNavigationItems(left LViews : [UIView], right RViews : [UIView])
    {
        navigationItem.leftViews = LViews.count != 0 ? LViews : []
        navigationItem.rightViews = RViews.count != 0 ? RViews : []
        navigationDrawerController?.isRightViewEnabled = false
    }
    
    // 네비게이션 바의 타이틀을 지정합니다.
    func prepareTitle(with title : String)
    {
        navigationItem.titleLabel.text = title
//        navigationItem.titleLabel.font = UIFont()
        // 폰트는 디자이너분이 정해주시는 폰트를 여기에 정의해서 사용할 예정입니다.
        navigationItem.titleLabel.textColor = Color.white
    }

    // 흰색 IconButton을 손쉽게 만들 수 있습니다.
    func prepareIconButton(icon : UIImage) -> IconButton
    {
        let btn = IconButton(image: icon)
        btn.tintColor = Color.white
        return btn
    }
    
    // 텍스트로 구성된 버튼을 만들기 위해 사용합니다.
    func prepareTextButton(with text : String) -> FlatButton
    {
        let btn = FlatButton(title: text, titleColor: UIColor.white)
//        btn.titleLabel?.font = UIFont()
        btn.pulseAnimation = .none
        return btn
    }
    
    // 보통 많이들 사용하시는 햄버거 모양의 메뉴 버튼을 제작합니다.
    func prepareMenuButton() -> IconButton {
        let menuButton = prepareIconButton(icon: Icon.menu!)
        menuButton.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
        
        return menuButton
    }}

extension UIViewController
{
    // 메뉴 버튼 클릭시 Drawer를 엽니다.
    @objc func handleMenuButton() {
        navigationDrawerController?.toggleLeftView()
    }
    
    // 전달된 TextField 배열에 대해 띄워진 키보드를 모두 사라지게 합니다.
    @objc func resignAllKeyboards(target fields : [UITextField])
    {
        for field in fields
        {
            field.resignFirstResponder()
        }
    }
    
    // 간단한 AlertView를 출력합니다.
    func showAlertDialog(title : String, message : String, button : String)
    {
        let infoAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: button, style: .default, handler: { alert in
            
        })
        infoAlert.addAction(OKAction)
        self.present(infoAlert, animated: true, completion: nil)
    }
    
    // 하단 탭바를 정의합니다.
    func prepareTabBarItem(title : String, image : UIImage, selected : UIImage)
    {
        tabBarItem.title = title
        tabBarItem.image = image
        tabBarItem.selectedImage = selected
    }
}

