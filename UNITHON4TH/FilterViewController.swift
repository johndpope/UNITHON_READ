//
//  FilterViewController.swift
//  UNITHON4TH
//
//  Created by HAN on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate var searchButton : IconButton!

    @IBOutlet weak var filterTableView: UITableView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareBasicUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //테두리제거
        //self.filterTableView.tableFooterView = UIView()

//        let api = ApiManager(path: "/api/users/")
//        //let users = api.requestUsers()
//        //print(users)
//        api.request(success: {
//            (data: [Dictionary]) in
//            //print(data)
//            debugPrint(data)
//            }, fail: {
//                (error: Error?) in print(error)
//        })
        let api = ApiManager(path: "/get_recent_posts/")
        api.request(success: { (data: Dictionary) in //debugPrint(data)
            print("TESTING\(data)")
            }, fail: { (error: Error?) in print(error) })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let titles = ["기술과학", "문학", "사회학",
                  "언어", "역사", "예술", "자연과학",
                  "종교", "철학", "총류"]

    var checks = [true, true, true,
                  true, true, true,
                  true, true, true,
                  true]

//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         //let cell = FilterTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "filterCell")
        let cell = self.filterTableView.dequeueReusableCell(withIdentifier: "filterCell",for: indexPath) as! FilterTableViewCell
        print("EWRQEWR : \(cell)")
        
        if checks[indexPath.row] {
                cell.btnCheck.imageView?.image = UIImage(named: "btn-check")
        } else {
            cell.btnCheck.imageView?.image = UIImage(named: "btn-check-on")
        }

        cell.filterTitleLabel.text = titles[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if checks[indexPath.row] {
            checks[indexPath.row] = false
        } else {
            checks[indexPath.row] = true
        }

        self.filterTableView.reloadData()
    }

    fileprivate func prepareBasicUI() {
        searchButton = prepareIconButton(icon: Icon.search!)
        searchButton.addTarget(self, action: #selector(onSearchBtnClicked), for: .touchUpInside)
        prepareNavigationItems(left : [searchButton], right : [searchButton])
        prepareTitle(with : "필터설정")
        prepareTabBarItem(title: "필터", image: Icon.check!, selected: Icon.close!)
    }

    @objc func onSearchBtnClicked() {
        print("Search")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
