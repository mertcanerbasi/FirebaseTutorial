//
//  GoalsRepository.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 11.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


protocol GoalsRepository {
    func getCurrentGoals() async throws -> Goals?
    func saveGoals(goals: Goals) async throws
}


final class GoalsRepositoryImpl : GoalsRepository{
    func saveGoals(goals: Goals) async throws {
        // Convert goals to Data using JSONEncoder
        let encoder = JSONEncoder()
        let data = try encoder.encode(goals)

        // Convert Data to Dictionary
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            try await Firestore.firestore().collection("users")
                .document(currentUser!.uid)
                .collection("goal")
                .document("goal")
                .setData(json)
        }
    }
    
    var currentUser : User? {
        Auth.auth().currentUser
    }

    func getCurrentGoals() async throws -> Goals? {
        if currentUser != nil {
            let goalDoc = try await Firestore.firestore().collection("users").document(currentUser!.uid).collection("goal").document("goal").getDocument()

            if let goalData = goalDoc.data() {
                let goalsModel = try JSONDecoder().decode(Goals.self, from:JSONSerialization.data(withJSONObject: goalData))
                return goalsModel
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }


    


}
