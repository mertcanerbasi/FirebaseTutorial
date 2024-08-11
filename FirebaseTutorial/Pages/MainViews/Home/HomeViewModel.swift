//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import Foundation

final class HomeViewModel : BaseViewModel {
    final var _goalsRepository: GoalsRepository
    final var _localRepository: LocalRepository

    init(goalsRepository: GoalsRepository, localRepository: LocalRepository) {
        self._goalsRepository = goalsRepository
        self._localRepository = localRepository
        super.init()
        getLocalUser()
    }

    //Variables
    @Published var user : UserModel?
    @Published var goals: Goals?

    func getLocalUser() {
        let userData =  _localRepository.currentUserData()
        DispatchQueue.main.async {
            self.user = userData
        }

    }

    func getGoals() async {
        do {
           var goalData = try await _goalsRepository.getCurrentGoals()
            DispatchQueue.main.async {
                self.goals = goalData
            }

        }
        catch {
            print(error)
            print("Goals couldnt be fetched")
        }
    }

    func getAllData() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        await getGoals()
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }

    func printHello(){
        print("Hello")
    }



}



