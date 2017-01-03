//
//  SSTBaseNavigationController.swift
//  sst-mobile
//
//  Created by Amy on 16/4/12.
//  Copyright © 2016年 lzhang. All rights reserved.
//

import UIKit

class YYBaseNC: UINavigationController {
    
    var currentShowVC: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.tintColor = UIColor.gray
        // 设置interactivePopGestureRecognizer委托
        interactivePopGestureRecognizer?.delegate = self
        // 设置当前UINavigationController委托
        delegate = self
    }
}

extension YYBaseNC: UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if navigationController.viewControllers.count == 1 {
            currentShowVC = nil
        } else {
            currentShowVC = viewController
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            return currentShowVC == topViewController
        }
        
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIScreenEdgePanGestureRecognizer.self) {
            return true
        } else {
            return false
        }
    }
    
}
