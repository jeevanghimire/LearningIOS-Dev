import Foundation
import FirebaseAuth

struct AuthDataCollection {
    let firstName:String;
    let lastName:String;
    let email: String
    let password: String
    
    init(user: FirebaseAuth.User,password: String, firstName: String, lastName: String) {
        self.firstName = firstName // Provide a default value if firstName is nil
        self.lastName = lastName // Provide a default value if lastName is nil
        self.email = user.email ?? ""  // Provide a default value if email is nil
        self.password = password // Provide a default value if password is nil
         // Use optional chaining to safely unwrap photoURL
    }
}

final class AuthManager {
    
    static let shared = AuthManager()  // Corrected singleton instance name
    private init() { }
//Create User
    func createUser(firstName: String, lastName: String, email: String, password: String) async throws -> AuthDataCollection {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let changeRequest = authResult.user.createProfileChangeRequest()
        changeRequest.displayName = "\(firstName) \(lastName)"
        try await changeRequest.commitChanges()
        return AuthDataCollection(user: authResult.user,
                                  password: password,
                                  firstName:firstName,
                                  lastName: lastName
        )
    }
//Check User
    func checkUser(email: String, password: String) async throws -> AuthDataResult {
        do {
            let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
            // User is successfully authenticated
            return authDataResult
        } catch let error as NSError {
            if error.code == AuthErrorCode.userNotFound.rawValue {
                // User is not registered
                throw AuthError.userNotFound
            } else {
                // Other authentication error occurred
                throw error
            }
        }
    }

    //Forgot Password
    func forgotPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
}
enum AuthError: Error {
    case userCreationFailed
    case userNotFound
}
