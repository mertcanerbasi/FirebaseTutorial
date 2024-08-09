//
//  UserModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation


struct UserModel : Codable {
    let name: String
    let age: Int
    let gender: Gender
    let height: Int
    let weight: Int
    let isPremium : Bool
    let language: Language
    let notificationsEnabled: Bool
}
