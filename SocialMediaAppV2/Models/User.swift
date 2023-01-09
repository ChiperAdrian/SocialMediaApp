//
//  User.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import Foundation
import FirebaseFirestoreSwift




struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    var email: String
    var fullname: String
    var profilePhotoUrl: String
    var username: String
    var location: String
    var link: String
    var quote: String
    var following: Int
    var followers: Int
}
