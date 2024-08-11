//
//  PromiseViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 11.08.2024.
//

import Foundation


final class PromiseViewModel : ObservableObject {
    final var _authRepository : AuthRepository
    final var _localRepository: LocalRepository

    init(authRepository: AuthRepository, localRepository: LocalRepository) {
        self._authRepository = authRepository
        self._localRepository = localRepository
    }

    @Published var alert : DialogContent = DialogContent(isPresented: false, alertTitle: "", alertDesc: "")


    func saveUserInfo(registerUserModel : RegisterUserModel,complation: @escaping() -> Void)   {
        Task {
            do {
                try await _authRepository.saveUserInfo(model: registerUserModel)
                try await _localRepository.saveUserInfo()
                complation()
            }
            catch {
                print(error)
                DispatchQueue.main.async {
                    self.alert = DialogContent(isPresented: true, alertTitle: "Registration Unsuccessfull", alertDesc: "You couldnt be registered due to an error")
                }
            }
        }


    }
}
