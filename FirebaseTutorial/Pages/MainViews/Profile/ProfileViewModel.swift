//
//  ProfileViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    final var _authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    func signout() {
        _authRepository.signout()
    }
}
