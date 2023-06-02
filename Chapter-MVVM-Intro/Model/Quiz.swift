import SwiftUI

class QuizStore : ObservableObject{
    @Published var allQuestions = [
        Quiz(question: "What is the capital of Assyria?", answer: "Nineveh"),
        Quiz(question: "What… is the air-speed velocity of an unladen African swallow?", answer: "About 40 miles per hour"),
        Quiz(question: "What… is the air-speed velocity of an unladen European swallow?", answer: "About 20 miles per hour"),
        Quiz(question: "What is 2+2?", answer: "4")]
}

class Quiz : Identifiable {
    
    let id = UUID()
    
    let question: String
    let answer: String
    
    init(   question q: String,
            answer a: String) {
        question = q
        answer = a
    }
    
    func getFullQuestion() -> String {
        return self.question + ": " + self.answer
    }
}
