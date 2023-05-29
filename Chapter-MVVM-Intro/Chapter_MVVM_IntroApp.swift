//
//  Chapter_MVVM_IntroApp.swift
//  Chapter-MVVM-Intro
//
//  Created by Mike Panitz on 5/20/23.
//

import SwiftUI

@main
struct Chapter_MVVM_IntroApp: App {
    
    @StateObject var theViewModel = UserCircleViewModel(theModel: UserStore())
    @StateObject var theQuizViewModel = QuizViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(theViewModel)
        }
    }
}
