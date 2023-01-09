//
//  FeedTabView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI

struct FeedTabView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment:.leading) {
                ScrollView {
                    LazyVStack {
                        if let users = viewModel.users {
                            ForEach(users, id:\.id) { user in
                                FeedRowView(user: user).padding(.bottom)
                            }
                        }
                    }
                }.padding(.top, 60)
            }
            NavigationLink(destination: PostView()) {
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width:28, height:28)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
}

struct FeedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeedTabView()
    }
}
