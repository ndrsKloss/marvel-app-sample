//
//  MD5.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import Foundation

func MD5(string: String) -> String {
    let messageData = string.data(using:.utf8)!
    var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
    
    _ = digestData.withUnsafeMutableBytes {digestBytes in
        messageData.withUnsafeBytes {messageBytes in
            CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
        }
    }
    
    return digestData.map { String(format: "%02hhx", $0) }.joined()
}
