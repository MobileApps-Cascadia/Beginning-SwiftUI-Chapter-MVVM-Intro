import SwiftUI


class UserStore : ObservableObject {
    @Published var allUsers = [
        User(firstName: "Harry", lastName: "Potter", imageName: "HarryPotter"),
        User(firstName: "Ron", lastName: "Weasley", imageName: "RonWeasley"),
        User(firstName: "Hermione", lastName: "Granger", imageName: "HermioneGranger"),
    ]
}

class User : Identifiable {
    
    let id = UUID()
    
    let firstName: String
    let lastName: String
    let imageName: String
    
    init(   firstName f: String,
            lastName l: String,
            imageName i: String) {
        firstName = f
        lastName = l
        imageName = i
    }
}
