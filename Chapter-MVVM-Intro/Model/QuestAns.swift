import SwiftUI

 let quizData = [
     QuestAns(question: "What is the capital of Assyria?", answer: "Nineveh"),
     QuestAns(question: "What… is the air-speed velocity of an unladen African swallow?", answer: "About 40 miles per hour"),
     QuestAns(question: "What… is the air-speed velocity of an unladen European swallow?", answer: "About 20 miles per hour"),
     QuestAns(question: "What is 2+2?", answer: "4")
 ]

struct QuestAns {
     let question: String
     let answer: String
 }
