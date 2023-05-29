//
//  QuizVM.swift
//  Chapter-MVVM-Intro
//
//  Created by Mike Panitz on 5/20/23.
//

import Foundation
import SwiftUI

class UserCircleViewModel : ObservableObject{
    
    var theModel: UserStore
    
    @Published var currentUser: User
    
    init(theModel tM: UserStore) {
        theModel = tM
        currentUser = theModel.allUsers[0]
    }

    func setCurrentUser(userObj : User) -> Void {
        // TODO: Really ought to confirm that the given
        // user object is actually in the array of users :)
        currentUser = userObj
    }
    
    func getUsers() -> [User] {
        return theModel.allUsers
    }
}
