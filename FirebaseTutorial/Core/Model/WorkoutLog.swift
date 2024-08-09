//
//  WorkoutLog.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation


struct WorkoutLog: Codable {
    var id: String?
    let workoutId: String
    var dateSinceEpoch: Int?
    let exercises: [LoggedExercise]
    let day: Int
}

struct LoggedExercise : Codable {
    let name: String
    let sets: Int
    let reps: [Int]
    let weight: [Double]
}
