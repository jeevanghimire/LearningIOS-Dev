
import SwiftUI
import Firebase

@MainActor
//make the user final class to check the user is exist or not

final class UserCheck: ObservableObject {
    //code that check the user is exist or not
    @Published var email = ""
    @Published var password = ""
    
    func SignIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("Email and Password is required")
            return
        }
        
            do{
                let checkData = try await AuthManager.shared.checkUser(email: email, password: password)
                print("User Checked: \(checkData)")
                
            }
            catch{
                print("Error: \(error.localizedDescription)")
            }
        
    }
    
    
}
    
    struct LoginPage: View {
        @StateObject var user = UserCheck()
        var body: some View {
            //logo Section
            Text("Logo Here")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding(.bottom,100)
                .textCase(.uppercase)
            VStack{
                //Name
                VStack {
                    HStack{
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        TextField("Email...", text:$user.email)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                            .textContentType(.emailAddress)
                            .textCase(.lowercase)
                        
                    }.padding(.horizontal)
                }
                HStack{
                    Image(systemName: "lock.fill")
                        .foregroundColor(.blue)
                    SecureField("Password...", text:$user.password)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    
                    
                }.padding(.horizontal)
                //Button
                
                Button(action: {
                    print("Button Clicked")
                    Task {
                        do {
                            try await user.SignIn()
                        } catch {
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                  
                }) {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 40)
                        .background(Color.blue)
                        .cornerRadius(30)
                }.padding(.top, 20)
            }.padding(.bottom, 20)
            //Forgot Password
            NavigationLink(destination: PasswordForgot()){
                Text("Forgot Password?")
                    .font(.headline)
                    .foregroundColor(.blue)
            }.padding(.bottom,10);
            
            
            //Sign Up
            HStack{
                
                Text("Don't have an account?")
                    .font(.headline)
                    .foregroundColor(.gray)
                NavigationLink(destination:SignUp()){
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            
        }

    }
    
    #Preview {
        LoginPage()
    }

