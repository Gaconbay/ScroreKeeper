//
//  Player.swift
//  ScroreKeeper
//
//  Created by Ty Tran on 11/6/24.
//
import Foundation

struct Player : Identifiable {
    let id = UUID()
    
    var name : String
    var score : Int
}

extension Player : Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
            lhs.name == rhs.name && lhs.score == rhs.score
        }
}
