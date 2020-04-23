//
//  GlobalState.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/22/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

class NoteState: ObservableObject {
    
    struct State {
        var notes: [Note]
        var tags: [Tag]
    }
    
    @Published private(set) var state = State(notes: [], tags: [Tag(name: "NAME OF TAG", color: .appRed),Scale(name: "NAME OF SCALE TWO", color: .appPurple, value: 0, max: 5, min: -5),Scale(name: "NAME OF SCALE THREE", color: .appGreen, value: 0, max: 5, min: -5)])
    
    func addNewNote(note: Note) {
        state.notes.insert(note, at: 0)
    }
    
    func newTag(tag: Tag) {
        state.tags.append(tag)
    }
    

    
    
}
