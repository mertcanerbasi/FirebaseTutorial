//
//  PromiseViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 11.08.2024.
//

import Foundation


final class PromiseViewModel : BaseViewModel {
    final var _authRepository : AuthRepository
    final var _localRepository: LocalRepository

    init(authRepository: AuthRepository, localRepository: LocalRepository) {
        self._authRepository = authRepository
        self._localRepository = localRepository
    }

    func saveUserInfo(registerUserModel : RegisterUserModel,complation: @escaping() -> Void)   {
        Task {
            DispatchQueue.main.async {
                self.isLoading = true
            }

            do {
                try await _authRepository.saveUserInfo(model: registerUserModel)
                try await _localRepository.saveUserInfo()
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                complation()
            }
            catch {
                print(error)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.alert = DialogContent(isPresented: true, message: "Unknown problem occured")
                }

                
            }
        }


    }
}
