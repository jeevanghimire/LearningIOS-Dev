
import SwiftUI

final class forgotPassword: ObservableObject {
    @Published var email = ""
    @Published var popUp = false
    
    
    func sendEmail() async throws {
        guard !email.isEmpty else{
            //popup menu
            print("Email is required")
        }
        Task{
            do{
                let forgoteddataMail: () = try await AuthManager.shared .forgotPassword(email: email)
                print("Email Sent: \(forgoteddataMail)")
            }
            catch{
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    struct PasswordForgot: View {
        @StateObject var forgot = forgotPassword()
        var body: some View {
            HStack{
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("Enter Your Email", text: .constant(""))
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }.padding(.horizontal)
            //button
                .padding()
            Button(action: {
                
                print("Send Button Clicked")
            }){
                Text("Send")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10.0)
            }
        }
    }
}

#Preview {
       PasswordForgot()
}
