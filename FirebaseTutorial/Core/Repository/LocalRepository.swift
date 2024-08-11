//
//  LocalRepository.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


protocol LocalRepository {
    func checkUser(user: User) async throws -> Bool
    func saveUserInfo() async throws
    func currentUserData() -> UserModel?
}

class LocalRepositoryImpl : LocalRepository {
    func currentUserData()  -> UserModel? {
        return UserDefaults.standard.getData(forKey: "user", as: UserModel.self)
    }
    
    func checkUser(user: FirebaseAuth.User) async throws -> Bool {
        let userDoc = try await Firestore.firestore().collection("users").document(user.uid).getDocument()
        return userDoc.exists
    }
    
    func saveUserInfo() async throws {
        let user : User = Auth.auth().currentUser!
        let result = try await checkUser(user: user)

        if result == true {
            let userDoc = try await Firestore.firestore().collection("users").document(user.uid).getDocument()

            if let userData = userDoc.data() {
                let userModel = try JSONDecoder().decode(UserModel.self, from:JSONSerialization.data(withJSONObject: userData))
                UserDefaults.standard.setData(userModel, forKey: "user")
            }
        }
    }
    

}
