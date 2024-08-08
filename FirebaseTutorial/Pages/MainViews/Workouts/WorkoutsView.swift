//
//  WorkoutsView.swift
//  FirebaseTutorial
//
//  Created by Mertcan Erbaşı on 8.08.2024.
//

import SwiftUI

struct WorkoutsView: View {
    @StateObject var viewModel = container.resolve(WorkoutsViewModel.self)!
    var body: some View {
        Text("Workouts")
    }
}

#Preview {
    WorkoutsView()
}
