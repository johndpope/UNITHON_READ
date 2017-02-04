//
//  UserIdentityViewController.swift
//  UNITHON4TH
//
//  Created by HAN on 2017. 2. 5..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit

class UserIdentityViewController: UIViewController {
    @IBOutlet weak var keepBooksScrollView: UIScrollView!

    let titles = ["기술과학", "문학", "사회학",
                  "언어", "역사", "예술", "자연과학",
                  "종교", "철학", "총류"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)

        self.showAnimate()

        self.keepBooksScrollView.contentSize = CGSize(width: (240*3), height: 74)

        for index in 1...10 {
            let imageName = String(index)
            let btnMyLocation = UIButton()
            btnMyLocation.frame = CGRect(x: (index-1)*60, y: 0, width: 50, height: 74)
            btnMyLocation.addTarget(self, action: #selector(moveTradePage), for: .touchUpInside)
            btnMyLocation.setImage(UIImage(named: imageName), for: UIControlState())
            self.keepBooksScrollView.addSubview(btnMyLocation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closePopup(_ sender: AnyObject) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
    }
    
    func moveTradePage() {
        
    }

    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
           self.view.alpha = 1.0
            self.view.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0

            }, completion:{(finished: Bool) in
                if(finished) {
                    self.view.removeFromSuperview()
                }
        });
    }
    
    //func animation

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
