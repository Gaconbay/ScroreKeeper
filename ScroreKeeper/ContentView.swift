//
//  ContentView.swift
//  ScroreKeeper
//
//  Created by Ty Tran on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var players : [String] = []

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
