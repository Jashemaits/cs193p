//
//  ContentView.swift
//  Set
//
//  Created by Mohammad Jashem on 8/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Capsule().stroke().frame(width: CGFloat(100), height: CGFloat(50))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
