//
//  BaseViewMode.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 11.08.2024.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var alert : DialogContent = DialogContent(isPresented: false, message: "")
}
