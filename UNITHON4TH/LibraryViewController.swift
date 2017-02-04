//
//  LibraryViewController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material
import AVFoundation
import Alamofire
import SwiftyJSON
class LibraryViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

    fileprivate var menuButton : IconButton!
    fileprivate var searchButton : IconButton!
    fileprivate var textButton : FlatButton!
    
    // MARK: Layout Concerns
    
  
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let userDevice = DeviceResize(testDeviceModel: DeviceType.IPHONE_7,userDeviceModel: (Float(ScreenSize.SCREEN_WIDTH),Float(ScreenSize.SCREEN_HEIGHT)))
    
    var heightRatio: CGFloat = 0.0
    var widthRatio: CGFloat = 0.0
    
    let apiManager = ApiManager(path: "/api/mybooks", method: .get, parameters: ["user":"song"])
    var bookImg : [String] = []
    var bookName : [String] = []
    var bookCate : [String] = []
    var bookAuthor : [String] = []
    
    fileprivate func prepareBasicUI()
    {
        menuButton = prepareMenuButton()
        
        searchButton = prepareIconButton(icon: Icon.search!)
        searchButton.addTarget(self, action: #selector(onSearchBtnClicked), for: .touchUpInside)
        
        textButton = prepareTextButton(with: "Test")
        textButton.addTarget(self, action: #selector(onTestBtnClicked), for: .touchUpInside)
        
        prepareNavigationItems(left : [menuButton], right : [textButton, searchButton])
        prepareTitle(with : "READ TITLE")
        prepareTabBarItem(title: "내서재", image: Icon.check!, selected: selected: Icon.close!)
        
    }
    
    @objc func onSearchBtnClicked()
    {
        let totalBookVC = UIStoryboard.searchVC(identifier: ViewIdentifier.TotalBookVC)
        let myBookVC = UIStoryboard.searchVC(identifier: ViewIdentifier.MyBookVC)
        let bookCrossVC = UIStoryboard.searchVC(identifier: ViewIdentifier.BookCrossVC)
        
        let pageBar = AppPageTabBarController(viewControllers: [totalBookVC,myBookVC,bookCrossVC])
        let searchVC = AppSearchBarController(rootViewController: pageBar)
        
        present(searchVC, animated: true, completion: nil)
    }
    
    
    @objc func onTestBtnClicked()
    {
        print("Test")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareBasicUI()
    }
    

    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        heightRatio = userDevice.userDeviceHeight()
        widthRatio = userDevice.userDeviceWidth()
        
        viewSetUp()
        
        setBookList()

    }
  
    let reuseIdentifier = "cell"
 
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bookImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PhotoCaptionCell
        cell.myImage.image = UIImage(data: NSData(contentsOf: NSURL(string: bookImg[indexPath.item])! as URL)! as Data)!
        bookInfoSetUp(bookname: bookName[indexPath.item], bookcate: bookCate[indexPath.item], bookauthor: bookAuthor[indexPath.item] ,x: cell.x , y: cell.y)
        return cell
    }
    

    
    func bookInfoSetUp(bookname : String , bookcate : String , bookauthor : String , x : CGFloat , y : CGFloat){
        
        let bookName = UILabel(frame: CGRect(x: x, y: (y+131*heightRatio), width: 85*widthRatio, height: 11*heightRatio))
        bookName.text = bookname
        bookName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 11.0)
        
        let bookCate = UILabel(frame: CGRect(x: x, y: (y+142*heightRatio), width: 85*widthRatio, height: 11*heightRatio))
        bookCate.text = bookcate
        bookCate.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 8.0)
        
        let bookAuthor = UILabel(frame: CGRect(x: x, y: y+153*heightRatio, width: 85*widthRatio, height: 11*heightRatio))
        bookAuthor.text = bookauthor
        bookAuthor.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 8.0)
        
        self.myCollectionView.addSubview(bookName)
        self.myCollectionView.addSubview(bookCate)
        self.myCollectionView.addSubview(bookAuthor)
    }
    
    func viewSetUp(){
        
        myCollectionView.x = 29*widthRatio
        myCollectionView.y = 16*heightRatio
        myCollectionView.width = UIScreen.main.bounds.size.width - 58*widthRatio
        myCollectionView.height = UIScreen.main.bounds.size.height - 148*heightRatio
        let flow = myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        flow.itemSize = CGSize(width: 87*widthRatio , height: 128*heightRatio)
        flow.minimumInteritemSpacing = 3*widthRatio
        flow.minimumLineSpacing = 40*heightRatio
        
        
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        
        self.myCollectionView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    
        myCollectionView.showsVerticalScrollIndicator = false
    }
    
    
    func setBookList(){
        
        Alamofire.request(apiManager.url, method: .get, parameters: apiManager.parameters).responseJSON { response in
            let json = JSON(response.result.value!)
            for index in 0..<json.count {
                self.bookImg.append(json[index]["img_src"].stringValue)
                self.bookAuthor.append(json[index]["author"].stringValue)
                self.bookCate.append(json[index]["genre"].stringValue)
                self.bookName.append(json[index]["name"].stringValue)
            }
            self.myCollectionView.reloadData()
        }
        
    
    }
}




