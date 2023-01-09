//
//  ChatView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            VStack {
                HeaderView()
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(0...10, id: \.self) { message in
                            MessageView(message: Message())
                        }
                    }
                    .padding(.top, 20)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
//                    .onChange(of: viewModel.lastMessageId) { id in
//                        withAnimation {
//                            proxy.scrollTo(id, anchor: .bottom)
//                        }
//                    }
                }
            }
            .background(Color("Peach"))
            InputFieldView()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


struct HeaderView: View {
    var imageUrl = URL(string:"https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=846&q=80")
    var name = "Sarah Smith"
    
    var body: some View {
        HStack {
            AsyncImage(url: imageUrl) {image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50, height:50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            .padding(.leading)
            .padding(.vertical,5)
            VStack(alignment:.leading) {
                Text("Ben Dennet").bold().font(.title3)
                Text("Online").font(.caption2).foregroundColor(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "video").foregroundColor(.blue).font(.title3)
            Image(systemName: "phone").padding().foregroundColor(.blue).font(.title3)
        }
    }
}
