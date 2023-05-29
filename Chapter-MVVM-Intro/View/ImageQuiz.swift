import SwiftUI

// CREDIT: Images were created using https://www.bing.com/images/create/ (Bing, but powered by DALL-E)


// Keeping multiple arrays was a drag, so let's bundle all the
// info related to one question into one object
struct Question {
    let topic:String
    let iamgeNames:[String]
    let answer: Int
}

struct ImageQuizView: View {
    
    @State var iCurrentQuestion = 0
    @State var questions: [Question] = [
        Question( topic: "strawberries",
                  iamgeNames: [ "Raspberry", "Cherry", "Strawberry" ],
                  answer: 2),
        Question( topic: "a bird",
                  iamgeNames: [ "Robin-1", "Bike-1", "Bike-2" ],
                  answer: 0),
        Question( topic: "a bike",
                  iamgeNames: [ "Robin-2", "Bluejay-1", "Bike-1" ],
                  answer: 2)
    ]

    enum CurrentStep {
        case ASK_QUESTION
        case MOVE_TO_NEXT_CORRECT
        case MOVE_TO_NEXT_WRONG
    }
    @State var currentStep = CurrentStep.ASK_QUESTION
    func wrongAnswer() -> Void {
        currentStep = .MOVE_TO_NEXT_WRONG
    }
    func correctAnswer() -> Void {
        currentStep = .MOVE_TO_NEXT_CORRECT
    }
    
    var body: some View {
        VStack {
            Text("Image Quiz Program")
                .font(.largeTitle)
            Text("Pick the image that looks like \(questions[iCurrentQuestion].topic)")
                .font(.title)
            if currentStep == .ASK_QUESTION {
                List( questions[iCurrentQuestion].iamgeNames, id:\.self) { img in
                    
                    HStack{
                        Spacer()
                        
                        // this is the right answer if the 'img' string is the same
                        // as the string in the slot designated for the answer:
                        if img == questions[iCurrentQuestion].iamgeNames[questions[iCurrentQuestion].answer] {
                            Image(img)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                                .onTapGesture(perform: correctAnswer)
                        } else {
                            Image(img)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                                .onTapGesture(perform: wrongAnswer)
                        }
                        
                        Spacer()
                    }
                }
            }
            if currentStep == .MOVE_TO_NEXT_WRONG ||
                currentStep == .MOVE_TO_NEXT_CORRECT{
                
                if currentStep == .MOVE_TO_NEXT_WRONG {
                    Text("Sorry,that's not right.  The correct answer is:")
                } else { // currentStep == .MOVE_TO_NEXT_CORRECT
                    Text("Correct! You chose:")
                }
                
                Image(questions[iCurrentQuestion].iamgeNames[questions[iCurrentQuestion].answer])
                
                Button( "Next Question") {
                    currentStep = .ASK_QUESTION
                    iCurrentQuestion = iCurrentQuestion + 1
                    iCurrentQuestion = iCurrentQuestion % questions.count
                }
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
             
                Spacer()
            }
        }.padding()
    }
}

struct ImageQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ImageQuizView()
    }
}
