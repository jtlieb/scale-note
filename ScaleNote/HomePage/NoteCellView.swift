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
    
    var note: Note
    @Binding var isNavigationHidden: Bool
    
    var body: some View {
        ZStack {
            NavigationLink( "EditNote", destination: NoteView(isNavigationHidden: self.$isNavigationHidden, note: note)).hidden();           VStack(alignment: .leading) {
                
                HStack {
                    Text("\(note.title)")
                        .font(Font.custom("Rubik-Medium", size: 20))
                        .foregroundColor(.primary)
                        .padding(.bottom, 10)
                    Spacer()
                
                }
                Text(note.content)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Rubik-Regular", size: 16))
                    .foregroundColor(.secondary)
            }.padding(.vertical, 10)
        }
    }
}
