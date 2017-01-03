//
//  SSTBaseTableViewController.swift
//  sst-mobile
//
//  Created by Amy on 16/4/12.
//  Copyright © 2016年 lzhang. All rights reserved.
//

import UIKit

class YYBaseTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var backButton: UIButton?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (self.navigationController?.viewControllers.count)! > 1 {
            addLeftItemButton()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if backButton != nil {
            backButton!.removeFromSuperview()
        }
        
        SVProgressHUD.dismiss()
    }
    
    func addLeftItemButton() -> Void {
        
        backButton = UIButton(type: UIButtonType.custom)
        backButton!.frame = kBackButtonRect
        backButton!.addTarget(self, action: #selector(clickedBackBarButton), for: UIControlEvents.touchUpInside)
        //backButton!.setBackgroundImage(UIImage.init(named: "icon_back_gray"), forState: UIControlState.Normal)
        
        let imgV = UIImageView(frame: kBackButtonImgRect)
        imgV.image = UIImage(named: kIconBackImgName)
        backButton?.addSubview(imgV)
        
        self.navigationController!.navigationBar.addSubview(backButton!)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: UIView())
    }
    
    func clickedBackBarButton() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
}

