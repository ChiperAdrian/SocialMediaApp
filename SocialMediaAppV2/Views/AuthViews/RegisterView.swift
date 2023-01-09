//
//  RegisterView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack(alignment:.leading) {
                        Text("Get started")
                        Text("Create your account")
                    }
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    Spacer()
                .bold()
                }
            }
            .frame(width:400, height: 200)
            .background(Color(.systemBlue))
            .cornerRadius(80, corners: [.bottomRight])
            .ignoresSafeArea()
            VStack() {
                HStack {
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Email", text: $email)
                }
                Divider().padding(.bottom, 50)
                HStack {
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Username", text: $username)
                }
                Divider().padding(.bottom, 50)
                HStack {
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Full name", text: $fullName)
                }
                Divider().padding(.bottom, 50)
                HStack {
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }
                Divider()
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
            Button {
                viewModel.register(withEmail: email,
                                       withPassword: password,
                                       withUsername: username,
                                       withFullname: fullName)
            }label:{
                Text("Sign up")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .frame(width:350, height:40)
                    .background(Color(.systemBlue))
                    .cornerRadius(50)
                    .shadow(radius: 5)
                    .bold()
            }.padding()
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in").bold()
                }
                .font(.subheadline)
                .foregroundColor(.blue)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
