//
//  Selection.swift
//  EmojiArt
//
//  Created by Mohammad Jashem on 8/28/22.
//

import SwiftUI

struct Selection: ViewModifier {
    var selectedItems: Set<EmojiArtModel.Emoji>
    var item: EmojiArtModel.Emoji
    
    func body(content: Content) -> some View {
        if selectedItems.contains(where: {$0.id == item.id}) {
            content.border(.black, width: 1)
        }
        content
    }
}

extension View {
    func selection(selectedItems: Set<EmojiArtModel.Emoji>, item: EmojiArtModel.Emoji) -> some View {
        return modifier(Selection(selectedItems: selectedItems, item: item))
    }
}
