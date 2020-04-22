//
//  NoteView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/16/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

struct NoteView: View {
    
    @Binding var note: Note
    @Binding var tags: [Tag]
    @Binding var scales: [Scale]
    @Binding var globalNotes: [Note]
    var isNew: Bool
    
    init(note: Binding<Note>, tags: Binding<[Tag]>, scales: Binding<[Scale]>, globalNotes: Binding<[Note]>, isNew: Bool) {
        self._note = note
        self._tags = tags
        self._scales = scales
        self._globalNotes = globalNotes
        self.isNew = isNew
        
        
    }
    
    var body: some View {
        return VStack(alignment: .leading) {
            HStack(alignment: .top){
                TextField(note.title, text: self.$note.title)
                .font(Font.custom("SuezOne-Regular", size: 36))
                .foregroundColor(.primary)
                .padding(.leading, 20)
                    .padding(.top, -20)
            Spacer()
            }
            NavigationLink(destination: EditTagsView(note: self.$note, tags: self.$tags, scales: self.$scales)) {
                Text("hello")
            }
           TextField(note.content, text: self.$note.content)
                    .font(Font.custom("Rubik-Regular", size: 16))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 20)
        
            Image(systemName: "pencil.circle.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .trailing)
                .padding(.trailing, 20)
                .foregroundColor(.appGreen)
            Spacer()
            
        
        }
    }
}


struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello")
    }
}
