//
//  YYCategoryVC.swift
//  yy-ios-manager
//
//  Created by MuChao Ke on 16/12/6.
//  Copyright © 2016年 MuChao Ke. All rights reserved.
//

import UIKit

class YYCategoryVC: YYBaseVC {

    let tableviewCellIde = "categoryCellIde"
    
    var categoryDataForTableView = YYCategoryData()
    
    var categoryDataForCollectionVew = YYCategoryData()
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryDataForTableView.getCategory(categoryId: nil)
        categoryDataForTableView.delegate = self
        categoryDataForCollectionVew.delegate = self
        
        print("dsdjksldkldskdlsl;")
    }
}

// MARK: -- tableView delegate

extension YYCategoryVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDataForTableView.categorys.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableviewCellIde)
        let category = categoryDataForTableView.categorys[indexPath.row]
        cell?.textLabel?.text = category.name
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 13)
            return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryDataForTableView.categorys[indexPath.row]
        categoryDataForCollectionVew.getCategory(categoryId: validString(data: category.id as AnyObject?) )
    }

}

// MARK: -- refresh delegate
extension YYCategoryVC: SSTUIRefreshDelegate {
    func refreshUI(data: AnyObject?) {
        let categoryData = data as! YYCategoryData

        if let category = categoryData.categorys.first {
            if category.parentId == 0 {
                self.tableview.reloadData()
            }
        }else{
            self.collectionView.reloadData()
        }
    }
}
