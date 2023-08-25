//
//  ContentView.swift
//  Chlng-03-HabbitTracker
//
//  Created by Андрей Бородкин on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habitTracker = HabitTracker()
    @State private var alertIsShowing = false
    
    @State private var newTitle = String()
    @State private var newDescription = String()
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(0..<habitTracker.habits.count, id: \.self) { index in
                        
                        NavigationLink {
                            DetailView(habitTracker: habitTracker, index: index)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habitTracker.habits[index].title)
                                        .font(.title)
                                    
                                    Text(habitTracker.habits[index].description)
                                        .font(.caption)
                                }
                                Spacer()
                                Text("Count \(habitTracker.habits[index].numOfTimesCompleted)")
                            }
                        }
                        
                    }
                    .onDelete(perform: removeHabits)
                }
                
            }
            .navigationTitle("Habit tracker")
            .alert("New habit", isPresented: $alertIsShowing) {
                TextField("Title", text: $newTitle)
                TextField("Description", text: $newDescription)
                Button("Add") {
                    if !newTitle.isEmpty && !newDescription.isEmpty {
                        habitTracker.addHabit(Habit(title: newTitle, description: newDescription))
                        newTitle = ""
                        newDescription = ""
                    }
                }
                Button("Cancel", role: .cancel, action: {})
            } message: {
                Text("Please enter new habit's title and description")
            }
            .toolbar{
                Button {
                    alertIsShowing = true
                } label: {
                    Text("+")
                }
                
            }
        }
        
    }
    
    func removeHabits(at offsets: IndexSet) {
        habitTracker.habits.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
