//
//  NoteCellView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/16/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

struct NoteCellView: View {
    
    @State var note: Note
    @EnvironmentObject var state: NoteState
    var body: some View {
        //VStack(alignment: .leading) {
        NavigationLink(destination: NoteView(isNew: true, note: self.$note).environmentObject(self.state)) {
            VStack(alignment: .leading) {
                Text("\(note.title)")
                    .font(Font.custom("Rubik-Medium", size: 20))
                    .foregroundColor(.primary)
                    
                HStack {
                    ForEach(self.note.tags) { tag in
                        ZStack {
                            HStack {
                            if tag is Scale {
                                Text("\(self.note.scores[tag.id] ?? 0)").font(Font.custom("Rubik-Bold", size: 14)).foregroundColor(.white)
                                .padding(.horizontal, 10).padding(.vertical, 5)
                            }
                            Text(tag.name).font(Font.custom("Rubik-Medium", size: 14)).foregroundColor(.white)
                                .padding(.horizontal, 10).padding(.vertical, 5)
                            }
                            }.background(Rectangle().foregroundColor(tag.color)).cornerRadius(2)
                    }.frame(height: 40, alignment: .leading)
                    
                }.padding(.bottom, 10)
                Text(note.content)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Rubik-Regular", size: 16))
                    .foregroundColor(.secondary)
            }
        }.padding(.vertical, 10).environmentObject(self.state)

    }
    //}
}
