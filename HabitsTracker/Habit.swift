//
//  Habit.swift
//  HabitsTracker
//
//  Created by 山本敦也 on 2023/10/19.
//

import Foundation
import SwiftUI
struct Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var timesCompleted: Int
    var lastCompletedDate: Date?
}
extension Habit {
    mutating func complete() {
        let currentDate = Calendar.current.startOfDay(for: Date())
        if let lastDate = lastCompletedDate, Calendar.current.isDate(lastDate, inSameDayAs: currentDate) {
            // すでに今日完了している場合、何もしない
            return
        }
        self.timesCompleted += 1
        self.lastCompletedDate = currentDate
    }
}
