//
//  ContentView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/16/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import SwiftUI
import Foundation


struct ContentView: View {
    
    @State var count = 0
    @State var newNote: Note =  Note(title: "New Note", content: "Write your thoughts here", tags: [], scales: [])
    @State var navigationBarHidden = true
    @State var tags: [Tag] = [Tag(id: UUID(), name: "TAGGGG", color: .appPurple)]
    @State var scales: [Scale] = []
    
    @State var notes: [Note] = [Note(title: "Test Title", content: "This is the content of my note", tags: [], scales: [Scale(name: "Justin", value: 5, max: 0, min: 10, color: .appPurple)]),Note(title: "Test Title", content: "This is the content of my note", tags: [], scales: [Scale(name: "Justin", value: 5, max: 0, min: 10, color: .appPurple)])]
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center){
                    Text("ScaleNote")
                        .font(Font.custom("SuezOne-Regular", size: 36))
                        .foregroundColor(.appPurple)
                        .padding(.leading, 20)
                    Spacer()
                    NavigationLink(destination: NoteView(note: self.$newNote , tags: self.$tags, scales: self.$scales, globalNotes: self.$notes,isNew: true)) {
                        Button(action: {
                            self.notes.append(self.newNote)
                        }) {
                        Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .trailing)
                        .padding(.trailing, 20)
                            .foregroundColor(.appGreen)
                        }}
                }.padding(.top, -20)
                List(notes) { note in
                    NoteCellView(note: note, scales: self.$scales, tags: self.$tags, notes: self.$notes)
                }
            
            }
        }.navigationBarTitle("Notes").navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
