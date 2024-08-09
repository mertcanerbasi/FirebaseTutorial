//
//  Goals.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation


struct Goals: Codable {
    let goals: [GoalsModel]
}

struct GoalsModel : Codable {
    let muscleName: MuscleParts
    var target: Int
}
