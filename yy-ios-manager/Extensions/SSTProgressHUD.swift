//
//  SSTProgressHUD.swift
//  sst-ios
//
//  Created by MuChao Ke on 16/10/19.
//  Copyright © 2016年 SST. All rights reserved.
//

import UIKit

class SSTProgressHUD {
    
    class func setup() {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor(UIColor(red: 39 / 255.0, green: 39 / 255.0, blue: 39 / 255.0, alpha: 0.9))
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setMinimumDismissTimeInterval(2)
    }
    
    class func showErrorWithStatus(error: String) {
        SVProgressHUD.showError(withStatus: error)
    }
    
    class func showSuccessWithStatus(message: String) {
        SVProgressHUD.showSuccess(withStatus: message)
    }
    
    class func show() {
        SVProgressHUD.show()
    }
    
    class func dismiss(){
        SVProgressHUD.dismiss()
    }
    
    class func showWithStatus(message:String) {
        SVProgressHUD.show(withStatus: message)
    }
    
    class func showInfoWithStatus(message:String) {
        SVProgressHUD.showInfo(withStatus: message)
    }
    
    class func showInfoWithStatusOnlyForDEV(message:String) {
        #if DEV
        SVProgressHUD.showInfoWithStatus("\(message)\n --- only show this on DEV environment.")
        #endif
    }
    
    class func setMinimumDismissTimeInterval(Time: TimeInterval) {
        SVProgressHUD.setMinimumDismissTimeInterval(Time)
    }
}
