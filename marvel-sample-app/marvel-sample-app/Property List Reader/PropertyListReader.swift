//
//  PropertyListReader.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import Foundation

func readPlist(file: String) -> [String: Any]? {
    var propertyListForamt =  PropertyListSerialization.PropertyListFormat.xml
    
    guard let data = FileManager.default.contents(atPath: file) else { return nil }

    guard let dictionary = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: &propertyListForamt) as? [String: Any] else {
        return nil
    }
    
    return dictionary
}
