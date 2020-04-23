//
//  FilterTagCellView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/23/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//
import Foundation
import SwiftUI
 

struct FilterTagCellView: View {
    
    @Binding var query: [UUID: Tag]
    @State var tag: Tag
    @State var selected: Bool
    
    static func initSelected(query: [UUID : Tag], tag: Tag) -> Bool {
        if query[tag.id] != nil {
            return true
        } else {
            return false
        }
    }

    
    func switchSelect() {
        if query[tag.id] != nil {
            selected = false
            query.removeValue(forKey: tag.id)
            return
        }
        query[tag.id] = tag
        selected = true
        
       
    }
    
    
    
    var body: some View {
            
        var textColor: Color = self.tag.color
        var bgColor: Color = .white
        if (self.selected) {
            textColor = .white
            bgColor = self.tag.color
        }
        
        return Button(action: {
            self.switchSelect()
        }) {
            HStack(alignment: .center){
               HStack(alignment: .center){
                    Image(systemName: "sun.min").resizable().frame(width: 20, height: 20, alignment: .trailing).foregroundColor(textColor).padding(.trailing, 7)
                Text(self.tag.name)
                    .font(Font.custom("Rubik-Medium", size: 20))
                    .foregroundColor(textColor)
                }
                Spacer()
                
                Image(systemName: self.selected ? "minus.square.fill" : "plus.square").resizable().frame(width: 25, height: 25, alignment: .trailing).foregroundColor(textColor)
            }.padding(.horizontal, 10).frame(height: 50, alignment: .center)
            
        }.background((self.selected ? bgColor : Color(UIColor.clear)).cornerRadius(5)).padding(.horizontal, -5)
        
    }
        
    
}

