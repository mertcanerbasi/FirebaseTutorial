//
//  RegisterErros.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 10.08.2024.
//

import Foundation
import FirebaseAuth


enum RegisterErrors {
    case badEmail
    case badPassword
    case undefinedError
    case success(user: User)

}
