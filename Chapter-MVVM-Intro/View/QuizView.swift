import SwiftUI

struct QuizView: View {
    @EnvironmentObject var theViewModel: QuizViewModel
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
            Text(theViewModel.currentQuestion.question)
                .bold()
                .font(.title)
            Spacer()
            if currentStep == .MOVE_TO_NEXT {
                Text("Answer:")
                Text(theViewModel.currentQuestion.answer)
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
            Button(currentStep == .ASK_QUESTION ? "Show Answer" : "Next Question") {
                if currentStep == .ASK_QUESTION {
                    currentStep = .MOVE_TO_NEXT
                } else {
                    currentStep = .ASK_QUESTION
                    theViewModel.updateToNextQuestion()
                }
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
            .environmentObject(QuizViewModel(theModel: QuizStore())
            )
    }
}
