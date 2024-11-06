//
//  ContentView.swift
//  ScroreKeeper
//
//  Created by Ty Tran on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var players : [String] = ["Elisha", "Andre", "Jasmine"]

    var body: some View {
        VStack {
            ForEach(0..<players.count, id: \.description) { index in
                TextField("Name", text: $players[index])
            }
            Button("Add Player", systemImage: "plus") {
                players.append("")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
