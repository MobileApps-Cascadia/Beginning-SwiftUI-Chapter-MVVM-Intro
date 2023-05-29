//
//  ContentView.swift
//  Chapter-MVVM-Intro
//
//  Created by Mike Panitz on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            QuizView()
            Spacer()
            HStack {
                Spacer()
                Text("Current Player:")
                UserCircleView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserCircleViewModel(theModel: UserStore()))
            .environmentObject(QuizViewModel())
    }
}
