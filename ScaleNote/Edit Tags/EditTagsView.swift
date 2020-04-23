//
//  EditTagsView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/22/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

struct EditTagsView: View {
    

    
    @Binding var note: Note
    @EnvironmentObject private var state: NoteState
    @State var newTag = false
    
    func getNextColor() -> Color {
        guard self.state.state.tags.count > 0 else {
           return .appGreen
        }
        switch self.state.state.tags.last!.color {
        case .appGreen:
            return .appRed
        case .appRed:
            return .appPurple
        default:
            return .appGreen
            
        }
        
    }
    
    var body: some View {
        VStack() {
            HStack(alignment: .top){
               Text("Edit Tags")
                   .font(Font.custom("SuezOne-Regular", size: 36))
               Spacer()
                Button(action: {
                    self.newTag = true
                }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.top, 10)
                    .padding(.trailing, 3)
                    .foregroundColor(.appGreen)
                }.sheet(isPresented: self.$newTag) {
                    NewTagVew(active: self.$newTag, color: self.getNextColor()).environmentObject(self.state)
                    
                }
                
            }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                .padding(.top, -20)
            Spacer()
            EditTagsListView(note: self.$note).environmentObject(self.state)
            
        }
        
    }
}

struct TagWrapperView: View {
    
    @Binding var note: Note
    var tag: Tag
    @EnvironmentObject private var state: NoteState
    
    var body: some View {
        Group{if tag is Scale {
            ScaleCellView(note: self.$note, scale: tag as! Scale, selected: TagCellView.initSelected(note: note, tag: tag))
        } else {
            TagCellView(note: self.$note, tag: tag, selected: TagCellView.initSelected(note: note, tag: tag))
            
        }
        }
    }
}

struct EditTagsListView: View {
    
    @Binding var note: Note
    @EnvironmentObject private var state: NoteState
    
    init(note: Binding<Note>) {
        self._note = note
        
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance()
    }
    
    var body: some View {
        List(self.state.state.tags) { tag in
            TagWrapperView(note: self.$note, tag: tag)
        }
    }
}

