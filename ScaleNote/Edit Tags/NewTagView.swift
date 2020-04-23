//
//  NewTag.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/23/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI


struct NewTagVew: View {
    
    
    @EnvironmentObject private var state: NoteState
    @Binding var active: Bool
    @State var isTag: Bool = true
    @State var name = ""
    @State var min = ""
    @State var max = ""
    var color: Color
    
    
    
    
    func done() {
        if isTag && name != "" {
            let newTag = Tag(name: name, color: color)
            state.newTag(tag: newTag)
            print(state.state.tags.count)
            active.toggle()
        } else if !isTag {
            let numMin = Int(min) ?? nil
            let numMax = Int(max) ?? nil
            let realName = name == "" ? nil : name
            if (numMin != nil && numMax != nil && realName != nil) {
                if (numMin! < numMax!) {
                    state.newTag(tag: Scale(name: realName!, color: color, value: numMin!, max: numMax!, min: numMin!))
                    active.toggle()
                }
            }
        }
    }
        
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top){
                Button("Cancel") {
                    self.active.toggle()
                }.font(.system(size: 20, weight: .regular, design: .default)).foregroundColor(color)
            Spacer()
            Button("Add") {
                self.done()
            }.font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(color)
                
                
            
        
            }.padding(.vertical, 10).padding(.bottom, 40)
            HStack{
                Text(isTag ? "New Tag" : "New Scale")
                .font(Font.custom("SuezOne-Regular", size: 36)).foregroundColor(color)
                Spacer()
                Image(systemName: "speedometer").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(self.color)
                Toggle("Tag or Scale", isOn: self.$isTag).labelsHidden().padding(3)
                Image(systemName: "sun.min").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(self.color)
                
            }
            
            VStack{
                TextField("Name", text: self.$name).font(Font.custom("Rubik-Regular", size: 20)).padding(.top, 20)
                if (!self.isTag) {
                    TextField("Minimum", text: self.$min).font(Font.custom("Rubik-Regular", size: 20)).padding(.top, 20).keyboardType(.numberPad)
                    TextField("Maximum", text: self.$max).font(Font.custom("Rubik-Regular", size: 20)).padding(.top, 20).keyboardType(.numberPad)
                }
            }
            
            Spacer()
        Spacer()
        }.padding(20)
        
        
    }
}
