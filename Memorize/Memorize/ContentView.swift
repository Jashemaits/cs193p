//
//  ContentView.swift
//  Memorize
//
//  Created by Mohammad Jashem on 4/19/22.
//

import SwiftUI

enum Theme {
    case vehicles
    case insects
    case shapes
}

struct ContentView: View {
    var vehicleEmojis = ["🚂", "🚀", "🚁", "🛻", "✈️", "🚘", "🚌", "🚜", "🏎", "🚑", "🛴", "🚡"]
    var insectEmojis = ["🦋", "🐝", "🐞", "🐜", "🦗", "🕷", "🦟", "🪰", "🪲", "🪳", "🕸", "⾍"]
    var shapeEmojis = ["🌙", "🔴", "🔻", "🔸", "⚪️", "🔺", "💠", "⬜️", "⟅", "𑗊", "𐲱", "Ⳑ"]
    
    @State var chosenTheme = Theme.vehicles;
    
    var emojis : [String] {
        switch chosenTheme {
        case .insects:
            return insectEmojis.shuffled()
        case .shapes:
            return shapeEmojis.shuffled()
        default:
            return vehicleEmojis.shuffled()
        }
    }
    
    func changeTheme(_ theme: Theme){
        chosenTheme = theme;
    }
    
    var emojiCount : Int {
        switch chosenTheme {
        case .insects:
            return Int.random(in: 8..<insectEmojis.count);
        case .shapes:
            return Int.random(in: 8..<shapeEmojis.count);
        default:
            return Int.random(in: 8..<vehicleEmojis.count);
        }
    }
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                Spacer()
                BottomNavItemView(systemImage: "car", label: "Vehicles") {
                    changeTheme(.vehicles)
                }
                Spacer()
                BottomNavItemView(systemImage: "ladybug", label: "Insects") {
                    changeTheme(.insects)
                }
                Spacer()
                BottomNavItemView(systemImage: "seal", label: "Shapes") {
                    changeTheme(.shapes)
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20);
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct BottomNavItemView: View {
    var systemImage: String
    var label: String
    var onTap: () -> Void
    
    var body: some View {
        VStack{
            Image(systemName: systemImage).font(.largeTitle)
            Text(label).font(.caption)
        }
        .foregroundColor(.accentColor)
        .onTapGesture (perform: onTap)
    }
}


























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
