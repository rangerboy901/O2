//
//  WorkoutListScreen.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/18/22.
//

import SwiftUI
import RealmSwift



struct WorkoutListScreen: View {
    
    @Binding var workouts: [DailyWorkout]
    @State private var newWorkoutData = DailyWorkout.Data()
    @State private var showingEditWorkoutView: Bool = false
    @State private var showingMenuView: Bool = false
    @State private var currentWorkout = DailyWorkout()
    @State  var isPresented = false
    let workout = DailyWorkout()
    let saveAction: () -> Void
    
    
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
            NavigationView{
                        List {
                            if let workouts = workouts {
                                ForEach(workouts) { workout in
                                    NavigationLink(
                                        destination: WorkoutDetailScreen(workout: workout)) {
                                            WorkoutCellView(workout: workout)
                                        }
                                }//TODO   delete row
                            }
                        }///#endOfList
                      
                  
                
                
            }///#endOfNavigationtack
            .navigationTitle("Workouts")
            ButtonView()
        }
            }
        }
    
struct WorkoutsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutListScreen(workouts: .constant(DailyWorkout.data), saveAction: {})
        }
    }
}

