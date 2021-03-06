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
    
    func getCharacters(baseURL: String, queryItems: [URLQueryItem]?, completion: @escaping (NetworkResponse<Container>) -> Void)
}

extension NetworkRequestable {
    var alamofireSessionManager: Alamofire.SessionManager {
        return appAlamofire
    }
    
    func getCharacters(baseURL: String, queryItems: [URLQueryItem]?, completion: @escaping (NetworkResponse<Container>) -> Void) {
        let route = "/v1/public/characters"
        let endPoint = "\(baseURL)\(route)"
        
        guard var urlComponents = URLComponents(string: endPoint) else { return }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else { return }
        
        alamofireSessionManager.request(url)
            .validate()
            .responseObject(queue: DispatchQueue.global()) { (response: DataResponse<Container>)
            in
            switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error as? URLError))
                }
            }
    }
}
