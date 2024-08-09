//
//  RegisterViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    let _authRepository: AuthRepository

    // Property to track if registration was successful
    @Published var isRegistrationSuccessful: Bool = false

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""

    func registerWithEmailAndPassword() {
        print(email)
        print(password)
        print(passwordAgain)

        guard !email.isEmpty, !password.isEmpty, password == passwordAgain else {
            print("Register Data Error")
            return
        }

        Task {
            do {
                let _ = try await _authRepository.registerWithEmailAndPassword(email: email, password: password)

                // Set success state to true upon successful registration
                DispatchQueue.main.async {
                    self.isRegistrationSuccessful = true
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
