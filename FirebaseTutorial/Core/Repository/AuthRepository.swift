//
//  AuthRepository.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation
import FirebaseAuth

protocol AuthRepository {
    func registerWithEmailAndPassword(email:String, password: String) async throws -> User
    func getUserData() throws -> User
    func loginWithEmailAndPassword(email: String, password: String,compilation: @escaping (User?) -> Void)
    func signout()
}


final class AuthRepositoryImpl : AuthRepository {
    func getUserData() throws -> User {
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return user
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
