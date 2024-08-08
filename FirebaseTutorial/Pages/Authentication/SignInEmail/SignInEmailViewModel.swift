//
//  SignInEmailViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation

final class SignInEmailViewModel: ObservableObject {
    private let _authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    @Published var email = ""
    @Published var password = ""

    func signIn(){
        guard !email.isEmpty , !password.isEmpty else {
            print("No email or password found")
            return
        }

        Task {
            do {
                let _ = try await _authRepository.createUser(email: email, password: password)
                container.resolve(RootViewModel.self)!.showSignInView = false

            } catch {
                print("Error: \(error)")
            }
        }
    }

}
