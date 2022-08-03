//
//  Theme.swift
//  Memorize
//
//  Created by Mohammad Jashem on 8/2/22.
//

import Foundation

struct Theme {
    var name: String
    var emojis: [String]
    var color: String
    var numberOfPairsOfCards: Int
    
    static let themes = [
        Theme(
            name: "Vehicle",
            emojis: ["🚂", "🚀", "🚁", "🛻", "✈️", "🚘", "🚌", "🚜", "🏎", "🚑", "🛴", "🚡"],
            color: "orange",
            numberOfPairsOfCards: 6
        ),
        Theme(
            name: "Insect",
            emojis: ["🦋", "🐝", "🐞", "🐜", "🦗", "🕷", "🦟", "🪰", "🪲", "🪳", "🕸", "⾍"],
            color: "green",
            numberOfPairsOfCards: 12
        ),
        Theme(
            name: "Shape",
            emojis: ["🌙", "🔴", "🔻", "🔸", "⚪️", "🔺", "💠", "⬜️", "⟅", "𑗊", "𐲱", "Ⳑ"],
            color: "pink",
            numberOfPairsOfCards: 8
        ),
        
    ]
}
