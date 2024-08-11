//
//  LoginViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation


final class LoginViewModel : BaseViewModel {
    final let _authRepository : AuthRepository
    final let _localRepository: LocalRepository

    init(authRepository: AuthRepository, localRepository: LocalRepository) {
        self._authRepository = authRepository
        self._localRepository = localRepository
    }

    @Published var email : String = ""
    @Published var password : String = ""

    func login(compilation : @escaping () -> Void) {
        DispatchQueue.main.async {
            self.isLoading = true
        }

        _authRepository.loginWithEmailAndPassword(email: email, password: password) { user in
            if(user != nil) {
                Task {
                    do {
                        try await self._localRepository.saveUserInfo()
                        DispatchQueue.main.async {
                            self.isLoading = false
                        }
                        compilation()
                    } catch {

                        print(error)
                        print("Unsuccessfull login attemp")
                        DispatchQueue.main.async {
                            self.isLoading = false
                            self.alert = DialogContent(isPresented: true, message: "Unknown error occured, please try again later.")
                        }



                    }
                }
            }
            else {
                print("Unsuccessfull login attemp")
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.alert = DialogContent(isPresented: true, message: "Unknown error occured, please try again later.")
                }



            }
        }
    }
}
