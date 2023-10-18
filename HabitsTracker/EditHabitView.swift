//
//  EditHabitView.swift
//  HabitsTracker
//
//  Created by 山本敦也 on 2023/10/19.
//

import Foundation
import SwiftUI
struct EditHabitView: View {
    @Binding var habit: Habit
    @State private var name: String
    @State private var description: String
    @Environment(\.presentationMode) var presentationMode

    init(habit: Binding<Habit>) {
        _habit = habit
        _name = State(initialValue: habit.wrappedValue.name)
        _description = State(initialValue: habit.wrappedValue.description)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                Button("Save") {
                    self.habit.name = self.name
                    self.habit.description = self.description
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Edit Habit")
        }
    }
}
