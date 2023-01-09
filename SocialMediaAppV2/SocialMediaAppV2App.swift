//
//  SocialMediaAppV2App.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI
import Firebase

@main
struct SocialMediaAppV2App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
