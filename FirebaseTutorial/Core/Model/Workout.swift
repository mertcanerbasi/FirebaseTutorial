//
//  Workout.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation

struct Workout: Codable {
    let id: String
    let name: String
    let dayOneExercises: [Exercise]?
    let dayTwoExercises: [Exercise]?
    let dayThreeExercises: [Exercise]?
    let dayFourExercises: [Exercise]?
    let dayFiveExercises: [Exercise]?
    let daySixExercises: [Exercise]?
    let daySevenExercises: [Exercise]?
}

struct Exercise: Codable {
    let name : String
    let sets : Int
    let reps: Int
    let muscleParts: MuscleParts
    var isDone: Bool? = false
}
