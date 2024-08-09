//
//  AppModule.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation
import Swinject


let container = Container()

func setupDI() {

    container.register(AuthRepository.self) { _ in
        AuthRepository()
    }

    container.register(RootViewModel.self) { _ in
        RootViewModel(authRepository: container.resolve(AuthRepository.self)!)
    }

    container.register(SignInEmailViewModel.self) { _ in
        SignInEmailViewModel(authRepository: container.resolve(AuthRepository.self)!)
    }

    container.register(LoginViewModel.self) { _ in
        LoginViewModel(authRepository: container.resolve(AuthRepository.self)!)
    }

    container.register(HomeViewModel.self) { _ in
        HomeViewModel()
    }

    container.register(WorkoutsViewModel.self) { _ in
        WorkoutsViewModel()
    }
    container.register(ProfileViewModel.self) { _ in
        ProfileViewModel(authRepository: container.resolve(AuthRepository.self)!)
    }

}

