//
//  MessagesTabView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct MessagesTabView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...10, id:\.self) { _ in
                    NavigationLink(destination: ChatView()) {
                        MessageRow()
                    }
                    Divider()
                }
            }
        }
    }
}

struct MessagesTabView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesTabView()
    }
}

struct MessageRow: View {
    var body: some View {
        VStack {
            HStack {
                Circle().frame(width:56, height:56)
                VStack(alignment:.leading) {
                    Text("Adrian")
                        .bold()
                        .foregroundColor(.black)
                        .offset(x:0, y:10)
                    Text("Ok ill do that just send me a message when you arasdasdasdsadasdasdasdasdasdasdasdsadasdas")
                        .frame(maxHeight: 50)
                }
                Spacer()
                Text("8:21 pm")
                    .padding(.bottom, 35)
            }.padding(.horizontal)

        }
    }
}
