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
        var notes: [Note] = []
        var tags: [Tag] = []
        
        init(_ loggedInBefore: Bool) {
           

            if loggedInBefore {
                notes = UserDefaults.standard.array(forKey: "notes") as! [Note]
                tags = UserDefaults.standard.array(forKey: "tags") as! [Tag]
            } else {
                UserDefaults.standard.set(true, forKey: "loggedInBefore")
            }
            
        }
    }
    
    
    @Published private(set) var state = State(UserDefaults.standard.bool(forKey: "loggedInBefore"))
    
    func addNewNote(note: Note) {
        state.notes.insert(note, at: 0)
        //UserDefaults.standard.setValue(state.notes, forKey: "notes")
        
        
    }
    
    func newTag(tag: Tag) {
        state.tags.append(tag)
    }
    


    
    
}


