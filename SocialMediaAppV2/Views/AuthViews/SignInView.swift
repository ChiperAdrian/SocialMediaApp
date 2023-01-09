//
//  SignInView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 15.11.2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State var showRegisterModal = false
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack(alignment:.leading) {
                        Text("Hello")
                        Text("Welcome back")
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
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }
                Divider()
                HStack {
                    Spacer()
                    Text("Forgot Password?").font(.subheadline).foregroundColor(.blue).bold()
                }
            }.padding(.horizontal)
            Button {
                viewModel.signIn(withEmail: email, withPassword: password)
            }label:{
                Text("Sign in")
                    .bold()
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .frame(width:350, height:40)
                    .background(Color(.systemBlue))
                    .cornerRadius(50)
                    .shadow(radius: 5)
            }.padding()
            Spacer()
            Button {
                showRegisterModal.toggle()
            } label: {
                HStack {
                    Text("Don't have an account?")
                    Text("Sign up").bold()
                }
                .font(.subheadline)
                .foregroundColor(.blue)
            }
            .fullScreenCover(isPresented:$showRegisterModal) {
                RegisterView()
            }
            

        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
