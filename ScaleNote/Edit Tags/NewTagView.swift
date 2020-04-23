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
    
    @Binding var active: Bool
    @State var isTag: Bool = true
    
    
    var body: some View {
        navigationBarItems(leading: Button("Cancel", action: {self.active.toggle()}))
    }
}
