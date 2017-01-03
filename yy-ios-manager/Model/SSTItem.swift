//
//  SSTItem.swift
//  sst-ios
//
//  Created by Zal Zhang on 6/14/16.
//  Copyright © 2016 SST. All rights reserved.
//

import UIKit


class SSTItem: BaseModel {
    
    var id: String!
    var name: String!
    var price: Double!      // 如果是促销，则显示promoItemPrie，否则显示OutPrice
    var listPrice: Double?  // 原价（outPrice）
    var thumbnail: String = ""
    var images: [String] = [String]()
    

}
