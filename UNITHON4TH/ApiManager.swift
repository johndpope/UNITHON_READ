//
//  ApiManager.swift
//  UNITHON4TH
//
//  Created by HAN on 2017. 2. 4..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

//
//  ApiManager.swift
//  FirstNoteProject
//
//  Created by HAN on 2017. 2. 4..
//  Copyright © 2017년 HAN. All rights reserved.
//
import Foundation
import Alamofire

private let server = "http://52.175.155.109"

struct ApiManager {
    let url: String
    let method: HTTPMethod
    let parameters: Parameters

    init(path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
        url = server + path
        self.method = method
        self.parameters = parameters
    }
//    parameters: ["include_docs": "true"]//

    func request(success: @escaping(_ data: Dictionary<String, Any>)-> Void, fail: @escaping (_ error: Error?)-> Void) {
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                print(response.result.value)
                success(response.result.value as! Dictionary)
            } else {
                fail(response.result.error)
            }
        }
    }

    func requestUsers() {
        Alamofire.request(url).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
}
