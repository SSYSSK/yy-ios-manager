//
//  SSTBaseSearchVC.swift
//  sst-ios
//
//  Created by MuChao Ke on 16/8/26.
//  Copyright © 2016年 SST. All rights reserved.
//

import UIKit

class YYBaseSearchVC: YYBaseVC {

    private enum SegueIdentifier: String {
        case toSearchResult    = "toSearchResult"
        case toItemDetails     = "toItemDetails"
        
    }
    var searchKey: String?
    var itemClicked: SSTItem?
    
    @IBAction func clickedSearchBarButton(sender: AnyObject) {
//        let searchV = loadNib(nibName: "\(SSTSearchView.className)") as! SSTSearchView
//        searchV.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
//        self.view.addSubview(searchV)
//        self.navigationController?.isNavigationBarHidden = true
//        searchV.backFromSearch = { searchKey, item in
//            if !self.isKindOfClass(SSTHomeVC.classForCoder()) {
//                self.navigationController?.navigationBarHidden = false
//            }
//            if searchKey != nil {
//                self.searchKey = searchKey
//                self.performSegueWithIdentifier("\(SegueIdentifier.toSearchResult.rawValue)", sender: self)
//            } else if item != nil {
//                self.itemClicked = item
//                self.performSegueWithIdentifier("\(SegueIdentifier.toItemDetails.rawValue)", sender: self)
//            }
//        }
    }
}

