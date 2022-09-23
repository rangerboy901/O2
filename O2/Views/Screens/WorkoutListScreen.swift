//
//  WorkoutListScreen.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/18/22.
//

import SwiftUI
import RealmSwift



struct WorkoutListScreen: View {
    //PROPERTIES
    @ObservedResults(DailyWorkout.self) var workouts
    @State private var isPresented = false
    @State private var newWorkoutData = DailyWorkout.Data()
    @State private var currentWorkout = DailyWorkout()
    
    ///Color theme for application.  Color relates to workout type.
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
        ZStack(alignment: .bottomTrailing) {
            
                List {
                    if let workouts = workouts {
                        ForEach(workouts) { workout in
                            NavigationLink(
                                destination: WorkoutDetailScreen(workout: workout)) {
                                    WorkoutCellView(workout: workout)
                                }
                                .listRowBackground(Color(uiColor: .secondarySystemGroupedBackground))
                        }//TODO   delete row
                        
                    }
                    
                }///#endOfList
                .navigationTitle("Workouts")

            Group {
               
                    Circle()
                        .fill(Color("blue"))
                        .frame(width: 60, height: 60, alignment: .center)
                        .padding(.trailing, 30)
                    
                    Button(action: {
                        isPresented=true
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("white"))
                            .frame(width: 28, height: 28, alignment: .center)
                            .padding(.trailing, 46)
                            .padding(.bottom, 15)
                        
                    } //: BUTTON
                }
                
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    WorkoutEditScreen()
                        .navigationBarItems(leading: Button("Dismiss") {
                            isPresented = false
                        }, trailing: Button("Add") {
                            let newWorkout = DailyWorkout(
                                title: newWorkoutData.title,
                                objective: newWorkoutData.objective,
                                timeGoal: Int(newWorkoutData.timeGoal), type: newWorkoutData.type,exercises: newWorkoutData.exercises)
                                $workouts.append(newWorkout)
                            isPresented = false
                        })
                }
            }
        }
    }
            }
           
           
    
    

struct WorkoutsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutListScreen()
        }
    }
}

