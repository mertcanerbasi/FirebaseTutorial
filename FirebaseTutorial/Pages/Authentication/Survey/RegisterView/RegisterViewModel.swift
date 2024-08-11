//
//  RegisterViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation
import FirebaseAuth


final class RegisterViewModel: BaseViewModel {
    let _authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""


    func registerWithEmailAndPassword(complation: @escaping ()-> Void){
        guard !password.isEmpty, password == passwordAgain else {
            DispatchQueue.main.async {
                self.alert = DialogContent(isPresented: true, message: "Please check your password")
            }
            return
        }
        guard !email.isEmpty, email.isValidEmail else {
            DispatchQueue.main.async {
                self.alert = DialogContent(isPresented: true, message: "Invalid email")
            }

            return
        }

        Task {
            DispatchQueue.main.async {
                self.isLoading = true
            }

            do {
                let _ = try await _authRepository.registerWithEmailAndPassword(email: email, password: password)
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                complation()

            } catch {
                print("Error: \(error)")

                DispatchQueue.main.async {
                    self.isLoading = false
                    self.alert = DialogContent(isPresented: true,  message: "You couldnt be registered due to an error")
                }
                
                
            }
        }

    }




}
