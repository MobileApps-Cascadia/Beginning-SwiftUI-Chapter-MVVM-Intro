//
//  QuizVM.swift
//  Chapter-MVVM-Intro
//
//  Created by Mike Panitz on 5/20/23.
//

import Foundation

class QuizViewModel : ObservableObject{
    
    private var theModel = Quiz()
    
    enum CurrentStep: String {
        case SHOWING_QUESTION
        case SHOWING_ANSWER
    }
    @Published var currentStep = CurrentStep.SHOWING_QUESTION
    
    func moveToNextStep() -> Void {
        if currentStep == .SHOWING_QUESTION {
            currentStep = .SHOWING_ANSWER
        } else {
            currentStep = .SHOWING_QUESTION
            iCurrentQuestion = (iCurrentQuestion + 1) % theModel.count
        }
        
        print("Button clicked - AFTER\n\tiCurrentQuestion: \(iCurrentQuestion)\n\tStep: \(String(currentStep.rawValue))")
    }
    
    var iCurrentQuestion = 0
    
    var count : Int {
        return theModel.count
    }
    
    func question(  ) -> String {
        return theModel.question(number: iCurrentQuestion)
    }
    
    func answer( ) -> String {
        return theModel.answer(number: iCurrentQuestion)
    }
}
