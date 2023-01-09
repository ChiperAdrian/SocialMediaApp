//
//  DatabaseManager.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import Foundation
import Firebase

enum Entities {
    case user
    case post
}

class DatabaseManager {
    let firestore = Firestore.firestore()

    
    func createUser(id: String, email: String, username: String, fullname: String) {
        let data = ["email": email,
                    "username":username.lowercased(),
                    "fullname": fullname,
                    "location": "Location",
                    "profilePhotoUrl" : "",
                    "link":"Link",
                    "quote":"Quote",
                    "followers": 0,
                    "following": 0] as [String : Any]
        self.firestore.collection("users").document(id).setData(data)
    }
    
    func readUser(withId id: String, completion: @escaping (User) -> Void) {
        self.firestore.collection("users").document(id).addSnapshotListener { snapshot, _ in
            guard let snapshot = snapshot else {return}
            guard let user = try? snapshot.data(as: User.self) else {return}

            completion(user)
        }
    }
    
    func readUsers(completion: @escaping ([User]) -> Void) {
        self.firestore.collection("users").addSnapshotListener { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            var users = [User]()
            documents.forEach { document in
                guard let user = try? document.data(as: User.self) else {return}
                users.append(user)
            }
            completion(users)
        }
    }
    
    func updateUser(withId id: String, field: String, value: String) {
        self.firestore.collection("users").document(id).updateData([field: value])
    }
    
//    func deleteUser(withId id: String) {
//        self.firestore.collection("users").document(id).delete()
//    }
    
    func createPost(idOfUser:String, caption: String) {
        let data = ["idOfUser": idOfUser,
                    "caption": caption,
                    "likes": 0,
                    "timeStamp": Timestamp(date: Date())] as [String : Any]
        self.firestore.collection("posts").addDocument(data: data)
    }
    func readPost(withId id: String, completion: @escaping (Post) -> Void) {
        self.firestore.collection("posts").document(id).addSnapshotListener { snapshot, _ in
            guard let snapshot = snapshot else {return}
            guard let post = try? snapshot.data(as: Post.self) else {return}
            completion(post)
        }
    }
    func readPosts(completion: @escaping ([Post]) -> Void) {
        self.firestore.collection("posts").addSnapshotListener { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            var posts = [Post]()
            documents.forEach { document in
                guard let post = try? document.data(as: Post.self) else {return}
                posts.append(post)
            }
            completion(posts)
        }
    }
    
    func updatePost(withId id: String, field: String, value: String) {
        self.firestore.collection("posts").document(id).updateData([field: value])
    }
    
//    func deletePost(withId id: String) {
//        self.firestore.collection("posts").document(id).delete()
//    }
}
