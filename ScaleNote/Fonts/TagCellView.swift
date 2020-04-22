//
//  TagCellView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/22/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

struct TagCellView: View {
    
    @Binding var tag: Tag
    @State var selected: Bool
    
    var body: some View {
        if (selected) {
        return HStack(alignment: .center) {
            Text(tag.name) .font(Font.custom("Rubik-Medium", size: 20))
                .foregroundColor(.white)
               .padding(.bottom, 10)
        }.foregroundColor(tag.color)
        } else {
            return HStack(alignment: .center) {
                Text(tag.name) .font(Font.custom("Rubik-Medium", size: 20))
                    .foregroundColor(tag.color)
                   .padding(.bottom, 10)
            }.foregroundColor(.white)
        }
        
        
        
    }
}
