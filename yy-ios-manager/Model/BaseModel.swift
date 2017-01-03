//
//  BaseModel.swift
//  sst-ios
//
//  Created by Zal Zhang on 6/12/16.
//  Copyright © 2016 SST. All rights reserved.
//

import UIKit




// MARK: - URLStringConvertible

/**
 Types adopting the `URLStringConvertible` protocol can be used to construct URL strings, which are then used to
 construct URL requests.
 */
public protocol URLStringConvertible {
    /**
     A URL that conforms to RFC 2396.
     
     Methods accepting a `URLStringConvertible` type parameter parse it according to RFCs 1738 and 1808.
     
     See https://tools.ietf.org/html/rfc2396
     See https://tools.ietf.org/html/rfc1738
     See https://tools.ietf.org/html/rfc1808
     */
    var URLString: String { get }
}

protocol SSTUIRefreshDelegate: class {
    func refreshUI(data: AnyObject?)
}

class BaseModel: NSObject {
    
weak var delegate: SSTUIRefreshDelegate?
    
}
