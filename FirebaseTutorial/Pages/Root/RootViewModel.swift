//
//  RootViewModel.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation


final class RootViewModel : ObservableObject {
    final let _authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self._authRepository = authRepository
    }

    @Published var showSignInView: Bool = true

    func isAuthenticated() {
        do {
            let _ = try _authRepository.getUserData()
            self.showSignInView = false


        }
        catch {
            print("Error : \(error.localizedDescription)")
            self.showSignInView = true
        }
    }
}
