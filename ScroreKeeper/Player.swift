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
