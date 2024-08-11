//
//  AuthRepository.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AuthRepository {
    func registerWithEmailAndPassword(email:String, password: String) async throws -> User
    func getUserData() -> User?
    func loginWithEmailAndPassword(email: String, password: String,compilation: @escaping (User?) -> Void)
    func saveUserInfo(model : RegisterUserModel) async throws
    func signout()
}


final class AuthRepositoryImpl : AuthRepository {
    func saveUserInfo(model: RegisterUserModel) async throws {
        let userData: [String: Any] = [
                 "name": RegisterUserModel.shared.name,
                 "age": RegisterUserModel.shared.age,
                 "gender": RegisterUserModel.shared.gender.rawValue, // Assuming gender is an enum
                 "height": RegisterUserModel.shared.height,
                 "weight": RegisterUserModel.shared.weight,
                 "isPremium": RegisterUserModel.shared.isPremium,
                 "notificationsEnabled": RegisterUserModel.shared.notificationsEnabled,
                 "language": RegisterUserModel.shared.language.rawValue // Assuming language is an enum
                 // Add other user details you want to save
             ]

             // Save to Firebase Firestore
        try await Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).setData(userData)
    }
    
    func getUserData() -> User? {
        return Auth.auth().currentUser
    }

    func registerWithEmailAndPassword(email: String, password: String) async throws -> User{
       let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
       return authDataResult.user
    }

    func loginWithEmailAndPassword(email: String, password: String,compilation: @escaping (User?) -> Void) {
        let _: () = Auth.auth().signIn(withEmail: email, password: password) { result, error in
            compilation(result?.user)
        }
    }

    func signout() {
        do {
            try Auth.auth().signOut()
            print("Successfully signed out.")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
          }
    }


}
