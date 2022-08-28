//
//  Selection.swift
//  EmojiArt
//
//  Created by Mohammad Jashem on 8/28/22.
//

import SwiftUI

struct Selection<T>: ViewModifier where T : Hashable, T : Identifiable {
    var selectedItems: Set<T>
    var item: T
    
    func body(content: Content) -> some View {
        if selectedItems.contains(item) {
            content.border(.black, width: 1)
        }
        content
    }
}

extension View {
    func selection<T>(selectedItems: Set<T>, item: T) -> some View where T:  Hashable, T : Identifiable {
        self.modifier(Selection(selectedItems: selectedItems, item: item))
    }
}
