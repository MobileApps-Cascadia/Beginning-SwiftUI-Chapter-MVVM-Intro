//
//  QuizVM.swift
//  Chapter-MVVM-Intro
//
//  Created by Mike Panitz on 5/20/23.
//

import Foundation
import SwiftUI

class QuizViewModel : ObservableObject{
    
    var theModel: QuizStore
    
    @Published var currentQuestion: Quiz
    @Published var iCurrentQuestion = Int()
    
    init(theModel tM: QuizStore) {
        theModel = tM
        currentQuestion = theModel.allQuestions[0]
    }

    func updateToNextQuestion() -> Void {
        // TODO: Really ought to confirm that the given
        // quiz object is actually in the array of questions :)
        iCurrentQuestion = iCurrentQuestion + 1
        if(iCurrentQuestion>=theModel.allQuestions.count){
            iCurrentQuestion = 0
        }
            currentQuestion = theModel.allQuestions[iCurrentQuestion]
    }
    
    
    func getQuestions() -> [Quiz] {
        return theModel.allQuestions
    }
}
