//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Mohammad Jashem on 8/24/22.
//

import Foundation

struct EmojiArtModel {
    var background = Background.blank
    var emojis = [Emoji]()
    
    struct Emoji: Identifiable,  Hashable {
        let text: String
        var x: Int
        var y: Int
        var size: Int
        let id: Int
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int){
            self.id = id
            self.text = text
            self.x = x
            self.y = y
            self.size = size
        }
    }
    
    init( ){ }
    
    private var uniqueEmojiId: Int =  0
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y:  Int), size:  Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: uniqueEmojiId))
    }
}
