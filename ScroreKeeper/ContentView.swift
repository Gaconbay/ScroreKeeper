//
//  ContentView.swift
//  ScroreKeeper
//
//  Created by Ty Tran on 11/6/24.
//

import SwiftUI


struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0


    var body: some View {
        VStack (alignment: .leading) {
            
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingpoints: $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            Grid {
                
                GridRow{
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state != .setup ? 0 : 1)
                }
                .font(.headline)
                
                ForEach($scoreboard.players){ $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            TextField("Name", text: $player.name)
                        }
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .colorScheme(.dark)
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }
            .buttonStyle(.borderedProminent)
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack{
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.circle") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Restart Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
