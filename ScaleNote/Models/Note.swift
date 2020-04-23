//
//  Note.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/16/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI


struct Note: Identifiable {
    //var date: Date
    var id = UUID()
    var title: String
    var content: String
    var tags: [Tag]
    var scores = Dictionary<UUID, Int>()
}


class Scale: Tag {
    var value: Int
    var max: Int
    var min: Int
    
    enum CodingKeys<String, CodingKey> {
        case value
        case max
        
    }
    
    init(name: String, color: Color, value: Int, max: Int, min: Int) {
        self.value = value
        self.max = max
        self.min = min
        super.init(name: name, color: color)
        
    }
}


class Tag: Identifiable, Equatable {
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String
    var color: Color
    
    
    init(name: String, color: Color) {
        self.name = name
        self.color = color
        
    }
}



