//
//  ScaleCellView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/22/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

struct ScaleCellView: View {
    
    
    @EnvironmentObject private var state: NoteState
    @Binding var note: Note
    @State var scale: Scale
    @State var selected: Bool
    
     func switchSelect() {
           if note.tags.count != 0 {
               for i in 0..<note.tags.count {
                   if note.tags[i] == scale {
                       note.tags.remove(at: i)
                       selected = false
                       return
                   }
               }
           }
           note.tags.append(scale)
           selected = true
        if note.scores.index(forKey: self.scale.id) != nil {
            return
        } else {
            note.scores.updateValue(((self.scale.min + self.scale.max) / 2), forKey: self.scale.id)
        }
           return
       }
       
       
       
       var body: some View {
               
           var textColor: Color = self.scale.color
           var bgColor: Color = .white
           if (self.selected) {
               textColor = .white
               bgColor = self.scale.color
           }
           
           return Button(action: {
               self.switchSelect()
           }) {
            VStack() {
                HStack(alignment: .top){
                    HStack(alignment: .center){
                        Image(systemName: "speedometer").resizable().frame(width: 20, height: 20, alignment: .trailing).foregroundColor(textColor).padding(.trailing, 7)
                        Text(self.scale.name)
                        .font(Font.custom("Rubik-Medium", size: 20))
                        .foregroundColor(textColor)
                        Spacer()
                    
                    Image(systemName: self.selected ? "minus.square.fill" : "plus.square").resizable().frame(width: 25, height: 25, alignment: .trailing).foregroundColor(textColor)
                    }
                }.padding(.horizontal, 10).padding(.top, 15)
            }
            if(self.selected) {
                HStack(){
                    Text("\(scale.min)").font(Font.custom("Rubik-Regular", size: 16)).frame(width: 30, alignment: .center).opacity(0.7)
                    Text("\(self.note.scores[self.scale.id] ?? 0)").font(Font.custom("Rubik-Bold", size: 30)).frame(width: 50, alignment: .center)
                    Text("\(scale.max )").font(Font.custom("Rubik-Regular", size: 16)).frame(width: 30, alignment: .center).opacity(0.7)
                    Spacer()
                        ToggleView(scale: self.$scale, note: self.$note)
                    
                }.padding(20).padding(.top, -10)
            }
            
                
            }.background((self.selected ? bgColor : Color(UIColor.clear)).cornerRadius(5)).padding(.horizontal, -5).frame(height: self.selected ? 140
            : 50, alignment: .top)
        
        
    }
    
    
}

struct ToggleView: View {
    @Binding var scale: Scale
    @Binding var note: Note
    
    func add() {
        guard let x = note.scores[scale.id]else { return }
        let next = min(scale.max, x + 1)
        note.scores.updateValue(next, forKey: scale.id)
    }
    func subtract() {
        guard let x = note.scores[scale.id]else { return }
        let next = max(scale.min, x - 1)
        note.scores.updateValue(next, forKey: scale.id)
    }
    
    var body: some View {
        VStack(alignment: .leading){
        HStack(){
            
            Stepper("Scale Stepper", onIncrement: {
                self.add()
                    print(self.scale.value)
             }, onDecrement: {
                self.subtract()
                }).frame(width: 120, height: 60).labelsHidden()
        }    }
    }
        
}

