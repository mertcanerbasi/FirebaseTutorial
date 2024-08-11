//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation

final class HomeViewModel : BaseViewModel {
    final var _authRepository: AuthRepository
    final var _localRepository: LocalRepository

    init(authRepository: AuthRepository, localRepository: LocalRepository) {
        self._authRepository = authRepository
        self._localRepository = localRepository
        super.init()
        getLocalUser()
    }

    func getLocalUser() {
        let userData =  _localRepository.currentUserData()
        self.user = userData

    }

    func printHello(){
        print("Hello")
    }

    @Published var user : UserModel?

}



