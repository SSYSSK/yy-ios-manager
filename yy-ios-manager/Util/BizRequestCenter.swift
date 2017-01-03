//
//  BizRequestCenter.swift
//  sst-ios
//
//  Created by Liang Zhang on 16/4/12.
//  Copyright © 2016年 lzhang. All rights reserved.
//

import UIKit
import Alamofire
//let kApiVersion = "10.d"


public class BizRequestCenter {
    
//    var user = SSTUser()
//    var cart = SSTCart()
//    var order = SSTOrder()
//    var dealMessage = SSTDealMessage()
//    var addressData = SSTAddressData()
//    var favorite = SSTFavorite()
    
    private let ntwkAccess = NetworkAccess()
    
    init() {
        ntwkAccess.listen()
    }
    
//    var para: Dictionary<String,AnyObject> = [
//        "header": [
//            "type": "ios",
//            "version": kAppBuild
//        ]
//    ]
    
    class var sharedInstance : BizRequestCenter {
        return biz
    }
    

    /**
     1.获取首页信息
     
     - parameter callback: 返回结果
     */
    public func getHomePage(callback:RequestCallBack){
//        let urlStr = "getHomePage.json"
//            ntwkAccess.request(.GET, url:kBaseURLString + urlStr) { (response, error) -> Void in
//                callback(data: response, error: error)
//        }
    }
    
    /**
     1.获取分类信息
     
     - parameter callback: 返回结果
     */
    public func getCategory(categoryId:String?, callback: @escaping RequestCallBack){
        
        var  urlStr = ""
        if categoryId != nil {
            urlStr = "category/list/?parentId=\(categoryId!)"
        }else{
            urlStr = "category/list/parent"
        }

        ntwkAccess.request(method: .get, url: kBaseURLString + urlStr, parameters: nil) { (responce, error) in
             callback(responce, error)
        }
    }
    
}
