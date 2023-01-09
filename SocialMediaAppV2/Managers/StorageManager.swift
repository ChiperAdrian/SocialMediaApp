//
//  StorageManager.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import Foundation
import FirebaseStorage

class StorageManager {
    let storage = Storage.storage()
//    func getImage(url: String, completion: @escaping (_ data: Data) -> Void) {
//        let ref = storage.reference(forURL: url)
//        ref.getData(maxSize: 2048*2048) {data, err in
//            if err != nil {
//                print("Error: \(String(describing: err?.localizedDescription))")
//            }
//            else if let data = data {
//                completion(data)
//            }
//        }
//    }
    func uploadImage(imageData: Data, completion: @escaping(String)->Void) {
        let storage = Storage.storage().reference(withPath: "/profile_image/\(UUID().uuidString)")
        //guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        storage.putData(imageData, metadata: nil) {_, error in
            if let error = error {
                print("Failed to upload the image: \(error.localizedDescription)")
                return
            }
            storage.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
