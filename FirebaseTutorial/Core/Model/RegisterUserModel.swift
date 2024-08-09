//
//  RegisterUserModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation

class RegisterUserModel {
    let shared : RegisterUserModel = RegisterUserModel(name: "", age: 25, gender: .female, height: 175, weight: 70, isPremium: false, notificationsEnabled: true, language: .english)

    private init(name: String, age: Int, gender: Gender, height: Int, weight: Int, isPremium: Bool, notificationsEnabled: Bool, language: Language) {
        self.name = name
        self.age = age
        self.gender = gender
        self.height = height
        self.weight = weight
        self.isPremium = isPremium
        self.notificationsEnabled = notificationsEnabled
        self.language = language
        debugPrint("Regiter User Model Initialized")
    }

    deinit {
        debugPrint("Register User Model Deinitialized")
    }

    var name: String
    var age : Int
    var gender: Gender
    var height: Int
    var weight: Int
    var isPremium : Bool
    var notificationsEnabled : Bool
    var language : Language


}
