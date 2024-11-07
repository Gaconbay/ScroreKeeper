//
//  ContentView.swift
//  ScroreKeeper
//
//  Created by Ty Tran on 11/6/24.
//

import SwiftUI


struct ContentView: View {
    @State private var players : [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]
    


    var body: some View {
        VStack (alignment: .leading) {
            
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid {
                
                GridRow{
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($players){ $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .colorScheme(.dark)
                    }
                }
            }
            .padding(.vertical)
            

            Spacer()
        }
        .padding()
        .background(.yellow)
        
        HStack {
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            .buttonStyle(.borderedProminent)
            
            
            Button("Remove Player", systemImage: "minus") {
                guard players.count == 0 else { players.removeLast()
                    return
                }
            }
            .disabled(players.count == 0)
        }
        .buttonStyle(.borderedProminent)
        
    }
    
        
}


#Preview {
    ContentView()
}
