//
//  O2App.swift
//  O2
//
//  Created by Joseph William DeWeese on 9/18/22.
//

import SwiftUI

@main
struct O2App: App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path())
            NavigationView{
              SplashScreen()
            }
        }
    }
}
