//
//  ConnectTabView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct ConnectTabView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment:.leading) {
            ScrollView {
                LazyVStack {
                    if let users = viewModel.users {
                        ForEach(users, id:\.id) { user in
                            VStack {
                                HStack {
                                    NavigationLink(destination: ProfileView(user: user)) {
                                        UserView(user: user)
                                    }
                                    Spacer()
                                }
                                HStack {
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "person.badge.plus")
                                    }
                                    Button {
                                        
                                    } label: {
                                        Text("Follow").font(.caption)
                                    }
                                }.foregroundColor(.blue).padding(.horizontal).offset(x:0, y:-30)
                            }
                        }
                    }
                }
            }.padding(.top, 60)
        }
    }
}

struct ConnectTabView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectTabView()
    }
}
