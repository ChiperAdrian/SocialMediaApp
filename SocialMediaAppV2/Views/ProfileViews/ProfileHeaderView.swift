//
//  ProfileHeaderView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    var user: User
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue).ignoresSafeArea()
            if user.profilePhotoUrl  != "" {
                KFImage(URL(string: user.profilePhotoUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width:70, height:70)
                    .offset(x: 15, y:25)
            }
            else {
                Circle()
                    .frame(width:70, height:70)
                    .offset(x: 15, y:25)
            }
        }
        .frame(height:100)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User(email: "", fullname: "", profilePhotoUrl: "", username: "", location: "", link: "", quote: "", following: 0, followers: 0))
    }
}
