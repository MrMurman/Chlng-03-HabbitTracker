//
//  DetailView.swift
//  Chlng-03-HabbitTracker
//
//  Created by Андрей Бородкин on 25.08.2023.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var habitTracker: HabitTracker
    var index: Int
    
    var body: some View {
        Form {
            Section("Title") {
                Text(habitTracker.habits[index].title)
            }
            
            Section("Description") {
                Text(habitTracker.habits[index].description)
            }
            
            Section("Habit tracker") {
                Stepper(String(habitTracker.habits[index].numOfTimesCompleted)) {
                    habitTracker.modifyHabitCount(action: .increment, by: 1, atPosition: index)
                } onDecrement: {
                    habitTracker.modifyHabitCount(action: .decrement, by: 1, atPosition: index)
                }

            }
            
        }
        .navigationTitle(habitTracker.habits[index].title)
    }
}

#Preview {
    DetailView(habitTracker: HabitTracker.init(), index: 0)
}
