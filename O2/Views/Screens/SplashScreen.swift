//
//  SplashScreen.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/18/22.
//

import SwiftUI

struct SplashScreen: View {
    ///PROPERTIES
    @State var animationValues: [Bool] = Array(repeating: false, count: 10)
    @State var isPresented: Bool = false
    let workout = DailyWorkout()
    var body: some View {
        
        ZStack{
            
            WorkoutListScreen(workouts: .constant(DailyWorkout.data), saveAction: {})
            
            if !animationValues[7] {
                ///SPLASH SCREEN
                //       VStack {
                
                ZStack {
                    
                    if animationValues[1]{
                        Circle()//right
                            .fill(.orange)
                            .frame(width: 200, height: 200)
                            .opacity(0.5)
                        
                    }
                    ZStack{
                        //showing second circle
                        
                        Circle()//left
                            .fill(.orange)
                            .frame(width: 200, height: 200)
                        //scaling from the bottom...
                            .padding()
                            .offset(x: animationValues[2] ? -45 : 0)
                    }
                    ///// Scaling down...
                    .scaleEffect(animationValues[3] ? 0.80 : 0)
                    .padding(.top, 200)
                    .drawingGroup()
                    
                    HStack {
                        Text("O")
                            .font(.system(size: 150, design: .serif))
                            .scaleEffect(animationValues[0] ? 1.0 : 0, anchor: .bottom)
                            .foregroundColor(.primary)
                            .opacity(0.7)
                        Text("2")
                            .scaleEffect(animationValues[0] ? 1.0 : 0, anchor: .bottom)
                            .padding(.bottom, 125)
                            .font(.system(size: 50, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .opacity(0.7)
                    }
                }///#endOf"if"AnimationValuesLoop
                
                
                .opacity(animationValues[6] ? 0 : 1)
                
            }///#endOfVStack{}
        }
        
        ///ANIMATION SCHEDULING
        .onAppear {
            
            //SCALE EFFECT...
            withAnimation(.easeInOut(duration: 0.3)){
                animationValues[0] = true
            }
            //showing second circle...
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animationValues[1] = true
            }
            //circles moving way from each other...
            withAnimation(.easeInOut(duration: 1.5).delay(0.5)) {
                animationValues[2] = true
            }
            //showing sub rings...
            withAnimation(.easeInOut(duration: 0.5).delay(0.45)){
                animationValues[3] = true
            }
            //showing center combing bar...
            withAnimation(.easeInOut(duration: 0.7).delay(1.0)){
                animationValues[4] = true
            }
            //showing atom coming together
            withAnimation(.easeInOut(duration: 0.7).delay(1.0)){
                animationValues[5] = true
            }
            // Restoring Back...
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                withAnimation(.easeInOut(duration: 0.4).delay(0.9)){
                    animationValues[5] = false
                }
                
                // Ending Splash Screen...
                withAnimation(.easeInOut(duration: 0.5).delay(0.95)){
                    animationValues[6] = true
                }
                
                // For Performance removing splash screen after 2 secs...
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    animationValues[7] = true
                    
                }
                
            }
            
            
        }
        
        }
    }
    
    

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
