//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mohammad Jashem on 4/19/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
