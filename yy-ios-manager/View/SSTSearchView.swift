//
//  SSTSearchView.swift
//  sst-ios
//
//  Created by Zal Zhang on 9/18/16.
//  Copyright © 2016 SST. All rights reserved.
//

import UIKit

//class SSTSearchView: UIView, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
//    
//    @IBOutlet weak var searchTextField: SSTSearchTextField!
//    @IBOutlet weak var deleteTextButton: UIButton!
//    @IBOutlet weak var tableView: UITableView!
//    
//    var itemData = SSTItemData()
//    
//    private let kSearchCellIdentifier = "SSTSearchViewCell"
//    private let kItemCellIdentifier = "ItemCellIdentifier"
//    
//    private var sectionsExpanded = [Int]()
//    
//    var backFromSearch: ((searchKey: String?, item: SSTItem?) -> Void)?
//    
//    private var searchTask: AsynTask?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        itemData.delegate = self
//        
//        tableView.registerNib(UINib(nibName: kSearchCellIdentifier, bundle:nil), forCellReuseIdentifier: kSearchCellIdentifier)
//        
//        searchTextField.delegate = self
//        searchTextField.returnKeyType = UIReturnKeyType.Search
//        searchTextField.enablesReturnKeyAutomatically = true
//        searchTextField.becomeFirstResponder()
//    }
//    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        if let toBeString = textField.text as NSString? {
//            let textChanged = toBeString.stringByReplacingCharactersInRange(range, withString: string)
//            if textChanged.characters.count <= 0 {
//                deleteTextButton.hidden = true
//                tableView.reloadData()
//            } else {
//                deleteTextButton.hidden = false
//                TaskUtil.cancel(searchTask)
//                searchTask = TaskUtil.delayExecuting(0.5) {
//                    self.itemData.searchItemsWithPrefix(textField.text!.trim())
//                }
//            }
//        }
//        return true
//    }
//    
//    @IBAction func clickedDeleteTextButton(sender: AnyObject) {
//        searchTextField.text = ""
//        deleteTextButton.hidden = true
//        tableView.reloadData()
//    }
//    
//    @IBAction func clickedCancelButton(sender: AnyObject) {
//        self.removeFromSuperview()
//        if self.backFromSearch != nil {
//            self.backFromSearch!(searchKey: nil, item: nil)
//        }
//    }
//    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        self.removeFromSuperview()
//        if self.backFromSearch != nil && validString(searchTextField.text) != "" {
//            self.backFromSearch!(searchKey: validString(searchTextField.text), item: nil )
//        }
//        return true
//    }
//    
//    func clickedTableViewHeaderView(button: UIButton) {
//        let section: Int = button.tag
//        
//        if sectionsExpanded.contains(section) {
//            for ind in 0 ..< sectionsExpanded.count {
//                if sectionsExpanded[ind] == section {
//                    sectionsExpanded.removeAtIndex(ind)
//                    break
//                }
//            }
//        } else {
//            sectionsExpanded.append(section)
//        }
//        tableView.reloadSections(NSIndexSet(index: section), withRowAnimation: UITableViewRowAnimation.Automatic)
//    }
//
//    // MARK:-- tableView delegate
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        if searchTextField.text == "" {
//            if itemData.historyKeywords.count > 0 {
//                return 1
//            } else {
//                return 0
//            }
//        } else {
//            return itemData.groups!.count
//        }
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searchTextField.text == "" {
//            if itemData.historyKeywords.count > 0 {
//                return itemData.historyKeywords.count + 1
//            } else {
//                return 0
//            }
//        } else {
//            if sectionsExpanded.contains(section) {
//                return itemData.groups![section].items.count
//            } else {
//                return 0
//            }
//        }
//    }
//    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//    
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 40))
//        
//        if searchTextField.text == "" {
//            
//            let label = UILabel.init(frame: CGRectMake(15, 10, kScreenWidth - 20, 20))
//            label.font = UIFont.systemFontOfSize(13)
//            label.text = "Search History"
//            
//            headerView.addSubview(label)
//            headerView.backgroundColor = UIColor.groupTableViewBackgroundColor()
//        } else {
//            
//            let tempV = UIView(frame: CGRectMake(0, 0, kScreenWidth, 40))
//            let textlabel = UILabel(frame: CGRectMake(15, 10, kScreenWidth-20, 20))
//            textlabel.font = UIFont.systemFontOfSize(13)
//            textlabel.text = itemData.groups![section].name
//            tempV.addSubview(textlabel)
//            
//            let iamgeView = UIImageView()
//            if sectionsExpanded.contains(section) {
//                iamgeView.frame = CGRect(x: kScreenWidth-25, y: 16, width: 15, height: 7)
//                iamgeView.image = UIImage(named:kIconExpandImageName)
//            } else {
//                iamgeView.frame = CGRect(x: kScreenWidth-20, y: 13, width: 7, height: 14)
//                iamgeView.image = UIImage(named: kIconGoInImageName);
//            }
//            tempV.addSubview(iamgeView)
//            
//            let button = UIButton(frame: CGRectMake(0, 0, kScreenWidth, 40))
//            button.addTarget(self, action: #selector(SSTSearchView.clickedTableViewHeaderView(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//            button.tag = section
//            tempV.addSubview(button)
//
//            let linelabel = UILabel(frame: CGRectMake(0, 39, kScreenWidth, 1))
//            linelabel.backgroundColor = UIColor.groupTableViewBackgroundColor()
//
//            tempV.addSubview(linelabel)
//            
//            headerView.addSubview(tempV)
//            headerView.backgroundColor = UIColor.whiteColor()
//        }
//        
//        return headerView
//    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 40
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if searchTextField.text == "" {
//            let cell = tableView.dequeueReusableCellWithIdentifier(kSearchCellIdentifier)! as! SSTSearchViewCell
//            cell.lineView.hidden = false
//            cell.nameL.textColor = RGBA(128, g: 128, b: 128, a: 1)
//            if indexPath.row == itemData.historyKeywords.count {
//                cell.lineView.hidden = true
//                cell.nameL.textColor = RGBA(65, g: 105, b: 225, a: 1)
//                cell.name = "Clear All"
//            } else {
//                if indexPath.row >= itemData.historyKeywords.count {
//                    
//                } else {
//                    cell.name = itemData.historyKeywords[indexPath.row]
//                }
//            }
//            return cell
//        } else {
//            var cell = tableView.dequeueReusableCellWithIdentifier(kItemCellIdentifier)
//            if cell == nil {
//                cell = UITableViewCell(style: .Default, reuseIdentifier: kItemCellIdentifier)
//                
//                let nameLabel = UILabel(frame: CGRect(x: 40, y: 10, width: kScreenWidth - 60, height: 20))
//                nameLabel.font = UIFont.systemFontOfSize(12)
//                nameLabel.tag = 1001
//                cell!.addSubview(nameLabel)
//                
//                let bottomLine = UIView(frame: CGRect(x: 40, y: 39, width: kScreenWidth - 40, height: 1))
//                bottomLine.backgroundColor = UIColor.groupTableViewBackgroundColor()
//                cell!.addSubview(bottomLine)
//            }
//            
//            (cell!.viewWithTag(1001) as! UILabel).text = (itemData.groups![indexPath.section].items[indexPath.row] as! SSTItem).name
//            return cell!
//        }
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        
//        if searchTextField.text == "" {
//            if indexPath.row < itemData.historyKeywords.count {
//                self.removeFromSuperview()
//                if self.backFromSearch != nil {
//                    self.backFromSearch!(searchKey: itemData.historyKeywords[indexPath.row], item: nil)
//                }
//            } else {
//                itemData.removeAllHistory()
//                tableView.reloadData()
//            }
//        } else {
//            let item = itemData.groups![indexPath.section].items[indexPath.row] as! SSTItem
//            self.removeFromSuperview()
//            if self.backFromSearch != nil {
//                self.backFromSearch!(searchKey: nil, item: item)
//            }
//        }
//    }
//    
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        searchTextField.resignFirstResponder()
//    }
//}
//
//// MARK: -- refreshUI delegate
//extension SSTSearchView: SSTUIRefreshDelegate {
//    
//    func refreshUI(data: AnyObject?) {
//        SSTProgressHUD.dismiss()
//        sectionsExpanded.removeAll()
//        tableView.reloadData()
//    }
//}
//
