//
//  RootViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation


final class RootViewModel : ObservableObject {
    final let _authRepository: AuthRepository
    final let _localRepository: LocalRepository

    init(authRepository: AuthRepository,localRepository: LocalRepository) {
        self._authRepository = authRepository
        self._localRepository = localRepository
    }

    @Published var rootCase: RootCases = .notLoggedIn

    func setRootCase() {
        Task {
            let user = try await _authRepository.getUserData()
            let localUser = _localRepository.currentUserData()

            if  user != nil,  localUser != nil {
                DispatchQueue.main.async {
                    self.rootCase = .loggedIn
                }

            }
            else if user != nil {
                DispatchQueue.main.async {
                    self.rootCase = .survey
                }
            }
            else {
                DispatchQueue.main.async {
                    self.rootCase = .notLoggedIn
                }
            }
        }

    }
}
