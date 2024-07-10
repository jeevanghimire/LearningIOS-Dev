import SwiftUI

@MainActor
final class User: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var popover = false
    
    func signUp() async throws {
        Task {
            do {
                print("Sign Up Button Clicked")
                let authData = try await AuthManager.shared.createUser(firstName: firstName, lastName: lastName, email: email, password: password)
                print("User Created: \(authData.firstName) \(authData.lastName) \(authData.email) \(authData.password)")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

struct SignUp: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            // Name
            Divider()
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("Enter Your First Name", text: $user.firstName)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Divider()
            
            // Last Name
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("Enter Your Last Name", text: $user.lastName)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Divider()
            
            // Email
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.gray)
                TextField("Enter Your Email", text: $user.email)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Divider()
            
            // Password
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray)
                SecureField("Enter Your Password", text: $user.password)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Divider()
            
            // Sign Up Button
            Button(action: {
                Task {
                    do {
                        print("Sign Up Button Clicked")
                        try await user.signUp()
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
            .padding(.top, 100)
        }
    }
}

// Preview
#Preview{
        SignUp()
}
