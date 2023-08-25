//
//  Habbit.swift
//  Chlng-03-HabbitTracker
//
//  Created by Андрей Бородкин on 25.08.2023.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    
    var numOfTimesCompleted: Int = 0
}
