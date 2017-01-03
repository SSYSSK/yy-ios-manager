//
//  NetworkAccess.swift
//  sst-ios
//
//  Created by Liang Zhang on 16/4/12.
//  Copyright © 2016年 lzhang. All rights reserved.
//

import Alamofire

public typealias RequestCallBack = ( _ data: AnyObject?,  _ error:AnyObject?) -> Void

public class NetworkAccess: NSObject {
    

    let networkReachabilityManager = NetworkReachabilityManager(host: "www.apple.com")
    let mAlamofire:SessionManager
    var mHeader:[String: String]
    
    let baseURLString = "http://webdev05.sstparts.com:8088/"
    
    private var g_Method:Alamofire.Method?
    private var g_Url: String!
    private var g_Para: [String: AnyObject]? = nil
    private var g_Callback: RequestCallBack? = nil

    public override init() {
        
        let serverTrustPolicy = ServerTrustPolicy.performDefaultEvaluation(
            validateHost: true
        )
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [

            "127.0.0.1": .disableEvaluation,
            "*.sstparts.com" : serverTrustPolicy
        ]
        // 设置请求的超时时间
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = kTimeoutInterval    // 秒
        mAlamofire = SessionManager(
            configuration: config,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
            mHeader = [
//            "Authorization": "Basic \(base64Credentials)",
            "Content-Type": "application/json",
            "dev_os_type": "1",
            "app_ver": kAppBuild,
        ]
        
//        mAlamofire.session.configuration.httpAdditionalHeaders?.updateValue("application/json",forKey: "Accept")
//        mAlamofire.session.configuration.httpAdditionalHeaders?.updateValue("application/json",forKey: "Content-Type")
    }
    
    func listen() {
        
        networkReachabilityManager?.listener = { status in
            print("Network Status Changed: \(status)")
        }
        
        networkReachabilityManager?.startListening()
    }

    public func request(method: HTTPMethod, url: String, parameters: [String: AnyObject]? = nil, callback: RequestCallBack? = nil) {
        guard (networkReachabilityManager?.isReachable) != nil else {
            SSTProgressHUD.showErrorWithStatus(error: "The network is unvaliable,please check your network")
            return
        }

        if parameters != nil {
            if !JSONSerialization.isValidJSONObject(parameters!) {
//                print("The parameters of the request with url '" + tmpUrl + "' is not a valid json object")
                return
            }
        }
 
//        mHeader["app_token"] = biz.user.token
        
        
        printDebug(msg: "url: \(url), parameters: \(parameters.debugDescription)")
        mAlamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: mHeader).validate().responseJSON { (response) in
            debugPrint(response)
//             let jsonObject : AnyObject! = try? JSONSerialization.jsonObject(with: response.data!, options:JSONSerialization.ReadingOptions.allowFragments) as AnyObject!
//            
//            print(jsonObject)
            
            switch response.result {
            case .success:
//                callback!(jsonObject["data"], nil);
                 let object : AnyObject! = try? JSONSerialization.jsonObject(with: response.data!, options:JSONSerialization.ReadingOptions.allowFragments) as AnyObject!
                 print(object)
                if let jsonObject = object {
                    let json = validDictionary(data: jsonObject as AnyObject?)
                    if validInt(data: json["status"]) == 200 {
                        callback!(json["data"], nil);
                    } else {
                        printDebug(msg: "SERVER API ERROR: " + validString(data: json["msg"]))
                        callback!(nil, json["msg"])
                    }
                }
            case .failure(let error):
                callback!(nil,  error.localizedDescription as AnyObject?)
            }
            
        }
        
        
       
    }
    
    func downloadFile() {
        

    }
    

    func uploadFile(url:String,images:[UIImage] ,titles:[String], callback: @escaping RequestCallBack){
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                for i in 0..<images.count{
                    let imageData = UIImagePNGRepresentation(images[i])!
                    multipartFormData.append(imageData, withName: "unicorn")
                }
            },
            to: url,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
            }
        )

    }
}


