import SwiftUI

// MUST INCLUDE:
// @State_Object_, not just @State (otherwise updates to properties isn't noticed by the view, even if the VM is ObsereableObject and properties are @Published


struct UserCircleView: View {

    @EnvironmentObject var theViewModel: UserCircleViewModel
    @State private var isPresented: Bool = false
    
    var body: some View {
        UserRow(user: theViewModel.currentUser)
            .onLongPressGesture {
                isPresented = true
            }
            .popover(isPresented: $isPresented, arrowEdge: .top) {
                VStack {
                    Text("Pick a user")
                        .font(.headline)
                        .padding()
                    
                    Divider()
                    
                    List {
                        ForEach(theViewModel.getUsers()) { theUser in
                            UserRow(user: theUser)
                                .onTapGesture {
                                    isPresented = false
                                    theViewModel.setCurrentUser(userObj: theUser)
                                }
                        }
                    }
                }
                .background(Color.yellow)
                .cornerRadius(10)
            }
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Spacer()
            Text(user.firstName + " "  + user.lastName)
                .font(.largeTitle)
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(2)
                .background(Color.gray)
                .clipShape(Circle())
        }
    }
}

struct UserCircleViewPreviews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            UserCircleView()
                .padding()
                .environmentObject(UserCircleViewModel(theModel: UserStore()))
        }
        
    }
}
