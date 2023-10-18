//
//  HabitDetailView.swift
//  HabitsTracker
//
//  Created by 山本敦也 on 2023/10/19.
//

import Foundation
import SwiftUI
struct HabitDetailView: View {
    @Binding var habit: Habit
    @State private var showingEditView = false

    var body: some View {
        VStack {
            Text(habit.name)
                .font(.largeTitle)
                .padding()

            Text(habit.description)
                .padding()

            Text("完了回数: \(habit.timesCompleted)")
                .padding()
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.showingEditView = true
            }) {
                Text("Edit")
            }
        )
        .sheet(isPresented: $showingEditView) {
            EditHabitView(habit: self.$habit)
        }
    }
}
