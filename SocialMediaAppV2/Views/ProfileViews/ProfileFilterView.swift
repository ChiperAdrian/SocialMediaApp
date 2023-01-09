//
//  ProfileFilterView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI

struct ProfileFilterView: View {
    @State private var currentSelection = "Feed"

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Feed")
                        .foregroundColor(currentSelection == "Feed" ? .black : .gray)
                        .fontWeight(currentSelection == "Feed" ? .bold : .regular)
                        .onTapGesture {
                            withAnimation {
                                self.currentSelection = "Feed"
                            }
                        }
                    Capsule()
                        .foregroundColor(currentSelection == "Feed" ? Color(.systemBlue) : .clear)
                        .frame(height:3)
                        .overlay(Divider())
                }
                VStack {
                    Text("Replies")
                        .foregroundColor(currentSelection == "Replies" ? .black : .gray)
                        .fontWeight(currentSelection == "Replies" ? .bold : .regular)
                        .onTapGesture {
                            withAnimation {
                                self.currentSelection = "Replies"
                            }
                        }
                    Capsule()
                        .foregroundColor(currentSelection == "Replies" ? Color(.systemBlue) : .clear)
                        .frame(height:3)
                        .overlay(Divider())
                }
                VStack {
                    Text("Likes")
                        .foregroundColor(currentSelection == "Likes" ? .black : .gray)
                        .fontWeight(currentSelection == "Likes" ? .bold : .regular)
                        .onTapGesture {
                            withAnimation {
                                self.currentSelection = "Likes"
                            }
                        }
                    Capsule()
                        .foregroundColor(currentSelection == "Likes" ? Color(.systemBlue) : .clear)
                        .frame(height:3)
                        .overlay(Divider())
                }
            }
            if currentSelection == "Feed" {
                Text("Feed")
            }
            else if currentSelection == "Replies" {
                Text("Replies")
            }
            else {
                Text("Likes")
            }
        }
    }
}
struct ProfileFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFilterView()
    }
}
