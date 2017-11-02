//
//  NetworkRequestable.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

let appAlamofire: Alamofire.SessionManager = { () -> Alamofire.SessionManager in
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30
    let manager = Alamofire.SessionManager(configuration: configuration)
    return manager
}()

protocol NetworkRequestable {
    var alamofireSessionManager: Alamofire.SessionManager { get }
    
    func getCharacters(completion: @escaping (NetworkResponse<Any>) -> Void)
}

extension NetworkRequestable {
    var alamofireSessionManager: Alamofire.SessionManager {
        return appAlamofire
    }
    
    func getCharacters(completion: @escaping (NetworkResponse<Any>) -> Void) {
        
    }
}
