//
//  WorkoutCellView.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/22/22.
//

import SwiftUI

struct WorkoutCellView: View {
    
    let workout: DailyWorkout
    
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
            HStack {
    
                Text(workout.title)
                    .fontWeight(.bold)
                    .font(.title2)
                    .accessibilityAddTraits(.isHeader)
                    .foregroundColor(self.colorize(type: workout.type ))
                    .padding(3)
            }
            Text(workout.objective)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
              
            
            HStack{
                Spacer()
                Text("\(workout.type)")
                    .foregroundColor(Color.primary)
                    .accessibilityLabel("\(workout.type) Workout type")
                    .font(.caption2)
                    .padding(6)
                    .overlay(
                        Capsule().stroke(self.colorize(type: workout.type ), lineWidth: 4))
                        }
            .padding()

          
            
        }
        .padding()
    //    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .bottom, endPoint: .top))
        .overlay(
            RoundedRectangle(cornerSize: CGSize(width: 49, height: 50)).stroke(self.colorize(type: workout.type ), lineWidth: 5.0))
        
    }
}

struct WorkoutCellView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            WorkoutCellView(workout: DailyWorkout(title: "Dakota", objective: "complete as Rx'd", timeGoal: 45, type: "HIIT", exercises: ["push-ups"]))
        }
    }
}
