//
//  ContentView.swift
//  HabitsTracker
//
//  Created by 山本敦也 on 2023/10/19.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var habits = [Habit]()
    @State private var showingAddHabit = false
    private let defaults = UserDefaults.standard

    // MARK: - Initializer
    init() {
        loadHabitsFromDefaults()
    }

    // MARK: - Body
    var body: some View {
        NavigationView {
            habitsListView
                .navigationBarTitle("Today")
                .navigationBarItems(trailing: addButton)
        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabitView(habits: $habits)
        }
    }

    // MARK: - Computed Views
    private var habitsListView: some View {
        List {
            ForEach(habits.indices, id: \.self) { index in
                habitRow(for: index)
            }
            .onDelete(perform: removeHabit)
        }
    }

    private var addButton: some View {
        Button(action: { self.showingAddHabit = true }) {
            Image(systemName: "plus")
        }
    }

    // MARK: - View Functions
    private func habitRow(for index: Int) -> some View {
        NavigationLink(destination: HabitDetailView(habit: self.$habits[index])) {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.habits[index].name)
                    lastCompletedDateText(for: index)
                }
                Spacer()
                Text("\(self.habits[index].timesCompleted)回")
            }
        }
        .onTapGesture {
            self.habits[index].complete()
            self.saveHabits()
        }
    }

    private func lastCompletedDateText(for index: Int) -> some View {
        if let date = self.habits[index].lastCompletedDate {
            return Text("最後に完了: \(date, formatter: DateFormatter.shortDate)")
                .font(.subheadline)
                .foregroundColor(.gray)
        } else {
            return Text("")
        }
    }

    // MARK: - Functions
    private func loadHabitsFromDefaults() {
        if let savedHabits = defaults.habits(forKey: "Habits") {
            self.habits = savedHabits
        }
    }

    private func removeHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
        saveHabits()
    }

    private func saveHabits() {
        defaults.setHabits(habits, forKey: "Habits")
    }
}


#Preview {
    ContentView()
}
