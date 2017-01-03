//
//  SSTItemData.swift
//  sst-ios
//
//  Created by Amy on 16/7/1.
//  Copyright © 2016年 SST. All rights reserved.
//

import UIKit

class SSTItemData: BaseModel {
    
    var items = [SSTItem]()
    
    
    
    override init() {
        super.init()
       
    }


    
    func update(dict: NSDictionary) {
    
    }

    func update(array: NSArray) {
        items.removeAll()
        for mItem in array {
//            if let item = SSTItem(JSON: validDictionary(mItem)) {
//                items.append(item)
//            }
        }
    }



    func getNewArrivals(callback: RequestCallBack? = nil) {
//        biz.getNewArrivals { (data, error) in
//            if error == nil {
//                self.update(validArray(data))
//            } else {
//                self.items.removeAll()
//            }
//            self.delegate?.refreshUI(self)
//        }
    }

}
