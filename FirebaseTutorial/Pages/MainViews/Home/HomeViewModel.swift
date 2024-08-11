//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation

final class HomeViewModel : BaseViewModel {

    func printHello(){
        print("Hello")
    }

    @Published var user : UserModel = UserModel(name: "Mertcan", age: 26, gender: .male, height: 183, weight: 85, isPremium: false, language: .english, notificationsEnabled: true)

}



