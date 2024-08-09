//
//  Progress.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation


struct Progress : Codable {
    let progresses : [ProgressModel]
    let createdAt: Int?
}

struct ProgressModel : Codable {
    let muscleName: MuscleParts
    let target :Int
}
