//
//  AuthRepository.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation
import FirebaseAuth

final class AuthRepository {
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }

    func createUser(email: String, password: String) async throws -> AuthDataResultModel{
       let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
       return AuthDataResultModel(user: authDataResult.user)
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
