//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mohammad Jashem on 4/19/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewMoel: game)
        }
    }
}
