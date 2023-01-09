//
//  ViewModel.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import Foundation
class ViewModel: ObservableObject {
    let authManager = AuthManager()
    let databaseManager = DatabaseManager()
    let storageManager = StorageManager()
    @Published var currentUser: User?
    @Published var users: [User]?
    @Published var posts: [Post]?
    
    init() {
        self.getUsers()
        self.getPosts()
        if let userSession = self.authManager.userSession {
            self.databaseManager.readUser(withId: userSession.uid) { user in
                self.currentUser = user
            }
        }
    }
    
    func register(withEmail email: String, withPassword password: String, withUsername username: String, withFullname fullname: String) {
        authManager.register(withEmail: email, withPassword: password, withUsername: username, withFullname: fullname) { uid in
            self.databaseManager.createUser(id: uid, email: email, username: username, fullname: fullname)
            self.currentUser = User(id: uid, email: email, fullname: fullname, profilePhotoUrl: "", username: username, location: "Location", link: "Link", quote: "Quote", following: 0, followers: 0)
        }
    }
    
    func signIn(withEmail email: String, withPassword password: String) {
        authManager.signIn(withEmail: email, withPassword: password) { id in
            self.databaseManager.readUser(withId: id) { user in
                self.currentUser = user
            }
        }
    }
    
    func signOut() {
        authManager.signOut()
        self.currentUser = nil
    }
    
    func getUsers() {
        self.databaseManager.readUsers { users in
            self.users = users
        }
    }
    
    func getPosts() {
        self.databaseManager.readPosts { posts in
            self.posts = posts
        }
    }
    
    func getProfilePhotoUrl(idOfUser: String) -> String {
        if let users = self.users {
            if let user = users.first(where: {$0.id == idOfUser}) {
                return user.profilePhotoUrl
            }
        }
        return ""
    }
    
    func uploadImage(imageData: Data) {
        self.storageManager.uploadImage(imageData: imageData) { profilePhotoUrl in
            self.databaseManager.updateUser(withId: self.currentUser!.id!, field: "profilePhotoUrl", value: profilePhotoUrl)
            
            
//            if let userSession = self.authManager.userSession {
//                self.databaseManager.createProfilePhotoUrl(profilePhotoUrl, userSession.uid)
//                self.user.profilePhotoURL = profilePhotoUrl
//                //self.user.imageData = imageData
//            }
        }
    }
}
