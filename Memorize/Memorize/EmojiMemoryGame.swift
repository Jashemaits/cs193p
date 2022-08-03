//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mohammad Jashem on 5/18/22.
//

import SwiftUI

class EmojiMemoryGame:  ObservableObject {
    
    init(){
        let newTheme = EmojiMemoryGame.chooseTheme()
        theme = newTheme
        model = EmojiMemoryGame.createMemoryGame(theme: newTheme)
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) {cards, index, numberOfPairOfCards  in
            if(numberOfPairOfCards == theme.emojis.count){
                return theme.emojis[index]
            }
            for emoji in theme.emojis.shuffled() {
                if !cards.contains(where: {$0.content == emoji}){
                    return emoji
                }
            }
            return theme.emojis.randomElement()!
        }
    }
    
    static func chooseTheme() -> Theme {
        Theme.themes.randomElement()!
    }
    
    @Published private var model: MemoryGame<String>
    @Published private var theme: Theme
    
    var themeName: String {
        theme.name
    }
    
    var ThemeColor: Color {
        switch theme.color {
            case "orange":
                return .orange
            case "green":
                return .green
            case "pink":
                return .pink
            default:
                return .red
        }
    }
    
    var score: Int {
        model.score
    }

    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func startNewGame() {
        let newTheme = EmojiMemoryGame.chooseTheme()
        theme = newTheme
        model = EmojiMemoryGame.createMemoryGame(theme: newTheme)
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
