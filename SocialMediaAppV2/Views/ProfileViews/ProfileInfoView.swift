//
//  ProfileInfoView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI

struct ProfileInfoView: View {
    var user: User
    var body: some View {
        VStack (alignment:.leading) {
            UserName(user: user)
            LocationAndLink(user: user)
            Followers(user: user)
        }
        .padding(.horizontal)
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(user: User(email: "", fullname: "", profilePhotoUrl: "", username: "", location: "", link: "", quote: "", following: 0, followers: 0))
    }
}

struct UserName: View {
    var user: User
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("\"\(user.quote)\"")
                .foregroundColor(.black)
                .font(.subheadline)
                .italic()
                .padding(.vertical)
        }
    }
}

struct LocationAndLink: View {
    var user: User
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text(user.location)
            }
            HStack {
                Image(systemName: "link")
                Text(user.link)
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
    }
}

struct Followers: View {
    var user: User
    var body: some View {
        HStack {
            HStack {
                Text("\(user.following)")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack {
                Text("\(user.followers)")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }.padding(.vertical)
    }
}
