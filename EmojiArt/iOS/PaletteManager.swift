//
//  PaletteManager.swift
//  EmojiArt
//
//  Created by Mohammad Jashem on 9/13/22.
//

import SwiftUI

struct PaletteManager: View {
    @EnvironmentObject var store: PaletteStore
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var editMMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.palettes) { palette in
                    NavigationLink(destination: PaletteEditor(palette: $store.palettes[palette])) {
                        VStack(alignment: .leading) {
                            Text(palette.name)
                            Text(palette.emojis)
                        }
                    }
                }
                .onDelete { indexSet in
                    store.palettes.remove(atOffsets: indexSet)
                }
                .onMove { indexSet, newOffset in
                    store.palettes.move(fromOffsets: indexSet, toOffset: newOffset)
                }
            }
            .navigationTitle("Manage Palettes")
            .navigationBarTitleDisplayMode(.inline)
            .dismissable {
                presentationMode.wrappedValue.dismiss()
            }
            .toolbar{
                ToolbarItem { EditButton() }
            }
            .environment(\.editMode, $editMMode)
        }
    }
}

struct PaletteManager_Previews: PreviewProvider {
    static var previews: some View {
        PaletteManager()
            .previewDevice("iPhone 8")
            .environmentObject(PaletteStore(named: "Preview"))
            .preferredColorScheme(.dark)
    }
}
