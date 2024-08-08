//
//  RootViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation


final class RootViewModel : ObservableObject {
    final var _authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    func isAuthenticated() {
        do {
            var x = try _authRepository.getAuthenticatedUser()
            showSignInView = false
        }
        catch {
            print("Error : \(error.localizedDescription)")
            showSignInView = true
        }
    }

    
    @Published var showSignInView : Bool = true
}
