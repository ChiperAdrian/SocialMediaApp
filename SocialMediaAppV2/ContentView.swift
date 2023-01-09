//
//  ContentView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        if viewModel.authManager.userSession != nil {
            if viewModel.currentUser == nil {
                ProgressView()
            }
            else {
                TabView {
                    NavigationView {
                        ProfileTabView().environmentObject(viewModel)
                    }.tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    NavigationView {
                        FeedTabView().environmentObject(viewModel)
                        }.tabItem {
                            Label("Feed", systemImage: "newspaper")
                        }
                    NavigationView {
                        ConnectTabView().environmentObject(viewModel)
                    }
                    .accentColor(.white)
                    .tabItem{
                        Label("Connect", systemImage: "app.connected.to.app.below.fill")
                    }
                    NavigationView {
                        NotificationsTabView().environmentObject(viewModel)
                    }
                    .tabItem{
                        Label("Notifications", systemImage: "bell")
                    }
                    NavigationView {
                        MessagesTabView().environmentObject(viewModel)
                    }
                    .tabItem {
                        Label("Messages", systemImage: "envelope")

                    }
                }
            }
        }
        else {
            SignInView().environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
