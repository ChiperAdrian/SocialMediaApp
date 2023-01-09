//
//  UserView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI
import Kingfisher

struct UserView: View {
    var user: User
    var body: some View {
        HStack(alignment:.top) {
            if user.profilePhotoUrl != "" {
                KFImage(URL(string: user.profilePhotoUrl))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:56, height:56)
            }
            else {
                Circle()
                    .frame(width:56, height:56)
            }
            VStack(alignment:.leading, spacing:5) {
                HStack {
                    Text(user.fullname).font(.subheadline).bold().foregroundColor(.black)
                    Text("@\(user.username)").font(.caption).foregroundColor(.gray)
                    Text("2w").font(.caption).foregroundColor(.gray)
                }
                Text("\"\(user.quote)\"")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .italic()
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.bottom)
        .padding(.leading)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(id: "", email: "", fullname: "", profilePhotoUrl: "", username: "", location: "", link: "", quote: "", following: 0, followers: 0))
    }
}
