//
//  ContentView.swift
//  Memorize
//
//  Created by Mohammad Jashem on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewMoel: EmojiMemoryGame
    
    var body: some View {
            ScrollView {
                HStack(alignment: .center){
                    Text(viewMoel.themeName).font(.largeTitle)
                    Spacer()
                    Text("\(viewMoel.score)")
                    Spacer()
                    Button(action: viewMoel.startNewGame) {
                        Text("New Game")
                    }
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewMoel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewMoel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewMoel.ThemeColor)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20);
        ZStack {
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
            
        }
    }
}


























struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewMoel: game)
            .preferredColorScheme(.dark)
        ContentView(viewMoel: game)
            .preferredColorScheme(.light)
    }
}
