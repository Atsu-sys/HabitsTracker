//
//  UserDefaults.swift
//  HabitsTracker
//
//  Created by 山本敦也 on 2023/10/19.
//

import Foundation
import SwiftUI
extension UserDefaults {
    func setHabits(_ habits: [Habit], forKey key: String) {
        if let encoded = try? JSONEncoder().encode(habits) {
            set(encoded, forKey: key)
        }
    }

    func habits(forKey key: String) -> [Habit]? {
        if let data = data(forKey: key) {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
                return decoded
            }
        }
        return nil
    }
}
