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

    @Published var showSignInView: Bool = true

    func isAuthenticated(compilation: @escaping((Bool) -> Void) ) {
        do {
            let _ = try _authRepository.getUserData()
            compilation(false)
        }
        catch {
            print("Error : \(error.localizedDescription)")
            compilation(true)
        }
    }
}
