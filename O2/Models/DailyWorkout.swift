//
//  MyWorkout.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/22/22.
//

import SwiftUI
import RealmSwift

///JWD:   Specific data types in Realm must be initialized with a value. Will initialize with an empty string.
class DailyWorkout: Object, ObjectKeyIdentifiable {
   
    @Persisted var title = ""
    @Persisted var objective = ""
    @Persisted var timeGoal = 47
    @Persisted var type = ""
    @Persisted var exerciseList = RealmSwift.List<String>()
    @Persisted var historyList = RealmSwift.List<History>()
    
  
    var exercises: [String] { Array(exerciseList) }
    var history: [History] { Array(historyList) }
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover"]
   
    
    convenience init(title: String,objective: String, timeGoal: Int, type: String, exercises: [String], history: [History] = []) {
        self.init()
        self.title = title
        self.objective = objective
        self.timeGoal = timeGoal
        self.type = type
        exerciseList.append(objectsIn: exercises)
       
        for entry in history {
            self.historyList.insert(entry, at: 0)
        }
    }
}

extension DailyWorkout {
    static var data: [DailyWorkout] {
        [
            DailyWorkout(title: "Dakota", objective: "Complete as Rx'd for time.", timeGoal: 58, type: "HIIT", exercises: ["Run 1 Mile","100 Push-Ups", "100 Pull-ups", "100 Sit-ups"]),
            DailyWorkout(title: "Remington", objective: "Complete for Time, focusing on form.", timeGoal: 56, type: "Power", exercises: ["Run 1 Mile","100 Push-Ups", "100 Pull-ups", "100 Sit-ups"]),
            DailyWorkout(title: "Montana", objective: "Complete for Time.", timeGoal: 57, type: "Strength", exercises:[ "Run 1 Mile","100 Push-Ups", "100 Pull-ups", "100 Sit-ups"]),
            DailyWorkout(title: "Cooper", objective: "Complete for Time.", timeGoal: 43, type: "Cardio", exercises: ["Run 1 Mile","100 Push-Ups", "100 Pull-ups", "100 Sit-ups"]),
            DailyWorkout(title: "Hayven", objective: "Steady and smoothe ", timeGoal: 60, type: "Recover", exercises: ["Run 1 Mile","100 Push-Ups", "100 Pull-ups", "100 Sit-ups"]),
        ]
    }
}
extension DailyWorkout {
    struct Data {
        dynamic var title: String = ""
        dynamic var objective: String = ""
        dynamic var type: String = ""
        dynamic var timeGoal: Double = 47.0
        dynamic var exercises: [String] = []
       
    }
    var data: Data {
        return Data(title: title, objective: objective, type: type, timeGoal: Double(timeGoal), exercises: exercises)
    }
    
    func update(from data: Data) {
        title = data.title
        objective = data.objective
        type = data.type
        for exercise in data.exercises {
            if !exercises.contains(exercise) {
                self.exerciseList.append(exercise)
            }
        }
        timeGoal = Int(data.timeGoal)
      
    }
}





