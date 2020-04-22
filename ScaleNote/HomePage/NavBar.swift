//
//  NavBar.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/16/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

struct Title: View {
    
    var body: some View {
        HStack(alignment: .center){
            Text("ScaleNote")
                .font(Font.custom("SuezOne-Regular", size: 36))
                .foregroundColor(.appPurple)
            Spacer()
        }
    }
    
}

struct NewNoteButton: View {
    
    
    var body: some View {
        Button(action: {
            print("test")
        }) {
            Image(systemName: "pencil.circle.fill")
            .resizable()
            .frame(width: 30, height: 30, alignment: .trailing)
            .foregroundColor(.appGreen)
        }
    }
}
