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
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Text Quiz")
                }
            ImageQuizView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Image Quiz")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
