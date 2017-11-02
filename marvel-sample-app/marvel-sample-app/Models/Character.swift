//
//  Character.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import Foundation
import ObjectMapper

class Character: ImmutableMappable {
    var name: String = ""
    var description: String = ""
    var thumbnail: [Thumbnail]?
    
    
    required init(map: Map) throws {
        self.name = try map.value("name")
        self.description = try map.value("description")
        self.thumbnail = try? map.value("thumbnail")
    }
    
    class Thumbnail: ImmutableMappable {
        var path: String = ""
        var `extension`: String = ""
        
        required init(map: Map) throws {
            self.path = try map.value("path")
            self.`extension` = try map.value("extension")
        }
    }
}
