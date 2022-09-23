//
//  WorkoutEditScreen.swift
//  O2
//
//  Created by Joseph Wil;liam DeWeese on 9/22/22.
//

import SwiftUI

struct WorkoutEditScreen: View {
    
    
    
    
    
    
    
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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WorkoutEditScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEditScreen()
    }
}
