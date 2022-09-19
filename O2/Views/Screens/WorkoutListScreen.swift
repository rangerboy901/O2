//
//  WorkoutListScreen.swift
//  O2
//
//  Created by Joseph Wil;liam DeWeese on 9/18/22.
//

import SwiftUI

struct WorkoutListScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                List(0 ..< 5) { item in
                    Text("Hello, World!")
                }
            }
            .navigationTitle("Workouts")
        }
      
    }
}

struct WorkoutListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListScreen()
    }
}
