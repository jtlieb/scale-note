//
//  NoteView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/16/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI
import ASCollectionView

struct NoteView: View {
    @EnvironmentObject private var state: NoteState
    @State var isNew: Bool
    @Binding var note: Note
    
    
    
    var body: some View {
        
        return VStack(alignment: .leading) {
            HStack(alignment: .top){
                TextField(note.title, text: self.$note.title)
                .font(Font.custom("SuezOne-Regular", size: 36))
                .foregroundColor(.primary)
                .padding(.leading, 20)
                    
            Spacer()
            NavigationLink(destination: EditTagsView(note: self.$note).environmentObject(self.state)) {
                Image(systemName: "ellipsis.circle.fill")
                .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                .padding(.trailing, 20)
                .foregroundColor(.appGreen)
                }
            }.padding(.top, -20)
            HStack {
                ForEach(self.note.tags) { tag in
                    NavigationLink(destination: EditTagsView(note: self.$note).environmentObject(self.state)) {
                    ZStack {
                        HStack {
                        Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 14, height: 14)
                            .padding(.leading, 10)
                        .foregroundColor(.white)
                        if tag is Scale {
                            Text("\(self.note.scores[tag.id] ?? 0)").font(Font.custom("Rubik-Bold", size: 14)).foregroundColor(.white)
                                .padding(.leading, 5).padding(.vertical, 5)
                        }
                        Text(tag.name).font(Font.custom("Rubik-Medium", size: 14)).foregroundColor(.white)
                            .padding(.horizontal, 10).padding(.vertical, 5).frame(height: 30)
                        }
                        }}.background(Rectangle().foregroundColor(tag.color)).cornerRadius(2)
                }
                NavigationLink(destination: EditTagsView(note: self.$note, newTag: true).environmentObject(self.state)) {
                    HStack{
                       Image(systemName: "plus")
                       .resizable()
                           .frame(width: 14, height: 14)
                        .padding(.trailing, self.note.tags.isEmpty ? 0 : 5)
                       .foregroundColor(.white)
                        if (self.note.tags.isEmpty) {
                        Text("Add Tags").font(Font.custom("Rubik-Medium", size: 14)).foregroundColor(.white)
                        }
                    
                    }
                
                }.padding(.horizontal, 10).padding(.vertical, 5).background(Rectangle().foregroundColor(.gray)).cornerRadius(2)
                
                
            }.padding(.horizontal, 20).padding(.bottom, 15)
            
           TextField(note.content, text: self.$note.content)
                    .font(Font.custom("Rubik-Regular", size: 16))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 20)
        
            
            Spacer()
            
        
        }
    }
}


struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello")
    }
}
