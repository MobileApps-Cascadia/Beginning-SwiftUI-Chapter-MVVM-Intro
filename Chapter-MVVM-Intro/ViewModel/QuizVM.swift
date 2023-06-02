//
//  QuizVM.swift
//  Chapter-MVVM-Intro
//
//  Created by Kenz on 6/1/23.
//

import SwiftUI


class QVM: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var currentStep: CurrentStep = .ASK_QUESTION

    var currentQuestion: QuestAns {
        quizData[currentQuestionIndex]
    }

    var buttonText: String {
        currentStep == .ASK_QUESTION ? "Show Answer" : "Next Question"
    }

    func handleButtonTap() {
        if currentStep == .ASK_QUESTION {
            currentStep = .MOVE_TO_NEXT
        } else {
            currentStep = .ASK_QUESTION
            currentQuestionIndex = (currentQuestionIndex + 1) % quizData.count
        }
    }
}

enum CurrentStep {
    case ASK_QUESTION
    case MOVE_TO_NEXT
}
