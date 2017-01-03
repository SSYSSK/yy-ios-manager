//
//  SSTAPPMacro.swift
//  sst-ios
//
//  Created by Amy on 16/4/20.
//  Copyright © 2016年 SST. All rights reserved.
//

import UIKit
import AlamofireImage

import AudioToolbox
import AssetsLibrary
import Photos



#if DEV
let kBaseURLString       = "http://webdev05.sstparts.com:8088/sst-mobile/sst/api/"
let kBaseImageURL        = "http://webdev05.sstparts.com:81/thumb127x127/"
#elseif QA

#else
let kBaseURLString       = "http://localhost:8080/yy-manager-web/"
let kBaseImageURL        = "http://webdev05.sstparts.com:81/thumb127x127/"

#endif

enum TabIndexType: Int {
    case Home = 0
    case Category = 1
    case Deal = 2
    case Cart = 3
    case More = 4
}

enum NotificationInfoType: Int {
    case Search = 0
    case Deal = 1
    case Item = 2
    case Web = 3
}

enum NotificationEnableStatus: String {
    case On = "On"
    case Off = "Off"
}

enum HomeSeeAllType: String {
    case deals = "Deals"
    case newArrival = "New Arrival"
    case featureProducts = "Feature Products"
}

// MARK: - Cache路径
public let kCachePath: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!

//MARK:--屏幕大小
let kScreenBounds: CGRect   = UIScreen.main.bounds
let kScreenWidth            = UIScreen.main.bounds.size.width
let kScreenHeight           = UIScreen.main.bounds.size.height
let kScreenNavigationHeight = CGFloat(64)
let kProkScreenWidth        = UIScreen.main.bounds.size.width/375
let kProkScreenHeight       = UIScreen.main.bounds.size.height/667

//let RGBA(r, g, b, a) = UIColor(red: (r)/255.0, green: (g)/255.0, blue: 2(b)/255.0, alpha: (a))

//MARK:--设备尺寸

let currentModeSize = UIScreen.main.currentMode?.size
let iPhone4s = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize(width: 640, height: 960).equalTo(currentModeSize!) : false

let iPhone5 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize(width: 640, height: 1136).equalTo(currentModeSize!) : false
let iPhone6 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize(width: 750,  height: 1334).equalTo(currentModeSize!) : false
let iPhone6Plus = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo(currentModeSize!) : false

let kNameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]

let kAppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let kAppBuild = Bundle.main.infoDictionary!["CFBundleVersion"] as! String

let NavigationH: CGFloat = 64
let HotViewMargin: CGFloat = 10
let ShopCarRedDotAnimationDuration: TimeInterval = 0.2
let kUserIdValue            = "1111"
let kSearchItemPageSize     = 10
let kSearchOrderPageSize    = 10
let kPageSize = 10
let kFontSize: CGFloat = 13

let kSearchSplitString      = "###"
let kCollectionCellSpacingFive: CGFloat = 1
let kOneInMillion = 0.000001
let OrderSource =  0 // 订单来源 ，0=官方，1=ebay

//
let kSearchBarPlaceholderText = "type in what you're searching for ..."
let Loading = "Loading..."

let kDateFormatFromString = "yyyy-MM-dd HH:mm:ss Z" // "EEE MMM dd HH:mm:ss zzz yyyy"
let kDateFormatToString = "MM/dd/yyyy HH:mm"

let isFirstLaunch = false
let kIsFirstLaunchKey = "isFirstLaunch"
//网络请求超时限制
let kTimeoutInterval: Double = 30  //30s
let kTimeoutForTest: Double = 60

//MARK:--缓存购物车的文件名
let kHomeFileName       = "home.data"
let kCategoryFileName   = "category.data"
let kCartFileName       = "cart.data"
let kAvatarFileName     = "avatar.data"
let kCountryFileName    = "countries.data"
let kPaypalConfirmationFileName = "paypal_confirmation.data"
let kUserFileName       = "user.data"
let kFavoriteFileName   = "favorite.data"

//MAKR:--缓存图片名
let kIconBackImgName                = "icon_back_gray"
let kHomeSlidePlaceholderImgName    = "category_placeholder"
let kHomeDailyDealPlaceholder       = "dailyDeals1"
let kCategoryPlaceholderImgName     = "category_placeholder"
let kItemPlaceholderImgName         = "iphone1"
let kItemThumbnailImageName         = "iphone"
let kPromoItemPlaceholderImgName    = "ihpone"
let kDefaultImageName               = "item_detail"
let kItemDetailPlaceholderImageName = "home_item"
let kGuidePlaceholderImgName        = "guide1"
let kIconGoInImageName              = "icon_goIn"
let kIconExpandImageName            = "icon_expand"
let kIconCollapseImageName          = "icon_collapse"

