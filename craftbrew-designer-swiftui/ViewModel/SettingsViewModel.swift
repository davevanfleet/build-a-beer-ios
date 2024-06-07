//
//  SettingsViewModel.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/28/24.
//

import Foundation
import AuthenticationServices

@Observable
class SettingsViewModel {
    var me: User?
    var isLoading = false
    var sessionManager = SessionManager()
    
    init() {
        self.fetchMe()
    }
    
    func fetchMe() {
        self.isLoading = true
        guard let url = URL(string: "https://buildabeer.app/api/Me") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            
            let me = try? JSONDecoder().decode(User.self, from: data)
            
            DispatchQueue.main.async {
                self.me = me
                self.isLoading = false
            }
        }.resume()
    }
    
    enum CreateUserError: Error {
        case unableToCreateUrl
        case apiResponseError (error: any Error)
        case jsonSerializationError
    }
    
    private func createUser(appleId: String, email: String?, firstName: String?, lastName: String?) throws {
        guard let url = URL(string: "https://buildabeer.app/api/Users") else {
            throw CreateUserError.unableToCreateUrl
        }
    
        var json = [String:Any]()
        json["appleId"] = appleId
        json["email"] = email
        json["firstName"] = firstName
        json["lastName"] = lastName
        
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            throw CreateUserError.jsonSerializationError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("api response error", error!)
                return
            }
        }
        task.resume()
        
    }
    
    func handleSuccessfulLogin(with authorization: ASAuthorization) {
        if let userCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            var firstName: String?
            var lastName: String?
            var email: String?
            
            let appleId = userCredential.user
            
            if userCredential.authorizedScopes.contains(.fullName) {
                firstName = userCredential.fullName?.givenName
                lastName = userCredential.fullName?.familyName
            }
            
            if userCredential.authorizedScopes.contains(.email) {
                email = userCredential.email
            }
            do {
                try createUser(appleId: appleId, email: email, firstName: firstName, lastName: lastName)
                self.saveUserInKeychain(userCredential)
            } catch CreateUserError.unableToCreateUrl {
                print("failed to create url for user create")
            } catch CreateUserError.jsonSerializationError {
                print("unable to serialize json payload for user create")
            } catch CreateUserError.apiResponseError (let error) {
                print("API Response error in create user: ", error )
            } catch {
                print("unknown error creating user")
            }
            
        }
    }
    
    func handleLoginError(with error: Error) {
        print("Could not authenticate: \\(error.localizedDescription)")
    }
    
    private func saveUserInKeychain(_ userIdentifier: ASAuthorizationAppleIDCredential) {
        sessionManager.saveToKeychain(appleIDCredential: userIdentifier)
    }
    
    var isLoggedIn: Bool {
        if let credential = sessionManager.retrieveFromKeychain() {
            return !credential.user.isEmpty
        }
        return false
    }
    
    var currentUserId: String {
        sessionManager.currentUserID
    }
    
    var credentialState: ASAuthorizationAppleIDProvider.CredentialState {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        var currentCredentialState:ASAuthorizationAppleIDProvider.CredentialState? = nil
        appleIDProvider.getCredentialState(forUserID: sessionManager.currentUserID) { (credentialState, error) in
            currentCredentialState = credentialState
            print("credentialState", credentialState)
            print("error", error!)
        }
        if currentCredentialState != nil {
            return currentCredentialState!
        }
        return ASAuthorizationAppleIDProvider.CredentialState.notFound
        
    }
}
