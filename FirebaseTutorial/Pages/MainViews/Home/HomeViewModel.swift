//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation

final class HomeViewModel : ObservableObject {

    func printHello(){
        print("Hello")
    }

    @Published var user : UserModel = UserModel(name: "Mertcan", age: 26)

}

struct UserModel {
    let name: String
    let age: Int

}

