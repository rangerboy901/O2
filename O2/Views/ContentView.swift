//
//  ContentView.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/18/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedResults(DailyWorkout.self) var workouts
    
    var body: some View {
//        if workouts.count == 0 {
//            EmptyListView()
//        }else{
            SplashScreen(workout: DailyWorkout())
        }
    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
