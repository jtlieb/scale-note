//
//  FilterTagsView.swift
//  ScaleNote
//
//  Created by Justin Lieb on 4/23/20.
//  Copyright © 2020 Justin Lieb. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterTagsView: View {
    @Binding var query: [UUID: Tag]
    @EnvironmentObject private var state: NoteState
    @State var filterTags: [Tag] = []
    @Binding var filtering: Bool
    
    func done() {
        filtering.toggle()
    }
    
    var body: some View {
        VStack() {
            HStack(alignment: .top){
               Text("Filter Notes")
                   .font(Font.custom("SuezOne-Regular", size: 36))
               Spacer()
               
                Button(action: self.done) {
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.top, 10)
                    .padding(.trailing, 23)
                    .foregroundColor(.appGreen)
                .padding(.bottom, 30)
                
                    }
                }.padding(.horizontal, 20).padding(.bottom, 15)
            .padding(.top, 100)
            FilterTagsListView(query: self.$query).environmentObject(self.state)
        }
        }
        
    }


struct FilterTagWrapperView: View {
    @Binding var query: [UUID: Tag]
    var tag: Tag
    @EnvironmentObject private var state: NoteState
    
    var body: some View {
        Group{if tag is Scale {
            FilterScaleCellView(query: self.$query, scale: tag as! Scale, selected: FilterTagCellView.initSelected(query: self.query, tag: tag))
        } else {
            FilterTagCellView(query: self.$query, tag: tag, selected: FilterTagCellView.initSelected(query: self.query, tag: tag))
            
        }
        }
    }
}

struct FilterTagsListView: View {
    @Binding var query: [UUID: Tag]
    @EnvironmentObject private var state: NoteState
    
    init(query: Binding<[UUID: Tag]>) {
        
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance()
        self._query = query
    }
    
    var body: some View {
        List(self.state.state.tags) { tag in
            FilterTagWrapperView(query: self.$query, tag: tag)
        }
    }
}

