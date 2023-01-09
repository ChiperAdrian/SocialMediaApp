//
//  Post.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import Foundation
import FirebaseFirestoreSwift


struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    var caption: String
    var likes = 0
    var timeStamp: Date
}
