import SwiftUI

// MUST INCLUDE:
// @State_Object_, not just @State (otherwise updates to properties isn't noticed by the view, even if the VM is ObsereableObject and properties are @Published


struct QuizView: View {
    @State var iCurrentQuestion = 0
    @State var questions = [
        "What is the capital of Assyria?",
        "What… is the air-speed velocity of an unladen African swallow?",
        "What… is the air-speed velocity of an unladen European swallow?",
        "What is 2+2?"
        
    ]
    @State var answers = [
        "Nineveh",
        "About 40 miles per hour",
        "About 20 miles per hour",
        "4"
    ]
    
    enum CurrentStep {
        case ASK_QUESTION
        case MOVE_TO_NEXT
    }
    @State var currentStep = CurrentStep.ASK_QUESTION
    
    var body: some View {
        VStack {

            Text("Quiz Program")
                .font(.largeTitle)
            Spacer()
            Text(theViewModel.question())
                .bold()
                .font(.title)
            Spacer()
            if theViewModel.currentStep == .SHOWING_ANSWER {
                Text("Answer:")
                Text(theViewModel.answer())
                    .bold()
                    .font(.title)
            } else {
                // by putting these on the screen the text
                // won't jump around as much when the user
                // clicks on the 'show answer' button
                Text(" ") // gotta put at least 1 character in here
                Text(" ")
                    .bold()
                    .font(.title)
            }
            Spacer()
            Button(theViewModel.currentStep == .SHOWING_QUESTION ? "Show Answer" : "Next Question") {
                theViewModel.moveToNextStep()
            }
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }.padding()
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
