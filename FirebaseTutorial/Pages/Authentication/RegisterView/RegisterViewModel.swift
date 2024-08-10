//
//  RegisterViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation
import FirebaseAuth


final class RegisterViewModel: ObservableObject {
    let _authRepository: AuthRepository

    // Property to track if registration was successful
    @Published var alert : DialogContent = DialogContent(isPresented: false, alertTitle: "", alertDesc: "")

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""


    func registerWithEmailAndPassword(complation: @escaping ()-> Void){
        guard !password.isEmpty, password == passwordAgain else {
            DispatchQueue.main.async {
                self.alert = DialogContent(isPresented: true, alertTitle: "Password Error", alertDesc: "Please check your password")
            }
            return
        }
        guard !email.isEmpty, email.isValidEmail else {
            DispatchQueue.main.async {
                self.alert = DialogContent(isPresented: true, alertTitle: "Email Error", alertDesc: "Please check your email")
            }
            return
        }

        Task {
            do {
                let user = try await _authRepository.registerWithEmailAndPassword(email: email, password: password)
                complation()

            } catch {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self.alert = DialogContent(isPresented: true, alertTitle: "Registration Unsuccessfull", alertDesc: "You couldnt be registered due to an error")
                }

            }
        }

    }




}
