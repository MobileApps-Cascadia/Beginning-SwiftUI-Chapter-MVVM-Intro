import SwiftUI

struct QuizView: View {
    @StateObject var viewModel = QuizViewModel()
    
    var body: some View {
        VStack {
            Text("Quiz Program")
                .font(.largeTitle)
            Spacer()
            Text(viewModel.currentQuestion.question)
                .bold()
                .font(.title)
            Spacer()
            if viewModel.currentStep == .MOVE_TO_NEXT {
                Text("Answer:")
                Text(viewModel.currentQuestion.answer)
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
            Button(viewModel.buttonText) {
                viewModel.handleButtonTap()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
