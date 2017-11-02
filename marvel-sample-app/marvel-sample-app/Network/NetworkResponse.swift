//
//  NetworkResponse.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import Foundation

enum NetworkResponse<T: Any> {
    case failure(URLError?)
    case success(T)
}
