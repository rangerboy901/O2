//
//  WorkoutDetailScreen.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/22/22.
//

import SwiftUI
import RealmSwift

struct WorkoutDetailScreen: View {
    @ObservedRealmObject var workout: DailyWorkout
    //JWD:  PROPERTIES
    @State private var isPresented: Bool = false
    //JWD:  PROPERTIES
    @State private var data = DailyWorkout.Data()
   let workouts = DailyWorkout()
    
    func colorize(type: String) -> Color {
        switch type {
        case "HIIT":
            return .blue
        case "Strength":
            return .orange
        case "Cardio":
            return .red
        case "Power":
            return .green
        case "Recover":
            return .pink
        default:
            return .gray
            
        }
    }
    var body: some View {
        
        List{
         
                Section(header: Text("Workout Name:")) {
                    Text(workout.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(1)
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(self.colorize(type: workout.type ))
                        .accessibilityLabel("\(workout.title)Workout Name")
                    
                }
                
                Section(header: Text("Workout Objective📝")) {
                    Text(workout.objective)
                    
                        .padding(1)
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(self.colorize(type: workout.type ))
                        .accessibilityLabel("\(workout.objective)Workout Description")
                    Divider()
                    
                }//: #endOfWorkoutObjectiveSection
                ///WORKOUT TYPE
                Section(header: Text("Workout Type:")) {
                    Text(workout.type)
                    
                        .padding(1)
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(self.colorize(type: workout.type ))
                        .accessibilityLabel("\(workout.type) Workout type")
                        .accessibilityElement(children: .ignore)
                    HStack {
                        Label("Time Goal:", systemImage: "clock")
                            .foregroundColor(self.colorize(type: workout.type ))
                        Spacer()
                        Text("\(workout.timeGoal) minutes")
                    }
                    .accessibilityElement(children: .combine)
                }//: #endOfWorkoutTypeSection
                ///EXERCISES
                Section(header: Text("Exercises:")) {
                    ForEach(workout.exercises, id: \.self) {
                        exercise in
                        Label(exercise, systemImage: "target")
                            .accessibilityLabel(Text("target"))
                            .accessibilityValue(Text(exercise))
                    }
                    .foregroundColor(self.colorize(type: workout.type ))
                    .padding(1)
                    Divider()
                }
                ///TIMER VIEW
                Section {
                    NavigationLink(
                        destination:  TimerView()
                    ){
                        Label("Begin Workout", systemImage: "timer")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                    }
                    .cornerRadius(10)
                    .padding()
                    
                    
                }
                .cornerRadius(10)
                .foregroundColor(.primary)
                .background(self.colorize(type: workout.type ))
                
                Section(header: Text("History")) {
                    if workout.history.isEmpty {
                        Label("No Completed Workouts", systemImage: "calendar.badge.exclamationmark")
                    }
                    ForEach(workout.history) { history in
                        NavigationLink(destination: HistoryView()) {
                            HStack {
                                Image(systemName: "calendar")
                                if let date = history.date {
                                    Text(date, style: .date)
                                } else {
                                    Text("Date is missing")
                                }
                            }
                        }
                    }
                }
            
              
                
                .navigationBarItems(trailing: Button("Edit") {
                    isPresented = true
                    data = workout.data
                })
                
            }
        .listStyle(InsetGroupedListStyle())
       
        .fullScreenCover(isPresented: $isPresented) {
            
                WorkoutEditScreen()
                    
                    .navigationBarItems(leading: Button("Cancel") {
                        HapticManager.notification(type: .success)
                        
                        isPresented = false
                    }, trailing: Button("Save") {
                        HapticManager.notification(type: .success)
                        isPresented = false
                        do {
                            try Realm().write() {
                                guard let thawedWorkout =
                                        workout.thaw() else {
                                    print("Unable to thaw workout")
                                    return
                                }
                                thawedWorkout.update(from: data)
                            }
                        }catch {
                            print("Failed to save workout: \(error.localizedDescription)")
                        }
                    })
            }
        }
    }



