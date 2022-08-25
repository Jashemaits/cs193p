//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Mohammad Jashem on 8/24/22.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
