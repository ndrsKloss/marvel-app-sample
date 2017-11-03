//
//  Container.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import Foundation
import ObjectMapper

class Container: ImmutableMappable {
    var data: Data?
    
    required init(map: Map) throws {
        self.data = try? map.value("data")
    }
    
    class Data: ImmutableMappable {
        var characters: [Character]?
        var total: Int?
        
        required init(map: Map) throws {
            self.characters = try? map.value("results")
            self.total = try? map.value("total")
        }
    }
}
