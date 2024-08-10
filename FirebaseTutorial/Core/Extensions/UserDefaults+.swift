//
//  UserDefaults+.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import Foundation

extension UserDefaults {

    // Save a Codable object to UserDefaults
    func setData<T: Codable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(object) {
            self.set(encodedData, forKey: key)
        }
    }

    // Retrieve a Codable object from UserDefaults
    func getData<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        if let savedData = self.data(forKey: key) {
            let decoder = JSONDecoder()
            if let decodedObject = try? decoder.decode(type, from: savedData) {
                return decodedObject
            }
        }
        return nil
    }
}
