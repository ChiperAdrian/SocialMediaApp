//
//  FeedRowView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct FeedRowView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            UserView(user: user)
            Text("I really love when people are helping each other. This is a very positive behaviour of human beings which should be encouraged by anyone").padding(.horizontal)
            Buttons()
            Divider()
        }
    }
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(user: User(email: "", fullname: "", profilePhotoUrl: "", username: "", location: "", link: "", quote: "", following: 0, followers: 0))
    }
}


struct Dislike: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: "hand.thumbsdown").foregroundColor(.blue)
            }
            Text("3 dislikes").font(.caption2).padding(.top,5)
        }.padding(.top)
    }
}

struct Like: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: "hand.thumbsup").foregroundColor(.blue)
            }
            Text("20 likes").font(.caption2).padding(.top,5)
            
        }.padding(.top)
    }
}

struct Chat: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "bubble.left").foregroundColor(.blue)
        }
    }
}

struct Bookmark: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "bookmark").foregroundColor(.blue)
        }
    }
}

struct Buttons: View {
    var body: some View {
        HStack {
            Chat()
            Spacer()
            Like()
            Spacer()
            Dislike()
            Spacer()
            Bookmark()
        }
        .foregroundColor(.gray)
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
    }
}
