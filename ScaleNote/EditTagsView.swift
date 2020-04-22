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
    @Binding var tags: [Tag]
    @Binding var scales: [Scale]
    
    var body: some View {
        VStack() {
            HStack(alignment: .top){
               Text("Edit Tags")
                   .font(Font.custom("SuezOne-Regular", size: 36))
               Spacer()
                Button(action: {
                }) {
                Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.top, 10)
                .foregroundColor(.appGreen)
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, -20)
            Spacer()
            List(tags) { tag in
                Text(tag.name)
            }
            
        }
        
    }
}

struct EditTagsView_Previews: PreviewProvider {
    
    @State var note = Note(title: "title", content: "String", tags: [], scales: [])
    @State var tags = []
    @State var scales = []
    static var previews: some View {
        Text(" hi")
    }
}
