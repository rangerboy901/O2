//
//  ButtonView.swift
//  O2
//
//  Created by Joseph Wil;liam DeWeese on 9/23/22.
//

import SwiftUI
import RealmSwift



struct ButtonView: View {
    
    @ObservedResults(DailyWorkout.self) var workouts
    @State var showSheet: Bool = false
    @State var newWorkoutData = DailyWorkout.Data()
    @State var currentWorkout = DailyWorkout()
    @State var isPresented = false
    @State private var showingWorkoutEditScreen: Bool = false
    
    
    var body: some View {
        
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
                
                Button(action: {
                    self.showingWorkoutEditScreen.toggle()
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("white"))
                        .frame(width: 28, height: 28, alignment: .center)
                } //: BUTTON
                
            }
         
        }
    }
    

struct ButtonView_Previews: PreviewProvider {
static var previews: some View {
    ButtonView()
}
}