let kIcon_loading                   = "icon_loading"

let kIcon_slide                   = "home_icon_slide"

//let kNotification = "notification"
//let kNotificationTime = "notificationTime"
//var kNotificationStatus = "ON"
let kNotificationLastPromptDate = "notificationDate"

let kkeyboardDidShowStatus = "keyboardDidShowStatus"

let pathOfCaches = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first

// 存储搜索关键字的历史记录
let kSearchHistoryKeywordsFileName = "SSTHistorySearchKeyword"
let kAppUserToken = "userToken"
let kUserTokenType = "tokenType" //true: userToken, false: guestToken
let kFirstName = "firstName" //user's first name

let kBlueColor = UIColor(red: 69/255.0, green: 132/255.0, blue: 244/255.0, alpha: 1)
let kSectionBgColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1)
let kLightGrayColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
let kDarkGaryColor  = UIColor(red: 130/255.0, green: 130/255.0, blue: 130/255.0, alpha: 1)

//系统时间
let kSystemDateKey       = "systemKey"
let kStoryBoard_Home     = "Home"
let kStoryBoard_Category = "Category"
let kStoryBoard_Deals    = "Deals"
let kStoryboard_Cart     = "Cart"
let kStoryBoard_More     = "More"
let kStoryBoard_Login    = "Login"
enum ImageType {
    case LocalImageType,WebImageType
}

enum SelectedTypeInCart:Int {
    case BestSellingType = 0, MostPopularType
}

//MARK: 快速生成颜色
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

//MARK:--手机震动
func SHAKEPHONE () {
    let soundID = SystemSoundID(kSystemSoundID_Vibrate)
    //振动
    AudioServicesPlaySystemSound(soundID)
}

func GET_StoryBoard (sbName : String) -> UIStoryboard {
    return UIStoryboard(name: sbName, bundle: Bundle.main)
}

func getProductImagePath(imagePath: String?) -> String {
    if imagePath == nil {
        return ""
    }
    return  kBaseImageURL + imagePath!
}

func loadNib(nibName: String) -> AnyObject? {
    return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)!.first as AnyObject?
}

func initNib(nibName: String) -> UINib {
    return UINib(nibName: "\(nibName)", bundle: nil)
}

func validBool(data: AnyObject?) -> Bool {
    if data == nil {
        return false
    } else {
        return data as! Bool
    }
}

func validString(data: AnyObject?) -> String {
    if data == nil {
        return ""
        
    } else if data!.isKind(of: NSString.self) {
        return data as! String
    } else if data!.isKind(of: NSNumber.self) {
        return data!.stringValue
    }
    return ""
}

func validDouble(data: AnyObject?) -> Double {
    if data == nil {
        return 0
    } else if data!.isKind(of: NSNumber.self) {
        return data!.doubleValue
    } else if data!.isKind(of: NSString.self)  {
        return data!.doubleValue
    }
    return 0
}

func validInt(data: AnyObject?) -> Int {
    if data == nil {
        return 0
    } else if data!.isKind(of: NSNumber.self) {
        return data!.integerValue
    } else if data!.isKind(of: NSString.self)  {
        return data!.integerValue
    }
    return 0
}

func validInt64(data: AnyObject?) -> Int64 {
    if data == nil {
        return 0
    } else if data!.isKind(of: NSNumber.self) {
        return data!.longLongValue
    } else if data!.isKind(of: NSString.self)  {
        return data!.longLongValue
    }
    return 0
}

func validNSDictionary(data: AnyObject?) -> NSDictionary {
    if data == nil {
        return NSDictionary()
    }
    if data!.isKind(of: NSDictionary.self) {
        return data as! NSDictionary
    }
    return NSDictionary()
}

func validDictionary(data: AnyObject?) -> Dictionary<String,AnyObject> {
    if data == nil {
        return Dictionary()
    }
    if data!.isKind(of: NSDictionary.self) {
        return data as! Dictionary
    }
    return Dictionary()
}

func validNSArray(data: AnyObject?) -> NSArray {
    if data == nil {
        return NSArray()
    }
    if data!.isKind(of:NSArray.self) {
        return data as! NSArray
    }
    return NSArray()
}

func validArray(data: AnyObject?) -> Array<AnyObject> {
    if let r = data as? Array<AnyObject> {
        return r
    }
    return Array()
}

