//
//  YYCategoryModel.swift
//  yy-ios-manager
//
//  Created by MuChao Ke on 16/12/5.
//  Copyright © 2016年 MuChao Ke. All rights reserved.
//

import UIKit

class YYCategory: BaseModel {
    
    var id = 0
    var isparent = -1
    var name = ""
    var parentId = 0
    var url = ""
    
    var categorys = [YYCategory]()
    
}
