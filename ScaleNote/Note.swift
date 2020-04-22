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
    var scales: [Scale]
}


struct Scale: Identifiable {
    var id = UUID()
    var name: String
    var value: Int
    var max: Int
    var min: Int
    var color: Color
}

struct Tag: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
}




