//
//  AddHabitView.swift
//  HabitsTracker
//
//  Created by 山本敦也 on 2023/10/19.
//

import Foundation
import SwiftUI
struct AddHabitView: View {
    @Binding var habits: [Habit]
    @State private var name = ""
    @State private var description = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                Button("Add Habit") {
                    let habit = Habit(name: self.name, description: self.description, timesCompleted: 0)
                    self.habits.append(habit)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Add New Habit")
        }
    }
}
