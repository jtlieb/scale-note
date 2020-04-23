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
    @State var newNote: Note =  Note(title: "New Note", content: "Write your thoughts here", tags: [])
    
    @EnvironmentObject private var state: NoteState
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center){
                    Text("ScaleNote")
                        .font(Font.custom("SuezOne-Regular", size: 36))
                        .foregroundColor(.appPurple)
                        .padding(.leading, 20)
                    Spacer()
                    NavigationLink(destination: NoteView(isNew: true, note: self.$newNote).environmentObject(self.state)) {
                        Button(action: {
                            self.state.addNewNote(note: Note(id: UUID(), title: "New Note", content: "Write down your thoughts here...", tags: []))
                        }){
                        
                        Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .trailing)
                        .padding(.trailing, 20)
                            .foregroundColor(.appGreen)
                        }}
                }.padding(.top, -20)
                List(state.state.notes) { note in
                    NoteCellView(note: note
                    ).environmentObject(self.state)
                }
            
            }
        }.navigationBarTitle("Notes").navigationBarHidden(true).environmentObject(self.state)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
