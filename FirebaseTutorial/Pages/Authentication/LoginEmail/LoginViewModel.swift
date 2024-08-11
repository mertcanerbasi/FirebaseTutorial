//
//  LoginViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation


final class LoginViewModel : ObservableObject {
    final let _authRepository : AuthRepository
    final let _localRepository: LocalRepository

    init(authRepository: AuthRepository, localRepository :LocalRepository) {
        self._authRepository = authRepository
        self._localRepository = localRepository
    }

    @Published var email : String = ""
    @Published var password : String = ""
    @Published var isLoading : Bool = false
    @Published var alert : DialogContent = DialogContent(isPresented: false, alertTitle: "", alertDesc: "")


    func login(compilation : @escaping () -> Void) {
        isLoading = true
        _authRepository.loginWithEmailAndPassword(email: email, password: password) { user in
            if(user != nil) {
                Task {
                    do {
                        try await self._localRepository.saveUserInfo()
                        self.isLoading = false
                        compilation()
                    } catch {
                        print(error)
                        print("Unsuccessfull login attemp")
                        DispatchQueue.main.async {
                            self.alert = DialogContent(isPresented: true, alertTitle: "Login Error", alertDesc: "Unknown error occured, please try again later.")
                            self.isLoading = false
                        }
                    }
                }

            }
            else {
                print("Unsuccessfull login attemp")
                DispatchQueue.main.async {
                    self.alert = DialogContent(isPresented: true, alertTitle: "Login Error", alertDesc: "Unknown error occured, please try again later.")
                    self.isLoading = false
                }
            }
        }
    }
}
