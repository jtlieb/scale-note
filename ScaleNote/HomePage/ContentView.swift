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
    @State var query: [UUID: Tag] = Dictionary<UUID, Tag>()
    
    func getQueryTags() ->  [Tag] {
        var iter = self.query.makeIterator()
        var rtrn: [Tag] = []
        while let x = iter.next() {
            rtrn.append(x.value)
        }
        return rtrn

    }
    
    func filteredNotes() -> [Note] {
        var arr: [Note] = []
        for note in state.state.notes {
            if matchesQuery(note: note) {
                arr.append(note)
            }
        }
        return arr
    }
    
    
    
    func matchesQuery(note: Note) -> Bool {
        var tags = getQueryTags()
        if (tags.count == 0) {
            return true
        }
        print(tags.count)
        for tag in note.tags {
            for t in tags {
                if (t.name == tag.name) {
                    return true
                }
            }
        }
        return false
    }
    
    @EnvironmentObject private var state: NoteState
    @State var filtering: Bool = false
    
    
    var body: some View {
        
        return NavigationView {
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
                
                HStack {
                    
                    ForEach(self.getQueryTags()) { tag in
                    ZStack(alignment: .leading) {
                        HStack {
                        Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 14, height: 14)
                            .padding(.leading, 10)
                        .foregroundColor(.white)
                        if tag is Scale {
                            Text("\((tag as! Scale).min)").font(Font.custom("Rubik-Bold", size: 14)).foregroundColor(.white)
                                .padding(.leading, 5).padding(.vertical, 5)
                        }
                        Text(tag.name).font(Font.custom("Rubik-Medium", size: 14)).foregroundColor(.white)
                            .padding(.horizontal, 10).padding(.vertical, 5).frame(height: 30)
                        }
                    }.background(Rectangle().foregroundColor(tag.color).cornerRadius(2))}
                    Button(action: {
                        self.filtering.toggle()
                    }){
                        HStack {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                        .resizable()
                            .frame(width: 14, height: 14)
                        .padding(.trailing, self.query.isEmpty ? 0 : 5)
                        .foregroundColor(.white)
                        if (self.query.isEmpty) {
                         Text("Filter By Tags").font(Font.custom("Rubik-Medium", size: 14)).foregroundColor(.white)
                            }
                    }.padding(.horizontal, 10).padding(.vertical, 5).background(Rectangle().foregroundColor(.gray)).cornerRadius(2)}.sheet(isPresented: self.$filtering) {
                        FilterTagsView(query: self.$query, filtering: self.$filtering).environmentObject(self.state)
                    }
                    Spacer()
                    
                }.padding(.leading, 20)
                
                    
                List(self.filteredNotes()) { note in
                    NoteCellView(note: note).environmentObject(self.state)
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
