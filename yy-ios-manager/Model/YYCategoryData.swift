//
//  YYCategoryData.swift
//  yy-ios-manager
//
//  Created by MuChao Ke on 16/12/7.
//  Copyright © 2016年 MuChao Ke. All rights reserved.
//

import UIKit

class YYCategoryData: BaseModel {
    
    var categorys = [YYCategory]()
    
    override init() {
        super.init()
    }
    
    func refreshData(arr: Array<AnyObject>) {
        
        for dict in arr {
            if let category = YYCategory.mj_object(withKeyValues: dict){
                
                categorys.append(category)
            }
        }
    }
    
    
    func getCategory(categoryId:String?) {
        
        biz.getCategory(categoryId: categoryId ) { (data, error) in
            if error == nil {
                self.refreshData(arr: validArray(data: data))
                
                self.delegate?.refreshUI(data: self)
            } else {
                printDebug(msg: error.debugDescription)
                SSTProgressHUD.showErrorWithStatus(error: validString(data: error))
            }
        }
    }
}
