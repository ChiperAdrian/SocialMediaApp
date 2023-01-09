//
//  ProfileView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    var user: User
    var body: some View {
        VStack(alignment:.leading) {
            ProfileHeaderView(user: user)
            ProfileInfoView(user: user).padding(.top,40)
            ProfileFilterView()
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(email: "", fullname: "", profilePhotoUrl: "", username: "", location: "", link: "", quote: "", following: 0, followers: 0))
    }
}
