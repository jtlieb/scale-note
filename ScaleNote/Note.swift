//
//  Note.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/16/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation

struct Note {
    var date: Date
    var title: String
    var content: String
    var tags: [String]
    var scales: [Scale]
}


struct Scale {
    var name: String
    var value: Int
    var max: Int
    var min: Int
}



