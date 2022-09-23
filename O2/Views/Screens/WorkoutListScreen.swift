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
    @State private var showingSettingsView: Bool = false
    @State private var showingWorkoutEditScreen: Bool = false
    
    
    var body: some View {
        ZStack(alignment: .center) {
            
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
            .navigationBarItems(
                leading: EditButton().accentColor(.primary),
                trailing:
                    Button(action: {
                        self.showingSettingsView.toggle()
                    }) {
                        Image(systemName: "paintbrush")
                            .imageScale(.large)
                    } //: SETTINGS BUTTON
                    .accentColor(.primary)
                    .sheet(isPresented: $showingSettingsView) {
                        SettingsView()
                    }
            )
            if workouts.count == 0 {
                EmptyListView()
            }
        }
        .sheet(isPresented: $showingWorkoutEditScreen) {
            WorkoutEditScreen()
        }
        .overlay(
            ZStack {
                Group {
                    Circle()
                        .fill(Color("white"))
                        .frame(width: 72, height: 72, alignment: .center)
                    Circle()
                        .fill(Color("grey"))
                        .frame(width: 70, height: 70, alignment: .center)
                    Circle()
                        .fill(Color("blue"))
                        .frame(width: 65, height: 65, alignment: .center)
                }
                Button(action: {
                    self.showingWorkoutEditScreen.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .background(Circle().fill(Color("ColorBase")))
                        .frame(width: 48, height: 48, alignment: .center)
                } //: BUTTON
                
            } //: ZSTACK
                .padding(.bottom, 15)
                .padding(.trailing, 15)
            , alignment: .bottomTrailing
        )
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - FUNCTIONS
    
    
    
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
}
  // MARK: - PREVIEW

struct WorkoutsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutListScreen()
        }
    }
}

