//
//  ProfileTabView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI

struct ProfileTabView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        if viewModel.currentUser != nil {
            ZStack {
                ProfileView(user: viewModel.currentUser ?? User(email: "", fullname: "", profilePhotoUrl: "", username: "", location: "", link: "", quote: "", following: 0, followers: 0))
                ProfileButtons().padding(.bottom, 380).padding(.leading, 130)
            }
        }
        else {
            ProgressView()
        }
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView()
    }
}


struct ProfileButtons: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        HStack(spacing:15) {
            Spacer()
            Image(systemName: "bell.badge")
                .padding(5)
                .overlay(Circle().stroke(Color.gray))
            NavigationLink(destination:EditProfileView(viewModel: viewModel,
                                                       name: viewModel.currentUser?.fullname ?? "",
                                                       quote: viewModel.currentUser?.quote ?? "",
                                                       location: viewModel.currentUser?.location ?? "",
                                                       link: viewModel.currentUser?.link ?? ""))
            {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width:30, height:30)
                    .foregroundColor(.black)
//                Text("Edit Profile")
//                    .padding(.horizontal, 15)
//                    .padding(.vertical, 5)
//                    .font(.subheadline)
//                    .bold()
//                    .foregroundColor(.black)
//                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray))
            }
        }
        .padding(.trailing)
    }
}