extension Int64 {
    func format(f: Int! = 2) -> String {
        var r = String(self)
        let cnt = f - r.characters.count
        if cnt > 0 {
            var zeros = ""
            for _ in 0 ..< cnt {
                zeros = "0" + zeros
            }
            r = zeros + r
        }
        return r
    }
}

extension NSArray {
    func validObjectAtIndex(index: Int) -> AnyObject? {
        if index < self.count {
            return object(at: index) as AnyObject?
        } else {
            return nil
        }
    }
}

extension Array {
    func validObjectAtIndex(index: Int) -> AnyObject? {
        if index < self.count {
            return self[index] as AnyObject
        } else {
            return nil
        }
    }
}

extension UIImageView {
    func setImage(fileUrl: String, placeholder: String? = nil) {
        var image: UIImage? = nil
        if placeholder != nil {
            image = UIImage(named: placeholder!)
        }
        if fileUrl.isEmpty {
            self.image = image
        } else {
            if var mURL = NSURL(string: fileUrl) {
                if validString(data: mURL.scheme as AnyObject?) == "" {
                    mURL = NSURL(string: getProductImagePath(imagePath: fileUrl))!
                }
                self.af_setImage(withURL: mURL as URL, placeholderImage: image)
            }
        }
    }
}

extension NSDate {
    
    //"Wed Nov 09 16:59:38 CST 2016"
    static func formatTime(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = kDateFormatFromString
        dateFormatter.timeZone = NSTimeZone(abbreviation:"CST") as TimeZone!
        let date = dateFormatter.date(from: dateString)
        return dateFormatter.string(from: date!)
    }
    
    static func fromString(dateString: String) -> NSDate? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = kDateFormatFromString
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!
        let originDate = dateFormatter.date(from: dateString)
        
        let localTimeZone = NSTimeZone.system
        let interval = localTimeZone.secondsFromGMT()
        
        return originDate?.addingTimeInterval(TimeInterval(interval)) as NSDate?
        
    }
    func format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = kDateFormatToString
        return dateFormatter.string(from: self as Date)
    }
    func getJsonObject(data: NSData) -> AnyObject? {
        return try! JSONSerialization.jsonObject(with: data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as AnyObject?
    }
}

//根据Key获取UserDefault的内容
func getUserDefautsData(name: String) -> AnyObject? {
   return  UserDefaults.standard.object(forKey: name) as AnyObject?
}

//获取字符串的高度
func getStringHeight(str: String, font: NSInteger, width: CGFloat) -> CGFloat {
    let font = UIFont.systemFont(ofSize: CGFloat(font))
    let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineBreakMode = .byWordWrapping;
    let attributes = [NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy()]
    let text = str
    let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
    return rect.size.height + 2
}

func printDebug(msg: String) {
#if DEV
    print(msg)
#endif
}

//给view添加阴影
func shadowView(view: UIView, height: CGFloat, direction: CGFloat) {
    view.layer.shadowOffset = CGSize(width: direction,height:  height)
    view.layer.shadowOpacity = 0.4
    view.layer.shadowColor = UIColor.gray.cgColor
}

func toJsonString(object: AnyObject) -> String {
    if let jsonData = try? JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted) {
        if let rString = String(data: jsonData, encoding: String.Encoding.utf8) {
            printDebug(msg: "JSON String: \(rString)")
            return rString
        }
    }
    return ""
}

//func setLocalNotificationView() {
//    if UIApplication.sharedApplication().currentUserNotificationSettings()?.types == UIUserNotificationType.None {
//        NSUserDefaults.standardUserDefaults().setObject("\(NotificationStatus.hidden)", forKey: kNotification)
//        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: kNotificationTime)
//    } else {
//        NSUserDefaults.standardUserDefaults().setObject("\(NotificationStatus.show)", forKey: kNotification)
//    }
//}

func isCanUsePhotos()->Bool{
    if validDouble(data: UIDevice.current.systemVersion as AnyObject?) < 8.0  {
        let author = ALAssetsLibrary.authorizationStatus()
        if author ==  .restricted || author == .denied{
            return false
        }
    }else{getUserDefautsData(name: kNotificationLastPromptDate)
        let status = PHPhotoLibrary.authorizationStatus()
        if status ==  .restricted || status == .denied{
            return false
        }
    }
    return true
}

func isCanUseCamera()->Bool{
    
    let author = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
    if (author == .restricted || author == .denied){
        //无权限
        return false
    }else{
        return true
    }
}
