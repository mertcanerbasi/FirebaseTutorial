//
//  String+.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 9.08.2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        // Regular expression for validating email addresses
        let emailRegEx = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"

        // Create a predicate with the email regex
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

        // Return whether the string matches the regex
        return predicate.evaluate(with: self)
    }
}
