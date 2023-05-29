import SwiftUI

// MUST INCLUDE:
// @State_Object_, not just @State (otherwise updates to properties isn't noticed by the view, even if the VM is ObsereableObject and properties are @Published


struct QuizView: View {
    
    
    @StateObject var theViewModel = QuizViewModel()

    @EnvironmentObject var theQuizViewModel: QuizViewModel
    
    var body: some View {
        VStack {

            Text("Quiz Program")
                .font(.largeTitle)
            Spacer()
            Text(theQuizViewModel.question())
                .bold()
                .font(.title)
            Spacer()
            if theQuizViewModel.currentStep == .SHOWING_ANSWER {
                Text("Answer:")
                Text(theQuizViewModel.answer())
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
            Button(theQuizViewModel.currentStep == .SHOWING_QUESTION ? "Show Answer" : "Next Question") {
                theQuizViewModel.moveToNextStep()
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
            .environmentObject(QuizViewModel())
    }
}
