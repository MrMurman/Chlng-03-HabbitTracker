//
//  HabitTracker.swift
//  Chlng-03-HabbitTracker
//
//  Created by Андрей Бородкин on 25.08.2023.
//

import Foundation

class HabitTracker: ObservableObject {
    @Published var habits = [Habit]() {
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    enum Operation {
        case increment, decrement
    }
    
    func addHabit(_ item: Habit) {
        habits.append(item)
    }
    
    func removeHabit(at: Int) {
        habits.remove(at: at)
    }
    
    func modifyHabitCount(action: Operation, by count: Int, atPosition: Int) {
        if action == .increment {
            habits[atPosition].numOfTimesCompleted += count
        } else {
            habits[atPosition].numOfTimesCompleted -= count
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
}
