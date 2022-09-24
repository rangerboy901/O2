//
//  WorkoutEditScreen.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/22/22.
//

import SwiftUI
import RealmSwift

struct WorkoutEditScreen: View {
 //PROPERTIES
    @Binding var workoutData: DailyWorkout.Data
    @State private var newExercise = ""
    @State var exercise = ""
    ///workout types for colorization function
    let types = ["HIIT", "Cardio", "Strength", "Power", "Recover"]
    
    
    
    
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
        VStack (alignment:.leading){
            List {
                
                Section(header: Text("Workout Details")) {
                    
                    TextField("Enter workout name...", text: $workoutData.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerSize: .zero).stroke(self.colorize(type: workoutData.type ), lineWidth: 3.0))
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(self.colorize(type: workoutData.type ))
                    Section("Workout Description or Objectives📝") {
                        TextEditor(text: $workoutData.objective)
                            .frame(width: 350, height: 125, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(2)
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(10)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor(self.colorize(type: workoutData.type ))
                    .accessibilityLabel("\(workoutData.objective)Workout Description")
                    ///workout goal slider
                    
                    Text("Select a Workout Type:")
                    Picker("Workout Type:", selection: $workoutData.type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .overlay(
                        RoundedRectangle(cornerSize: .zero).stroke(self.colorize(type: workoutData.type ), lineWidth: 3.0))
                    Section("Time Goal") {
                        HStack {
                            Slider(value: $workoutData.timeGoal, in:1...180, step: 1){
                                Text("\(Int(workoutData.timeGoal)) minutes.")
                                
                            }
                            .accessibilityValue("\(Int(workoutData.timeGoal)) minutes")
                           
                            Text("\(Int(workoutData.timeGoal)) minutes.")
                                .accessibilityHidden(true)
                        }
                       
                    }
                   
                    ///EXERCISES
                    Section(header: Text("Exercises")) {
                        ForEach(workoutData.exercises, id: \.self) { exercise in
                            Text (workoutData.title)
                        }
                        .onDelete { indices in
                            workoutData.exercises.remove(atOffsets: indices)
                        }
                        HStack {
                            TextField("Enter new exercise...", text: $newExercise)
                            Button(action: {
                                HapticManager.notification(type: .success)
                                withAnimation {
                                    workoutData.exercises.append(exercise)
                                    newExercise = ""
                                }
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .accessibilityLabel(Text("Add exercise"))
                            }
                            .disabled(newExercise.isEmpty)
                            .foregroundColor(.primary)
                        }
                        
                    }//: #endOf Section
                    
                }//: #endOf List
                .listStyle(InsetGroupedListStyle())
                
            } .foregroundColor(self.colorize(type: workoutData.type ))
        }
    }
}


struct WorkoutEditScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEditScreen(workoutData: .constant(DailyWorkout.data[0].data))
    }
}
