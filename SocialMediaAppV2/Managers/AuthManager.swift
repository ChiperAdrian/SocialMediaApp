//
//  AuthManager.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import Foundation
import FirebaseAuth

class AuthManager {
    var userSession = Auth.auth().currentUser
    
    func register(withEmail email: String, withPassword password: String, withUsername username: String, withFullname fullname: String, completion: @escaping (_ uid: String) -> Void) {
        print("Registered")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to register. \(error.localizedDescription)")
                return
            }
            if let result = result {
                self.userSession = result.user
                completion(result.user.uid) // Here we link the user from Auth to a user from Firestore
            }
        }
    }
    
    func signIn(withEmail email: String, withPassword password: String, completion: @escaping (_ id: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to log in. \(error.localizedDescription)")
                return
            }
            if let result = result {
                self.userSession = result.user
                completion(result.user.uid)
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}



