//
//  LoginViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation


final class LoginViewModel : ObservableObject {
    final let _authRepository : AuthRepository

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    @Published var email : String = ""
    @Published var password : String = ""

    func login(compilation : @escaping (Bool) -> Void) {
        _authRepository.loginWithEmailAndPassword(email: email, password: password) { user in
            if(user != nil) {
                print("loggedIn")
                compilation(false)
            }
            else {
                print("Unsuccessfull login attemp")
                compilation(true)
            }
        }
    }
}
