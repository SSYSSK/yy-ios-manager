//
//  SSTBaseViewController.swift
//  sst-mobile
//
//  Created by Amy on 16/4/12.
//  Copyright © 2016年 lzhang. All rights reserved.
//

import UIKit

let kBackButtonRect = CGRect(x: 0, y: 10, width: 70, height: 40)
let kBackButtonImgRect = CGRect(x: 10, y: 0, width: 20, height: 23)

// MARK: - SegueHandlerType

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(identifier:SegueIdentifier, sender:AnyObject?) {
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Error: Invalid Segue Identifier: \(segue.identifier)")
        }
        return segueIdentifier
    }
}
// MARK: - SSTBaseVC

class YYBaseVC: UIViewController {
    
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
    
    // MARK: Toast
    func showToast(msg: String, duration: Double = 3.5) {
        
        let msgLabel = UILabel()
        msgLabel.numberOfLines = 0
        msgLabel.font = UIFont.systemFont(ofSize: 13)
        msgLabel.lineBreakMode = .byWordWrapping
        msgLabel.textAlignment = .center
        msgLabel.textColor = UIColor.white
        msgLabel.backgroundColor = UIColor.darkGray
        msgLabel.alpha = 1.0
        msgLabel.text = msg
//        msgLabel.cornerRadius = 5
        let maxSize = CGSize(width: self.view.bounds.size.width * 0.8, height: self.view.bounds.size.height * 0.8)
        let expectedHeight = getStringHeight(str: msg, font: 13, width: maxSize.width)
        msgLabel.frame = CGRect(x: self.view.bounds.size.width * 0.2 / 2, y: self.view.bounds.height - 90 - expectedHeight, width: maxSize.width, height: expectedHeight + 15)
        self.view.addSubview(msgLabel)
        
        UIView.animate(withDuration: 0.3, delay: duration, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            msgLabel.alpha = 0.1
        }) { (Bool) in
            msgLabel.removeFromSuperview()
        }
    }
    
    func showToastOnlyForDEV(msg: String, duration: Double = 3.5) {
        #if DEV
            showToast(msg, duration: duration)
        #endif
    }
}

